// C++ Native Messaging host
// https://browserext.github.io/native-messaging/
// https://developer.chrome.com/docs/apps/nativeMessaging/
// https://www.reddit.com/user/Eternal_Weeb/
// guest271314, 2022
#include <iostream>
#include <vector>
#include <cstdint>
#include <algorithm>
#include <span> // Requires C++20

/**
 * Reads a length-prefixed message from stdin.
 * Returns a vector containing the data. 
 * The length is updated via the pointer to match your main() logic.
 */
std::vector<uint8_t> getMessage(size_t* inputLength) {
    uint32_t messageLength = 0;

    // Read 4-byte header
    if (!std::cin.read(reinterpret_cast<char*>(&messageLength), sizeof(uint32_t))) {
        *inputLength = 0;
        return {};
    }

    // Allocate and read payload
    std::vector<uint8_t> buffer(messageLength);
    if (!std::cin.read(reinterpret_cast<char*>(buffer.data()), messageLength)) {
        *inputLength = 0;
        return {};
    }

    *inputLength = messageLength;
    return buffer;
}

/**
 * Writes a single chunk to stdout with a 4-byte Little-Endian header.
 */
void writeChunk(std::span<const uint8_t> body, uint8_t prepend, uint8_t append) {
    uint32_t totalLen = static_cast<uint32_t>(body.size() + (prepend ? 1 : 0) + (append ? 1 : 0));

    // Manual Little-Endian header to ensure cross-platform compatibility
    uint8_t header[4];
    header[0] = (totalLen >> 0) & 0xFF;
    header[1] = (totalLen >> 8) & 0xFF;
    header[2] = (totalLen >> 16) & 0xFF;
    header[3] = (totalLen >> 24) & 0xFF;

    std::cout.write(reinterpret_cast<const char*>(header), 4);
    if (prepend) std::cout.put(static_cast<char>(prepend));
    std::cout.write(reinterpret_cast<const char*>(body.data()), body.size());
    if (append) std::cout.put(static_cast<char>(append));
    
    std::cout.flush();
}

/**
 * Splits a large message into 1MB chunks and ensures each is a valid JSON array fragment.
 */
void sendMessage(const uint8_t* messagePtr, size_t length) {
    if (!messagePtr || length == 0) return;

    const size_t CHUNK_SIZE = 1024 * 1024;
    const uint8_t COMMA = 44;
    const uint8_t OPEN_BRACKET = 91;
    const uint8_t CLOSE_BRACKET = 93;

    // Wrap the raw pointer in a span for easy slicing
    std::span<const uint8_t> message(messagePtr, length);

    if (length <= CHUNK_SIZE) {
        writeChunk(message, 0, 0);
        return;
    }

    size_t index = 0;
    while (index < length) {
        size_t searchStart = index + CHUNK_SIZE - 8;
        size_t splitIndex = length;

        if (searchStart < length) {
            // Find next comma using optimized std::find
            auto it = std::find(message.begin() + searchStart, message.end(), COMMA);
            if (it != message.end()) {
                splitIndex = std::distance(message.begin(), it);
            }
        }

        std::span<const uint8_t> rawChunk = message.subspan(index, splitIndex - index);
        
        uint8_t prepend = 0;
        uint8_t append = 0;
        std::span<const uint8_t> body = rawChunk;

        // JSON wrapping logic
        if (rawChunk.front() == OPEN_BRACKET && rawChunk.back() != CLOSE_BRACKET) {
            append = CLOSE_BRACKET;
        } else if (rawChunk.front() == COMMA) {
            prepend = OPEN_BRACKET;
            body = body.subspan(1); // Omit the leading comma
            if (rawChunk.back() != CLOSE_BRACKET) {
                append = CLOSE_BRACKET;
            }
        }

        writeChunk(body, prepend, append);
        index = splitIndex;
    }
}

int main() {
    // Speed up standard I/O for binary data
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(NULL);

    while (true) {
        size_t messageLength = 0;
        // getMessage returns the vector; main manages its scope
        std::vector<uint8_t> message = getMessage(&messageLength);
        
        if (messageLength > 0) {
            sendMessage(message.data(), messageLength);
        } else {
            if (std::cin.eof()) break;
        }
    }
    return 0;
}