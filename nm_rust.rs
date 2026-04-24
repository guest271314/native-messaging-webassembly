#!/usr/bin/env -S /home/user/.cargo/bin/cargo -Zscript
// CARGO_HOME=/media/user/1ba75ad8-75c6-46d3-a54c-05dc0ceb12b1/rust/.cargo RUSTUP_HOME=/media/user/1ba75ad8-75c6-46d3-a54c-05dc0ceb12b1/rust/.rustup  /media/user/1ba75ad8-75c6-46d3-a54c-05dc0ceb12b1/rust/.cargo/bin/rustc nm_rust_gemini.rs

// https://gist.github.com/guest271314/c88d281572aadb2cc6265e3e9eb09810
use std::io::{self, Read, Write};

const CHUNK_SIZE: usize = 1024 * 1024; // 1MB
const COMMA: u8 = b',';
const OPEN_BRACKET: u8 = b'[';
const CLOSE_BRACKET: u8 = b']';

fn main() -> Result<(), Box<dyn std::error::Error>> {
  loop {
    let msg = get_message()?;
    // eprintln!("{:?}", std::str::from_utf8(&msg));
    send_message(&msg)?;
  }
}

pub fn get_message() -> io::Result<Vec<u8>> {
  let mut instream = io::stdin();
  let mut length = [0; 4];
  instream.read_exact(&mut length)?;
  let mut buffer = vec![0; u32::from_ne_bytes(length) as usize];
  instream.read_exact(&mut buffer)?;
  Ok(buffer)
}

fn send_message(message: &[u8]) -> io::Result<()> {
  let stdout = io::stdout();
  let mut handle = stdout.lock(); // Locking stdout is faster for repeated writes

  if message.len() <= CHUNK_SIZE {
    handle.write_all(&(message.len() as u32).to_le_bytes())?;
    handle.write_all(message)?;
    let _ = handle.flush();
    return Ok(());
  }

  let mut index = 0;
  while index < message.len() {
    // 1. Determine split point
    let search_start = (index + CHUNK_SIZE).saturating_sub(8);
    let split_index = if search_start >= message.len() {
      message.len()
    } else {
      // Find next comma or end of slice
      message[search_start..]
        .iter()
        .position(|&b| b == COMMA)
        .map(|p| search_start + p)
        .unwrap_or(message.len())
    };

    let raw_chunk = &message[index..split_index];
    if raw_chunk.is_empty() {
      break;
    }

    let start_byte = raw_chunk[0];
    let end_byte = raw_chunk[raw_chunk.len() - 1];

    // 2. Determine necessary wrapping
    let mut needs_open = false;
    let mut needs_close = false;
    let mut body = raw_chunk;

    if start_byte == OPEN_BRACKET {
      if end_byte != CLOSE_BRACKET {
        needs_close = true;
      }
    } else if start_byte == COMMA {
      needs_open = true;
      body = &raw_chunk[1..]; // Skip the leading comma
      if body.last() != Some(&CLOSE_BRACKET) {
        needs_close = true;
      }
    }

    // 3. Calculate total length and write
    let total_payload_len =
      (if needs_open { 1 } else { 0 }) + body.len() + (if needs_close { 1 } else { 0 });

    // Write 4-byte Little Endian header
    handle.write_all(&(total_payload_len as u32).to_le_bytes())?;

    // Write the body parts (Vectorized-style I/O)
    if needs_open {
      handle.write_all(&[OPEN_BRACKET])?;
    }
    handle.write_all(body)?;
    if needs_close {
      handle.write_all(&[CLOSE_BRACKET])?;
    }

    handle.flush()?;
    index = split_index;
  }

  Ok(())
}

// fn write_chunk<W: Write>(writer: &mut W, data: &[u8]) -> io::Result<()> {}
