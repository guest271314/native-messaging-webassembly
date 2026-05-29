(component
  (type $ty-wasi:cli/exit@0.2.6 (;0;)
    (instance
      (type (;0;) (result))
      (type (;1;) (func (param "status" 0)))
      (export (;0;) "exit" (func (type 1)))
    )
  )
  (import "wasi:cli/exit@0.2.6" (instance $wasi:cli/exit@0.2.6 (;0;) (type $ty-wasi:cli/exit@0.2.6)))
  (type $ty-wasi:io/error@0.2.6 (;1;)
    (instance
      (export (;0;) "error" (type (sub resource)))
    )
  )
  (import "wasi:io/error@0.2.6" (instance $wasi:io/error@0.2.6 (;1;) (type $ty-wasi:io/error@0.2.6)))
  (alias export $wasi:io/error@0.2.6 "error" (type $error (;2;)))
  (type $ty-wasi:io/streams@0.2.6 (;3;)
    (instance
      (export (;0;) "output-stream" (type (sub resource)))
      (alias outer 1 $error (type (;1;)))
      (export (;2;) "error" (type (eq 1)))
      (type (;3;) (own 2))
      (type (;4;) (variant (case "last-operation-failed" 3) (case "closed")))
      (export (;5;) "stream-error" (type (eq 4)))
      (export (;6;) "input-stream" (type (sub resource)))
      (type (;7;) (borrow 6))
      (type (;8;) (list u8))
      (type (;9;) (result 8 (error 5)))
      (type (;10;) (func (param "self" 7) (param "len" u64) (result 9)))
      (export (;0;) "[method]input-stream.read" (func (type 10)))
      (export (;1;) "[method]input-stream.blocking-read" (func (type 10)))
      (type (;11;) (borrow 0))
      (type (;12;) (result u64 (error 5)))
      (type (;13;) (func (param "self" 11) (result 12)))
      (export (;2;) "[method]output-stream.check-write" (func (type 13)))
      (type (;14;) (result (error 5)))
      (type (;15;) (func (param "self" 11) (param "contents" 8) (result 14)))
      (export (;3;) "[method]output-stream.write" (func (type 15)))
      (export (;4;) "[method]output-stream.blocking-write-and-flush" (func (type 15)))
      (type (;16;) (func (param "self" 11) (result 14)))
      (export (;5;) "[method]output-stream.blocking-flush" (func (type 16)))
    )
  )
  (import "wasi:io/streams@0.2.6" (instance $wasi:io/streams@0.2.6 (;2;) (type $ty-wasi:io/streams@0.2.6)))
  (alias export $wasi:io/streams@0.2.6 "input-stream" (type $input-stream (;4;)))
  (type $ty-wasi:cli/stdin@0.2.6 (;5;)
    (instance
      (alias outer 1 $input-stream (type (;0;)))
      (export (;1;) "input-stream" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (func (result 2)))
      (export (;0;) "get-stdin" (func (type 3)))
    )
  )
  (import "wasi:cli/stdin@0.2.6" (instance $wasi:cli/stdin@0.2.6 (;3;) (type $ty-wasi:cli/stdin@0.2.6)))
  (alias export $wasi:io/streams@0.2.6 "output-stream" (type $output-stream (;6;)))
  (type $ty-wasi:cli/stdout@0.2.6 (;7;)
    (instance
      (alias outer 1 $output-stream (type (;0;)))
      (export (;1;) "output-stream" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (func (result 2)))
      (export (;0;) "get-stdout" (func (type 3)))
    )
  )
  (import "wasi:cli/stdout@0.2.6" (instance $wasi:cli/stdout@0.2.6 (;4;) (type $ty-wasi:cli/stdout@0.2.6)))
  (alias export $wasi:io/streams@0.2.6 "output-stream" (type $"#type8 output-stream" (@name "output-stream") (;8;)))
  (type $ty-wasi:cli/stderr@0.2.6 (;9;)
    (instance
      (alias outer 1 $"#type8 output-stream" (type (;0;)))
      (export (;1;) "output-stream" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (func (result 2)))
      (export (;0;) "get-stderr" (func (type 3)))
    )
  )
  (import "wasi:cli/stderr@0.2.6" (instance $wasi:cli/stderr@0.2.6 (;5;) (type $ty-wasi:cli/stderr@0.2.6)))
  (type $ty-wasi:clocks/wall-clock@0.2.6 (;10;)
    (instance
      (type (;0;) (record (field "seconds" u64) (field "nanoseconds" u32)))
      (export (;1;) "datetime" (type (eq 0)))
    )
  )
  (import "wasi:clocks/wall-clock@0.2.6" (instance $wasi:clocks/wall-clock@0.2.6 (;6;) (type $ty-wasi:clocks/wall-clock@0.2.6)))
  (alias export $wasi:io/streams@0.2.6 "error" (type $"#type11 error" (@name "error") (;11;)))
  (alias export $wasi:io/streams@0.2.6 "input-stream" (type $"#type12 input-stream" (@name "input-stream") (;12;)))
  (alias export $wasi:io/streams@0.2.6 "output-stream" (type $"#type13 output-stream" (@name "output-stream") (;13;)))
  (alias export $wasi:clocks/wall-clock@0.2.6 "datetime" (type $datetime (;14;)))
  (type $ty-wasi:filesystem/types@0.2.6 (;15;)
    (instance
      (alias outer 1 $"#type11 error" (type (;0;)))
      (export (;1;) "error" (type (eq 0)))
      (type (;2;) (enum "access" "would-block" "already" "bad-descriptor" "busy" "deadlock" "quota" "exist" "file-too-large" "illegal-byte-sequence" "in-progress" "interrupted" "invalid" "io" "is-directory" "loop" "too-many-links" "message-size" "name-too-long" "no-device" "no-entry" "no-lock" "insufficient-memory" "insufficient-space" "not-directory" "not-empty" "not-recoverable" "unsupported" "no-tty" "no-such-device" "overflow" "not-permitted" "pipe" "read-only" "invalid-seek" "text-file-busy" "cross-device"))
      (export (;3;) "error-code" (type (eq 2)))
      (export (;4;) "descriptor" (type (sub resource)))
      (type (;5;) u64)
      (export (;6;) "filesize" (type (eq 5)))
      (alias outer 1 $"#type12 input-stream" (type (;7;)))
      (export (;8;) "input-stream" (type (eq 7)))
      (alias outer 1 $"#type13 output-stream" (type (;9;)))
      (export (;10;) "output-stream" (type (eq 9)))
      (type (;11;) (enum "unknown" "block-device" "character-device" "directory" "fifo" "symbolic-link" "regular-file" "socket"))
      (export (;12;) "descriptor-type" (type (eq 11)))
      (type (;13;) u64)
      (export (;14;) "link-count" (type (eq 13)))
      (alias outer 1 $datetime (type (;15;)))
      (export (;16;) "datetime" (type (eq 15)))
      (type (;17;) (option 16))
      (type (;18;) (record (field "type" 12) (field "link-count" 14) (field "size" 6) (field "data-access-timestamp" 17) (field "data-modification-timestamp" 17) (field "status-change-timestamp" 17)))
      (export (;19;) "descriptor-stat" (type (eq 18)))
      (type (;20;) (borrow 4))
      (type (;21;) (own 8))
      (type (;22;) (result 21 (error 3)))
      (type (;23;) (func (param "self" 20) (param "offset" 6) (result 22)))
      (export (;0;) "[method]descriptor.read-via-stream" (func (type 23)))
      (type (;24;) (own 10))
      (type (;25;) (result 24 (error 3)))
      (type (;26;) (func (param "self" 20) (param "offset" 6) (result 25)))
      (export (;1;) "[method]descriptor.write-via-stream" (func (type 26)))
      (type (;27;) (func (param "self" 20) (result 25)))
      (export (;2;) "[method]descriptor.append-via-stream" (func (type 27)))
      (type (;28;) (result 12 (error 3)))
      (type (;29;) (func (param "self" 20) (result 28)))
      (export (;3;) "[method]descriptor.get-type" (func (type 29)))
      (type (;30;) (result 19 (error 3)))
      (type (;31;) (func (param "self" 20) (result 30)))
      (export (;4;) "[method]descriptor.stat" (func (type 31)))
      (type (;32;) (borrow 1))
      (type (;33;) (option 3))
      (type (;34;) (func (param "err" 32) (result 33)))
      (export (;5;) "filesystem-error-code" (func (type 34)))
    )
  )
  (import "wasi:filesystem/types@0.2.6" (instance $wasi:filesystem/types@0.2.6 (;7;) (type $ty-wasi:filesystem/types@0.2.6)))
  (alias export $wasi:filesystem/types@0.2.6 "descriptor" (type $descriptor (;16;)))
  (type $ty-wasi:filesystem/preopens@0.2.6 (;17;)
    (instance
      (alias outer 1 $descriptor (type (;0;)))
      (export (;1;) "descriptor" (type (eq 0)))
      (type (;2;) (own 1))
      (type (;3;) (tuple 2 string))
      (type (;4;) (list 3))
      (type (;5;) (func (result 4)))
      (export (;0;) "get-directories" (func (type 5)))
    )
  )
  (import "wasi:filesystem/preopens@0.2.6" (instance $wasi:filesystem/preopens@0.2.6 (;8;) (type $ty-wasi:filesystem/preopens@0.2.6)))
  (core module $main (;0;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32) (result i32)))
    (type (;2;) (func))
    (type (;3;) (func (param i32 i32) (result i32)))
    (type (;4;) (func (param i32 i32)))
    (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;6;) (func (param i32 i32 i32) (result i32)))
    (type (;7;) (func (param i32 i32 i64)))
    (type (;8;) (func (result i32)))
    (type (;9;) (func (param i32 i32 i32 i32)))
    (type (;10;) (func (param i32 i32 i32)))
    (import "wasi_snapshot_preview1" "fd_write" (func (;0;) (type 5)))
    (import "wasi_snapshot_preview1" "proc_exit" (func (;1;) (type 0)))
    (import "wasi_snapshot_preview1" "fd_read" (func (;2;) (type 5)))
    (memory (;0;) 1)
    (global (;0;) (mut i32) i32.const 0)
    (global (;1;) (mut i32) i32.const 0)
    (global (;2;) (mut i32) i32.const 0)
    (global (;3;) (mut i32) i32.const 0)
    (global (;4;) (mut i32) i32.const 0)
    (global (;5;) (mut i32) i32.const 0)
    (global (;6;) (mut i32) i32.const 0)
    (global (;7;) (mut i32) i32.const 0)
    (global (;8;) (mut i32) i32.const 0)
    (global (;9;) (mut i32) i32.const 0)
    (global (;10;) (mut i32) i32.const 0)
    (global (;11;) (mut i32) i32.const 37660)
    (global (;12;) (mut i32) i32.const 0)
    (export "main" (func 27))
    (export "memory" (memory 0))
    (export "_start" (func 17))
    (func (;3;) (type 6) (param i32 i32 i32) (result i32)
      (local i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          global.get 0
          i32.const 3
          i32.sub
          br_table 1 (;@1;) 1 (;@1;) 1 (;@1;) 0 (;@2;)
        end
        unreachable
      end
      local.get 0
      local.get 1
      i32.const 1
      i32.shl
      i32.add
      local.set 3
      local.get 2
      local.set 1
      loop ;; label = @1
        local.get 0
        local.get 3
        i32.lt_u
        if ;; label = @2
          local.get 0
          i32.load16_u
          local.tee 4
          i32.const 128
          i32.lt_u
          if (result i32) ;; label = @3
            local.get 1
            local.get 4
            i32.store8
            local.get 1
            i32.const 1
            i32.add
          else
            local.get 4
            i32.const 2048
            i32.lt_u
            if (result i32) ;; label = @4
              local.get 1
              local.get 4
              i32.const 6
              i32.shr_u
              i32.const 192
              i32.or
              local.get 4
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.const 8
              i32.shl
              i32.or
              i32.store16
              local.get 1
              i32.const 2
              i32.add
            else
              local.get 4
              i32.const 63488
              i32.and
              i32.const 55296
              i32.eq
              if ;; label = @5
                local.get 4
                i32.const 56320
                i32.lt_u
                local.get 0
                i32.const 2
                i32.add
                local.get 3
                i32.lt_u
                i32.and
                if ;; label = @6
                  local.get 0
                  i32.load16_u offset=2
                  local.tee 5
                  i32.const 64512
                  i32.and
                  i32.const 56320
                  i32.eq
                  if ;; label = @7
                    local.get 1
                    local.get 4
                    i32.const 1023
                    i32.and
                    i32.const 10
                    i32.shl
                    i32.const 65536
                    i32.add
                    local.get 5
                    i32.const 1023
                    i32.and
                    i32.or
                    local.tee 4
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 24
                    i32.shl
                    local.get 4
                    i32.const 6
                    i32.shr_u
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 16
                    i32.shl
                    i32.or
                    local.get 4
                    i32.const 12
                    i32.shr_u
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 8
                    i32.shl
                    i32.or
                    local.get 4
                    i32.const 18
                    i32.shr_u
                    i32.const 240
                    i32.or
                    i32.or
                    i32.store
                    local.get 1
                    i32.const 4
                    i32.add
                    local.set 1
                    local.get 0
                    i32.const 4
                    i32.add
                    local.set 0
                    br 6 (;@1;)
                  end
                end
              end
              local.get 1
              local.get 4
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              local.get 4
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.const 8
              i32.shl
              i32.or
              i32.store16
              local.get 1
              local.get 4
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=2
              local.get 1
              i32.const 3
              i32.add
            end
          end
          local.set 1
          local.get 0
          i32.const 2
          i32.add
          local.set 0
          br 1 (;@1;)
        end
      end
      local.get 1
      local.get 2
      i32.sub
    )
    (func (;4;) (type 2)
      (local i32 i32)
      i32.const 1472
      call 6
      i32.const 1168
      call 6
      i32.const 1280
      call 6
      i32.const 1056
      call 6
      global.get 5
      local.tee 1
      i32.load offset=4
      i32.const -4
      i32.and
      local.set 0
      loop ;; label = @1
        local.get 0
        local.get 1
        i32.ne
        if ;; label = @2
          local.get 0
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          if ;; label = @3
            i32.const 0
            i32.const 1344
            i32.const 160
            i32.const 16
            call 19
            unreachable
          end
          local.get 0
          i32.const 20
          i32.add
          call 16
          local.get 0
          i32.load offset=4
          i32.const -4
          i32.and
          local.set 0
          br 1 (;@1;)
        end
      end
    )
    (func (;5;) (type 0) (param i32)
      (local i32 i32 i32)
      local.get 0
      global.get 6
      i32.eq
      if ;; label = @1
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.eqz
        if ;; label = @2
          i32.const 0
          i32.const 1344
          i32.const 148
          i32.const 30
          call 19
          unreachable
        end
        local.get 1
        global.set 6
      end
      block ;; label = @1
        local.get 0
        i32.load offset=4
        i32.const -4
        i32.and
        local.tee 1
        i32.eqz
        if ;; label = @2
          local.get 0
          i32.load offset=8
          i32.eqz
          local.get 0
          i32.const 37660
          i32.lt_u
          i32.and
          i32.eqz
          if ;; label = @3
            i32.const 0
            i32.const 1344
            i32.const 128
            i32.const 18
            call 19
            unreachable
          end
          br 1 (;@1;)
        end
        local.get 0
        i32.load offset=8
        local.tee 2
        i32.eqz
        if ;; label = @2
          i32.const 0
          i32.const 1344
          i32.const 132
          i32.const 16
          call 19
          unreachable
        end
        local.get 1
        local.get 2
        i32.store offset=8
        local.get 2
        local.get 1
        local.get 2
        i32.load offset=4
        i32.const 3
        i32.and
        i32.or
        i32.store offset=4
      end
      global.get 7
      local.set 2
      local.get 0
      i32.load offset=12
      local.tee 1
      i32.const 2
      i32.le_u
      if (result i32) ;; label = @1
        i32.const 1
      else
        local.get 1
        i32.const 4864
        i32.load
        i32.gt_u
        if ;; label = @2
          i32.const 1472
          i32.const 1536
          i32.const 21
          i32.const 28
          call 19
          unreachable
        end
        local.get 1
        i32.const 2
        i32.shl
        i32.const 4868
        i32.add
        i32.load
        i32.const 32
        i32.and
      end
      local.set 3
      local.get 2
      i32.load offset=8
      local.set 1
      local.get 0
      global.get 8
      i32.eqz
      i32.const 2
      local.get 3
      select
      local.get 2
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store offset=8
      local.get 1
      local.get 0
      local.get 1
      i32.load offset=4
      i32.const 3
      i32.and
      i32.or
      i32.store offset=4
      local.get 2
      local.get 0
      i32.store offset=8
    )
    (func (;6;) (type 0) (param i32)
      local.get 0
      i32.eqz
      if ;; label = @1
        return
      end
      global.get 8
      local.get 0
      i32.const 20
      i32.sub
      local.tee 0
      i32.load offset=4
      i32.const 3
      i32.and
      i32.eq
      if ;; label = @1
        local.get 0
        call 5
        global.get 4
        i32.const 1
        i32.add
        global.set 4
      end
    )
    (func (;7;) (type 4) (param i32 i32)
      (local i32 i32 i32 i32)
      local.get 1
      i32.load
      local.tee 3
      i32.const 1
      i32.and
      i32.eqz
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 268
        i32.const 14
        call 19
        unreachable
      end
      local.get 3
      i32.const -4
      i32.and
      local.tee 3
      i32.const 12
      i32.lt_u
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 270
        i32.const 14
        call 19
        unreachable
      end
      local.get 3
      i32.const 256
      i32.lt_u
      if (result i32) ;; label = @1
        local.get 3
        i32.const 4
        i32.shr_u
      else
        i32.const 31
        i32.const 1073741820
        local.get 3
        local.get 3
        i32.const 1073741820
        i32.ge_u
        select
        local.tee 3
        i32.clz
        i32.sub
        local.tee 4
        i32.const 7
        i32.sub
        local.set 2
        local.get 3
        local.get 4
        i32.const 4
        i32.sub
        i32.shr_u
        i32.const 16
        i32.xor
      end
      local.tee 4
      i32.const 16
      i32.lt_u
      local.get 2
      i32.const 23
      i32.lt_u
      i32.and
      i32.eqz
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 284
        i32.const 14
        call 19
        unreachable
      end
      local.get 1
      i32.load offset=8
      local.set 5
      local.get 1
      i32.load offset=4
      local.tee 3
      if ;; label = @1
        local.get 3
        local.get 5
        i32.store offset=8
      end
      local.get 5
      if ;; label = @1
        local.get 5
        local.get 3
        i32.store offset=4
      end
      local.get 1
      local.get 0
      local.get 2
      i32.const 4
      i32.shl
      local.get 4
      i32.add
      i32.const 2
      i32.shl
      i32.add
      local.tee 1
      i32.load offset=96
      i32.eq
      if ;; label = @1
        local.get 1
        local.get 5
        i32.store offset=96
        local.get 5
        i32.eqz
        if ;; label = @2
          local.get 0
          local.get 2
          i32.const 2
          i32.shl
          i32.add
          local.tee 1
          i32.load offset=4
          i32.const -2
          local.get 4
          i32.rotl
          i32.and
          local.set 3
          local.get 1
          local.get 3
          i32.store offset=4
          local.get 3
          i32.eqz
          if ;; label = @3
            local.get 0
            local.get 0
            i32.load
            i32.const -2
            local.get 2
            i32.rotl
            i32.and
            i32.store
          end
        end
      end
    )
    (func (;8;) (type 4) (param i32 i32)
      (local i32 i32 i32 i32 i32)
      local.get 1
      i32.eqz
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 201
        i32.const 14
        call 19
        unreachable
      end
      local.get 1
      i32.load
      local.tee 3
      i32.const 1
      i32.and
      i32.eqz
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 203
        i32.const 14
        call 19
        unreachable
      end
      local.get 1
      i32.const 4
      i32.add
      local.get 1
      i32.load
      i32.const -4
      i32.and
      i32.add
      local.tee 4
      i32.load
      local.tee 2
      i32.const 1
      i32.and
      if ;; label = @1
        local.get 0
        local.get 4
        call 7
        local.get 1
        local.get 3
        i32.const 4
        i32.add
        local.get 2
        i32.const -4
        i32.and
        i32.add
        local.tee 3
        i32.store
        local.get 1
        i32.const 4
        i32.add
        local.get 1
        i32.load
        i32.const -4
        i32.and
        i32.add
        local.tee 4
        i32.load
        local.set 2
      end
      local.get 3
      i32.const 2
      i32.and
      if ;; label = @1
        local.get 1
        i32.const 4
        i32.sub
        i32.load
        local.tee 1
        i32.load
        local.tee 6
        i32.const 1
        i32.and
        i32.eqz
        if ;; label = @2
          i32.const 0
          i32.const 1616
          i32.const 221
          i32.const 16
          call 19
          unreachable
        end
        local.get 0
        local.get 1
        call 7
        local.get 1
        local.get 6
        i32.const 4
        i32.add
        local.get 3
        i32.const -4
        i32.and
        i32.add
        local.tee 3
        i32.store
      end
      local.get 4
      local.get 2
      i32.const 2
      i32.or
      i32.store
      local.get 3
      i32.const -4
      i32.and
      local.tee 2
      i32.const 12
      i32.lt_u
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 233
        i32.const 14
        call 19
        unreachable
      end
      local.get 4
      local.get 1
      i32.const 4
      i32.add
      local.get 2
      i32.add
      i32.ne
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 234
        i32.const 14
        call 19
        unreachable
      end
      local.get 4
      i32.const 4
      i32.sub
      local.get 1
      i32.store
      local.get 2
      i32.const 256
      i32.lt_u
      if (result i32) ;; label = @1
        local.get 2
        i32.const 4
        i32.shr_u
      else
        i32.const 31
        i32.const 1073741820
        local.get 2
        local.get 2
        i32.const 1073741820
        i32.ge_u
        select
        local.tee 2
        i32.clz
        i32.sub
        local.tee 3
        i32.const 7
        i32.sub
        local.set 5
        local.get 2
        local.get 3
        i32.const 4
        i32.sub
        i32.shr_u
        i32.const 16
        i32.xor
      end
      local.tee 2
      i32.const 16
      i32.lt_u
      local.get 5
      i32.const 23
      i32.lt_u
      i32.and
      i32.eqz
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 251
        i32.const 14
        call 19
        unreachable
      end
      local.get 0
      local.get 5
      i32.const 4
      i32.shl
      local.get 2
      i32.add
      i32.const 2
      i32.shl
      i32.add
      i32.load offset=96
      local.set 3
      local.get 1
      i32.const 0
      i32.store offset=4
      local.get 1
      local.get 3
      i32.store offset=8
      local.get 3
      if ;; label = @1
        local.get 3
        local.get 1
        i32.store offset=4
      end
      local.get 0
      local.get 5
      i32.const 4
      i32.shl
      local.get 2
      i32.add
      i32.const 2
      i32.shl
      i32.add
      local.get 1
      i32.store offset=96
      local.get 0
      local.get 0
      i32.load
      i32.const 1
      local.get 5
      i32.shl
      i32.or
      i32.store
      local.get 0
      local.get 5
      i32.const 2
      i32.shl
      i32.add
      local.tee 0
      local.get 0
      i32.load offset=4
      i32.const 1
      local.get 2
      i32.shl
      i32.or
      i32.store offset=4
    )
    (func (;9;) (type 7) (param i32 i32 i64)
      (local i32 i32 i32)
      local.get 2
      local.get 1
      i64.extend_i32_u
      i64.lt_u
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 382
        i32.const 14
        call 19
        unreachable
      end
      local.get 1
      i32.const 19
      i32.add
      i32.const -16
      i32.and
      i32.const 4
      i32.sub
      local.set 1
      local.get 0
      i32.load offset=1568
      local.tee 3
      if ;; label = @1
        local.get 3
        i32.const 4
        i32.add
        local.get 1
        i32.gt_u
        if ;; label = @2
          i32.const 0
          i32.const 1616
          i32.const 389
          i32.const 16
          call 19
          unreachable
        end
        local.get 1
        i32.const 16
        i32.sub
        local.tee 5
        local.get 3
        i32.eq
        if ;; label = @2
          local.get 3
          i32.load
          local.set 4
          local.get 5
          local.set 1
        end
      else
        local.get 0
        i32.const 1572
        i32.add
        local.get 1
        i32.gt_u
        if ;; label = @2
          i32.const 0
          i32.const 1616
          i32.const 402
          i32.const 5
          call 19
          unreachable
        end
      end
      local.get 2
      i32.wrap_i64
      i32.const -16
      i32.and
      local.get 1
      i32.sub
      local.tee 3
      i32.const 20
      i32.lt_u
      if ;; label = @1
        return
      end
      local.get 1
      local.get 4
      i32.const 2
      i32.and
      local.get 3
      i32.const 8
      i32.sub
      local.tee 3
      i32.const 1
      i32.or
      i32.or
      i32.store
      local.get 1
      i32.const 0
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 1
      i32.const 4
      i32.add
      local.get 3
      i32.add
      local.tee 3
      i32.const 2
      i32.store
      local.get 0
      local.get 3
      i32.store offset=1568
      local.get 0
      local.get 1
      call 8
    )
    (func (;10;) (type 2)
      (local i32 i32)
      memory.size
      local.tee 0
      i32.const 0
      i32.le_s
      if (result i32) ;; label = @1
        i32.const 1
        local.get 0
        i32.sub
        memory.grow
        i32.const 0
        i32.lt_s
      else
        i32.const 0
      end
      if ;; label = @1
        unreachable
      end
      i32.const 37664
      i32.const 0
      i32.store
      i32.const 39232
      i32.const 0
      i32.store
      loop ;; label = @1
        local.get 1
        i32.const 23
        i32.lt_u
        if ;; label = @2
          local.get 1
          i32.const 2
          i32.shl
          i32.const 37664
          i32.add
          i32.const 0
          i32.store offset=4
          i32.const 0
          local.set 0
          loop ;; label = @3
            local.get 0
            i32.const 16
            i32.lt_u
            if ;; label = @4
              local.get 1
              i32.const 4
              i32.shl
              local.get 0
              i32.add
              i32.const 2
              i32.shl
              i32.const 37664
              i32.add
              i32.const 0
              i32.store offset=96
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              br 1 (;@3;)
            end
          end
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          br 1 (;@1;)
        end
      end
      i32.const 37664
      i32.const 39236
      memory.size
      i64.extend_i32_s
      i64.const 16
      i64.shl
      call 9
      i32.const 37664
      global.set 10
    )
    (func (;11;) (type 8) (result i32)
      (local i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              global.get 3
              br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 3 (;@1;)
            end
            i32.const 1
            global.set 3
            i32.const 0
            global.set 4
            call 4
            global.get 7
            global.set 6
            global.get 4
            return
          end
          global.get 8
          i32.eqz
          local.set 1
          global.get 6
          i32.load offset=4
          i32.const -4
          i32.and
          local.set 0
          loop ;; label = @3
            local.get 0
            global.get 7
            i32.ne
            if ;; label = @4
              local.get 0
              global.set 6
              local.get 1
              local.get 0
              i32.load offset=4
              local.tee 2
              i32.const 3
              i32.and
              i32.ne
              if ;; label = @5
                local.get 0
                local.get 2
                i32.const -4
                i32.and
                local.get 1
                i32.or
                i32.store offset=4
                i32.const 0
                global.set 4
                local.get 0
                i32.const 20
                i32.add
                call 16
                global.get 4
                return
              end
              local.get 0
              i32.load offset=4
              i32.const -4
              i32.and
              local.set 0
              br 1 (;@3;)
            end
          end
          i32.const 0
          global.set 4
          call 4
          global.get 7
          global.get 6
          i32.load offset=4
          i32.const -4
          i32.and
          i32.eq
          if ;; label = @3
            global.get 11
            local.set 0
            loop ;; label = @4
              local.get 0
              i32.const 37660
              i32.lt_u
              if ;; label = @5
                local.get 0
                i32.load
                call 6
                local.get 0
                i32.const 4
                i32.add
                local.set 0
                br 1 (;@4;)
              end
            end
            global.get 6
            i32.load offset=4
            i32.const -4
            i32.and
            local.set 0
            loop ;; label = @4
              local.get 0
              global.get 7
              i32.ne
              if ;; label = @5
                local.get 1
                local.get 0
                i32.load offset=4
                local.tee 2
                i32.const 3
                i32.and
                i32.ne
                if ;; label = @6
                  local.get 0
                  local.get 2
                  i32.const -4
                  i32.and
                  local.get 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 20
                  i32.add
                  call 16
                end
                local.get 0
                i32.load offset=4
                i32.const -4
                i32.and
                local.set 0
                br 1 (;@4;)
              end
            end
            global.get 9
            local.set 0
            global.get 7
            global.set 9
            local.get 0
            global.set 7
            local.get 1
            global.set 8
            local.get 0
            i32.load offset=4
            i32.const -4
            i32.and
            global.set 6
            i32.const 2
            global.set 3
          end
          global.get 4
          return
        end
        global.get 6
        local.tee 0
        global.get 7
        i32.ne
        if ;; label = @2
          local.get 0
          i32.load offset=4
          local.tee 1
          i32.const -4
          i32.and
          global.set 6
          global.get 8
          i32.eqz
          local.get 1
          i32.const 3
          i32.and
          i32.ne
          if ;; label = @3
            i32.const 0
            i32.const 1344
            i32.const 229
            i32.const 20
            call 19
            unreachable
          end
          local.get 0
          i32.const 37660
          i32.lt_u
          if ;; label = @3
            local.get 0
            i32.const 0
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store offset=8
          else
            global.get 1
            local.get 0
            i32.load
            i32.const -4
            i32.and
            i32.const 4
            i32.add
            i32.sub
            global.set 1
            local.get 0
            i32.const 4
            i32.add
            local.tee 0
            i32.const 37660
            i32.ge_u
            if ;; label = @4
              global.get 10
              i32.eqz
              if ;; label = @5
                call 10
              end
              global.get 10
              local.get 0
              i32.const 4
              i32.sub
              local.set 2
              local.get 0
              i32.const 15
              i32.and
              i32.const 1
              local.get 0
              select
              if (result i32) ;; label = @5
                i32.const 1
              else
                local.get 2
                i32.load
                i32.const 1
                i32.and
              end
              if ;; label = @5
                i32.const 0
                i32.const 1616
                i32.const 562
                i32.const 3
                call 19
                unreachable
              end
              local.get 2
              local.get 2
              i32.load
              i32.const 1
              i32.or
              i32.store
              local.get 2
              call 8
            end
          end
          i32.const 10
          return
        end
        global.get 7
        global.get 7
        i32.store offset=4
        global.get 7
        global.get 7
        i32.store offset=8
        i32.const 0
        global.set 3
      end
      i32.const 0
    )
    (func (;12;) (type 3) (param i32 i32) (result i32)
      (local i32)
      local.get 1
      i32.const 256
      i32.lt_u
      if ;; label = @1
        local.get 1
        i32.const 4
        i32.shr_u
        local.set 1
      else
        local.get 1
        i32.const 536870910
        i32.lt_u
        if ;; label = @2
          local.get 1
          i32.const 1
          i32.const 27
          local.get 1
          i32.clz
          i32.sub
          i32.shl
          i32.add
          i32.const 1
          i32.sub
          local.set 1
        end
        local.get 1
        i32.const 31
        local.get 1
        i32.clz
        i32.sub
        local.tee 2
        i32.const 4
        i32.sub
        i32.shr_u
        i32.const 16
        i32.xor
        local.set 1
        local.get 2
        i32.const 7
        i32.sub
        local.set 2
      end
      local.get 1
      i32.const 16
      i32.lt_u
      local.get 2
      i32.const 23
      i32.lt_u
      i32.and
      i32.eqz
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 334
        i32.const 14
        call 19
        unreachable
      end
      local.get 0
      local.get 2
      i32.const 2
      i32.shl
      i32.add
      i32.load offset=4
      i32.const -1
      local.get 1
      i32.shl
      i32.and
      local.tee 1
      if (result i32) ;; label = @1
        local.get 0
        local.get 1
        i32.ctz
        local.get 2
        i32.const 4
        i32.shl
        i32.add
        i32.const 2
        i32.shl
        i32.add
        i32.load offset=96
      else
        local.get 0
        i32.load
        i32.const -1
        local.get 2
        i32.const 1
        i32.add
        i32.shl
        i32.and
        local.tee 1
        if (result i32) ;; label = @2
          local.get 0
          local.get 1
          i32.ctz
          local.tee 1
          i32.const 2
          i32.shl
          i32.add
          i32.load offset=4
          local.tee 2
          i32.eqz
          if ;; label = @3
            i32.const 0
            i32.const 1616
            i32.const 347
            i32.const 18
            call 19
            unreachable
          end
          local.get 0
          local.get 2
          i32.ctz
          local.get 1
          i32.const 4
          i32.shl
          i32.add
          i32.const 2
          i32.shl
          i32.add
          i32.load offset=96
        else
          i32.const 0
        end
      end
    )
    (func (;13;) (type 3) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32)
      local.get 0
      i32.const 1073741804
      i32.ge_u
      if ;; label = @1
        i32.const 1280
        i32.const 1344
        i32.const 261
        i32.const 31
        call 19
        unreachable
      end
      global.get 1
      global.get 2
      i32.ge_u
      if ;; label = @1
        block ;; label = @2
          i32.const 2048
          local.set 2
          loop ;; label = @3
            local.get 2
            call 11
            i32.sub
            local.set 2
            global.get 3
            i32.eqz
            if ;; label = @4
              global.get 1
              i32.const 1
              i32.shl
              i32.const 1024
              i32.add
              global.set 2
              br 2 (;@2;)
            end
            local.get 2
            i32.const 0
            i32.gt_s
            br_if 0 (;@3;)
          end
          global.get 1
          global.get 1
          global.get 2
          i32.sub
          i32.const 1024
          i32.lt_u
          i32.const 10
          i32.shl
          i32.add
          global.set 2
        end
      end
      global.get 10
      i32.eqz
      if ;; label = @1
        call 10
      end
      global.get 10
      local.set 4
      local.get 0
      i32.const 16
      i32.add
      local.tee 2
      i32.const 1073741820
      i32.gt_u
      if ;; label = @1
        i32.const 1280
        i32.const 1616
        i32.const 461
        i32.const 29
        call 19
        unreachable
      end
      local.get 4
      local.get 2
      i32.const 12
      i32.le_u
      if (result i32) ;; label = @1
        i32.const 12
      else
        local.get 2
        i32.const 19
        i32.add
        i32.const -16
        i32.and
        i32.const 4
        i32.sub
      end
      local.tee 5
      call 12
      local.tee 2
      i32.eqz
      if ;; label = @1
        memory.size
        local.tee 2
        local.get 5
        i32.const 256
        i32.ge_u
        if (result i32) ;; label = @2
          local.get 5
          i32.const 536870910
          i32.lt_u
          if (result i32) ;; label = @3
            local.get 5
            i32.const 1
            i32.const 27
            local.get 5
            i32.clz
            i32.sub
            i32.shl
            i32.add
            i32.const 1
            i32.sub
          else
            local.get 5
          end
        else
          local.get 5
        end
        i32.const 4
        local.get 4
        i32.load offset=1568
        local.get 2
        i32.const 16
        i32.shl
        i32.const 4
        i32.sub
        i32.ne
        i32.shl
        i32.add
        i32.const 65535
        i32.add
        i32.const -65536
        i32.and
        i32.const 16
        i32.shr_u
        local.tee 3
        local.get 2
        local.get 3
        i32.gt_s
        select
        memory.grow
        i32.const 0
        i32.lt_s
        if ;; label = @2
          local.get 3
          memory.grow
          i32.const 0
          i32.lt_s
          if ;; label = @3
            unreachable
          end
        end
        local.get 4
        local.get 2
        i32.const 16
        i32.shl
        memory.size
        i64.extend_i32_s
        i64.const 16
        i64.shl
        call 9
        local.get 4
        local.get 5
        call 12
        local.tee 2
        i32.eqz
        if ;; label = @2
          i32.const 0
          i32.const 1616
          i32.const 499
          i32.const 16
          call 19
          unreachable
        end
      end
      local.get 5
      local.get 2
      i32.load
      i32.const -4
      i32.and
      i32.gt_u
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 501
        i32.const 14
        call 19
        unreachable
      end
      local.get 4
      local.get 2
      call 7
      local.get 2
      i32.load
      local.set 3
      local.get 5
      i32.const 4
      i32.add
      i32.const 15
      i32.and
      if ;; label = @1
        i32.const 0
        i32.const 1616
        i32.const 361
        i32.const 14
        call 19
        unreachable
      end
      local.get 3
      i32.const -4
      i32.and
      local.get 5
      i32.sub
      local.tee 6
      i32.const 16
      i32.ge_u
      if ;; label = @1
        local.get 2
        local.get 5
        local.get 3
        i32.const 2
        i32.and
        i32.or
        i32.store
        local.get 2
        i32.const 4
        i32.add
        local.get 5
        i32.add
        local.tee 3
        local.get 6
        i32.const 4
        i32.sub
        i32.const 1
        i32.or
        i32.store
        local.get 4
        local.get 3
        call 8
      else
        local.get 2
        local.get 3
        i32.const -2
        i32.and
        i32.store
        local.get 2
        i32.const 4
        i32.add
        local.get 2
        i32.load
        i32.const -4
        i32.and
        i32.add
        local.tee 3
        local.get 3
        i32.load
        i32.const -3
        i32.and
        i32.store
      end
      local.get 2
      local.get 1
      i32.store offset=12
      local.get 2
      local.get 0
      i32.store offset=16
      global.get 9
      local.tee 1
      i32.load offset=8
      local.set 3
      local.get 2
      local.get 1
      global.get 8
      i32.or
      i32.store offset=4
      local.get 2
      local.get 3
      i32.store offset=8
      local.get 3
      local.get 2
      local.get 3
      i32.load offset=4
      i32.const 3
      i32.and
      i32.or
      i32.store offset=4
      local.get 1
      local.get 2
      i32.store offset=8
      global.get 1
      local.get 2
      i32.load
      i32.const -4
      i32.and
      i32.const 4
      i32.add
      i32.add
      global.set 1
      local.get 2
      i32.const 20
      i32.add
      local.tee 1
      i32.const 0
      local.get 0
      memory.fill
      local.get 1
    )
    (func (;14;) (type 1) (param i32) (result i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          block ;; label = @11
                            block ;; label = @12
                              block ;; label = @13
                                block ;; label = @14
                                  block ;; label = @15
                                    block ;; label = @16
                                      block ;; label = @17
                                        block ;; label = @18
                                          block ;; label = @19
                                            block ;; label = @20
                                              block ;; label = @21
                                                block ;; label = @22
                                                  block ;; label = @23
                                                    block ;; label = @24
                                                      block ;; label = @25
                                                        block ;; label = @26
                                                          block ;; label = @27
                                                            block ;; label = @28
                                                              block ;; label = @29
                                                                block ;; label = @30
                                                                  block ;; label = @31
                                                                    block ;; label = @32
                                                                      block ;; label = @33
                                                                        block ;; label = @34
                                                                          block ;; label = @35
                                                                            block ;; label = @36
                                                                              block ;; label = @37
                                                                                block ;; label = @38
                                                                                  block ;; label = @39
                                                                                    block ;; label = @40
                                                                                      block ;; label = @41
                                                                                        block ;; label = @42
                                                                                          block ;; label = @43
                                                                                            block ;; label = @44
                                                                                              block ;; label = @45
                                                                                                block ;; label = @46
                                                                                                  block ;; label = @47
                                                                                                    block ;; label = @48
                                                                                                    block ;; label = @49
                                                                                                    block ;; label = @50
                                                                                                    block ;; label = @51
                                                                                                    block ;; label = @52
                                                                                                    block ;; label = @53
                                                                                                    block ;; label = @54
                                                                                                    block ;; label = @55
                                                                                                    block ;; label = @56
                                                                                                    block ;; label = @57
                                                                                                    block ;; label = @58
                                                                                                    block ;; label = @59
                                                                                                    block ;; label = @60
                                                                                                    block ;; label = @61
                                                                                                    block ;; label = @62
                                                                                                    block ;; label = @63
                                                                                                    block ;; label = @64
                                                                                                    block ;; label = @65
                                                                                                    block ;; label = @66
                                                                                                    block ;; label = @67
                                                                                                    block ;; label = @68
                                                                                                    block ;; label = @69
                                                                                                    block ;; label = @70
                                                                                                    block ;; label = @71
                                                                                                    block ;; label = @72
                                                                                                    block ;; label = @73
                                                                                                    block ;; label = @74
                                                                                                    block ;; label = @75
                                                                                                    block ;; label = @76
                                                                                                    block ;; label = @77
                                                                                                    block ;; label = @78
                                                                                                    local.get 0
                                                                                                    i32.const 65535
                                                                                                    i32.and
                                                                                                    br_table 0 (;@78;) 1 (;@77;) 2 (;@76;) 3 (;@75;) 4 (;@74;) 5 (;@73;) 6 (;@72;) 7 (;@71;) 8 (;@70;) 9 (;@69;) 10 (;@68;) 11 (;@67;) 12 (;@66;) 13 (;@65;) 14 (;@64;) 15 (;@63;) 16 (;@62;) 17 (;@61;) 18 (;@60;) 19 (;@59;) 20 (;@58;) 21 (;@57;) 22 (;@56;) 23 (;@55;) 24 (;@54;) 25 (;@53;) 26 (;@52;) 27 (;@51;) 28 (;@50;) 29 (;@49;) 30 (;@48;) 31 (;@47;) 32 (;@46;) 33 (;@45;) 34 (;@44;) 35 (;@43;) 36 (;@42;) 37 (;@41;) 38 (;@40;) 39 (;@39;) 40 (;@38;) 41 (;@37;) 42 (;@36;) 43 (;@35;) 44 (;@34;) 45 (;@33;) 46 (;@32;) 47 (;@31;) 48 (;@30;) 49 (;@29;) 50 (;@28;) 51 (;@27;) 52 (;@26;) 53 (;@25;) 54 (;@24;) 55 (;@23;) 56 (;@22;) 57 (;@21;) 58 (;@20;) 59 (;@19;) 60 (;@18;) 61 (;@17;) 62 (;@16;) 63 (;@15;) 64 (;@14;) 65 (;@13;) 66 (;@12;) 67 (;@11;) 68 (;@10;) 69 (;@9;) 70 (;@8;) 71 (;@7;) 72 (;@6;) 73 (;@5;) 74 (;@4;) 75 (;@3;) 76 (;@2;) 77 (;@1;)
                                                                                                    end
                                                                                                    i32.const 1776
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 1824
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 1856
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 1888
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 1936
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 1984
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2032
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2064
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2112
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2144
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2176
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2208
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2256
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2288
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2336
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2384
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2432
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2464
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2512
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2544
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2576
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2608
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2640
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2672
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2720
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2752
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2784
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2832
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2864
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2896
                                                                                                    return
                                                                                                    end
                                                                                                    i32.const 2928
                                                                                                    return
                                                                                                  end
                                                                                                  i32.const 2960
                                                                                                  return
                                                                                                end
                                                                                                i32.const 2992
                                                                                                return
                                                                                              end
                                                                                              i32.const 3024
                                                                                              return
                                                                                            end
                                                                                            i32.const 3056
                                                                                            return
                                                                                          end
                                                                                          i32.const 3088
                                                                                          return
                                                                                        end
                                                                                        i32.const 3136
                                                                                        return
                                                                                      end
                                                                                      i32.const 3184
                                                                                      return
                                                                                    end
                                                                                    i32.const 3232
                                                                                    return
                                                                                  end
                                                                                  i32.const 3280
                                                                                  return
                                                                                end
                                                                                i32.const 3328
                                                                                return
                                                                              end
                                                                              i32.const 3376
                                                                              return
                                                                            end
                                                                            i32.const 3408
                                                                            return
                                                                          end
                                                                          i32.const 3440
                                                                          return
                                                                        end
                                                                        i32.const 3472
                                                                        return
                                                                      end
                                                                      i32.const 3504
                                                                      return
                                                                    end
                                                                    i32.const 3536
                                                                    return
                                                                  end
                                                                  i32.const 3568
                                                                  return
                                                                end
                                                                i32.const 3600
                                                                return
                                                              end
                                                              i32.const 3632
                                                              return
                                                            end
                                                            i32.const 3664
                                                            return
                                                          end
                                                          i32.const 3712
                                                          return
                                                        end
                                                        i32.const 3744
                                                        return
                                                      end
                                                      i32.const 3776
                                                      return
                                                    end
                                                    i32.const 3824
                                                    return
                                                  end
                                                  i32.const 3856
                                                  return
                                                end
                                                i32.const 3904
                                                return
                                              end
                                              i32.const 3952
                                              return
                                            end
                                            i32.const 4000
                                            return
                                          end
                                          i32.const 4032
                                          return
                                        end
                                        i32.const 4064
                                        return
                                      end
                                      i32.const 4096
                                      return
                                    end
                                    i32.const 4144
                                    return
                                  end
                                  i32.const 4192
                                  return
                                end
                                i32.const 4224
                                return
                              end
                              i32.const 4256
                              return
                            end
                            i32.const 4288
                            return
                          end
                          i32.const 4336
                          return
                        end
                        i32.const 4384
                        return
                      end
                      i32.const 4416
                      return
                    end
                    i32.const 4448
                    return
                  end
                  i32.const 4480
                  return
                end
                i32.const 4512
                return
              end
              i32.const 4544
              return
            end
            i32.const 4592
            return
          end
          i32.const 4624
          return
        end
        i32.const 4656
        return
      end
      i32.const 4704
    )
    (func (;15;) (type 4) (param i32 i32)
      local.get 1
      i32.eqz
      if ;; label = @1
        return
      end
      local.get 0
      i32.eqz
      if ;; label = @1
        i32.const 0
        i32.const 1344
        i32.const 295
        i32.const 14
        call 19
        unreachable
      end
      global.get 8
      local.get 1
      i32.const 20
      i32.sub
      local.tee 1
      i32.load offset=4
      i32.const 3
      i32.and
      i32.eq
      if ;; label = @1
        local.get 0
        i32.const 20
        i32.sub
        i32.load offset=4
        i32.const 3
        i32.and
        local.tee 0
        global.get 8
        i32.eqz
        i32.eq
        if ;; label = @2
          local.get 1
          call 5
        else
          global.get 3
          i32.const 1
          i32.eq
          local.get 0
          i32.const 3
          i32.eq
          i32.and
          if ;; label = @3
            local.get 1
            call 5
          end
        end
      end
    )
    (func (;16;) (type 0) (param i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 0
                i32.const 8
                i32.sub
                i32.load
                br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 3 (;@2;)
              end
              return
            end
            return
          end
          return
        end
        unreachable
      end
      local.get 0
      i32.load
      call 6
    )
    (func (;17;) (type 2)
      global.get 12
      if ;; label = @1
        return
      end
      i32.const 1
      global.set 12
      memory.size
      i32.const 16
      i32.shl
      i32.const 37660
      i32.sub
      i32.const 1
      i32.shr_u
      global.set 2
      i32.const 1396
      i32.const 1392
      i32.store
      i32.const 1400
      i32.const 1392
      i32.store
      i32.const 1392
      global.set 5
      i32.const 1428
      i32.const 1424
      i32.store
      i32.const 1432
      i32.const 1424
      i32.store
      i32.const 1424
      global.set 7
      i32.const 1572
      i32.const 1568
      i32.store
      i32.const 1576
      i32.const 1568
      i32.store
      i32.const 1568
      global.set 9
      call 27
    )
    (func (;18;) (type 1) (param i32) (result i32)
      global.get 11
      i32.const 8
      i32.sub
      global.set 11
      block ;; label = @1
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i64.const 0
        i64.store
        global.get 11
        local.get 0
        i32.store
        global.get 11
        i32.const 0
        i32.store offset=4
        block (result i32) ;; label = @2
          global.get 11
          i32.const 8
          i32.sub
          global.set 11
          global.get 11
          i32.const 4892
          i32.lt_s
          br_if 1 (;@1;)
          global.get 11
          i64.const 0
          i64.store
          local.get 0
          i32.eqz
          if ;; label = @3
            global.get 11
            i32.const 8
            i32.add
            global.set 11
            i32.const 1
            br 1 (;@2;)
          end
          global.get 11
          i32.const 8
          i32.add
          global.set 11
          i32.const 0
        end
        global.get 11
        i32.const 8
        i32.add
        global.set 11
        i32.eqz
        return
      end
      i32.const 37680
      i32.const 37728
      i32.const 1
      i32.const 1
      call 19
      unreachable
    )
    (func (;19;) (type 9) (param i32 i32 i32 i32)
      (local i32)
      global.get 11
      i32.const 4
      i32.sub
      global.set 11
      global.get 11
      i32.const 4892
      i32.lt_s
      if ;; label = @1
        i32.const 37680
        i32.const 37728
        i32.const 1
        i32.const 1
        call 19
        unreachable
      end
      global.get 11
      i32.const 0
      i32.store
      i32.const 0
      i32.const 12
      i32.store
      i32.const 12
      i64.const 9071471065260641
      i64.store
      global.get 11
      local.get 0
      i32.store
      local.get 0
      call 18
      if (result i32) ;; label = @1
        global.get 11
        local.get 0
        i32.store
        local.get 0
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 1
        i32.shr_u
        local.set 4
        i32.const 3
        global.set 0
        local.get 0
        local.get 4
        i32.const 19
        call 3
        i32.const 19
        i32.add
      else
        i32.const 19
      end
      local.tee 0
      i32.const 544106784
      i32.store
      local.get 0
      i32.const 4
      i32.add
      local.set 0
      global.get 11
      local.get 1
      i32.store
      local.get 1
      call 18
      if ;; label = @1
        global.get 11
        local.get 1
        i32.store
        local.get 1
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.const 1
        i32.shr_u
        local.set 4
        i32.const 3
        global.set 0
        local.get 1
        local.get 4
        local.get 0
        call 3
        local.get 0
        i32.add
        local.set 0
      end
      local.get 0
      i32.const 40
      i32.store8
      local.get 2
      i32.const 100000
      i32.lt_u
      if (result i32) ;; label = @1
        local.get 2
        i32.const 100
        i32.lt_u
        if (result i32) ;; label = @2
          local.get 2
          i32.const 10
          i32.ge_u
          i32.const 1
          i32.add
        else
          local.get 2
          i32.const 10000
          i32.ge_u
          i32.const 3
          i32.add
          local.get 2
          i32.const 1000
          i32.ge_u
          i32.add
        end
      else
        local.get 2
        i32.const 10000000
        i32.lt_u
        if (result i32) ;; label = @2
          local.get 2
          i32.const 1000000
          i32.ge_u
          i32.const 6
          i32.add
        else
          local.get 2
          i32.const 1000000000
          i32.ge_u
          i32.const 8
          i32.add
          local.get 2
          i32.const 100000000
          i32.ge_u
          i32.add
        end
      end
      local.tee 1
      local.get 0
      i32.const 1
      i32.add
      i32.add
      local.set 0
      loop ;; label = @1
        local.get 0
        i32.const 1
        i32.sub
        local.tee 0
        local.get 2
        i32.const 10
        i32.rem_u
        i32.const 48
        i32.add
        i32.store8
        local.get 2
        i32.const 10
        i32.div_u
        local.tee 2
        br_if 0 (;@1;)
      end
      local.get 0
      local.get 1
      i32.add
      local.tee 0
      i32.const 58
      i32.store8
      local.get 3
      i32.const 100000
      i32.lt_u
      if (result i32) ;; label = @1
        local.get 3
        i32.const 100
        i32.lt_u
        if (result i32) ;; label = @2
          local.get 3
          i32.const 10
          i32.ge_u
          i32.const 1
          i32.add
        else
          local.get 3
          i32.const 10000
          i32.ge_u
          i32.const 3
          i32.add
          local.get 3
          i32.const 1000
          i32.ge_u
          i32.add
        end
      else
        local.get 3
        i32.const 10000000
        i32.lt_u
        if (result i32) ;; label = @2
          local.get 3
          i32.const 1000000
          i32.ge_u
          i32.const 6
          i32.add
        else
          local.get 3
          i32.const 1000000000
          i32.ge_u
          i32.const 8
          i32.add
          local.get 3
          i32.const 100000000
          i32.ge_u
          i32.add
        end
      end
      local.tee 1
      local.get 0
      i32.const 1
      i32.add
      i32.add
      local.set 0
      loop ;; label = @1
        local.get 0
        i32.const 1
        i32.sub
        local.tee 0
        local.get 3
        i32.const 10
        i32.rem_u
        i32.const 48
        i32.add
        i32.store8
        local.get 3
        i32.const 10
        i32.div_u
        local.tee 3
        br_if 0 (;@1;)
      end
      local.get 0
      local.get 1
      i32.add
      local.tee 0
      i32.const 2601
      i32.store16
      i32.const 4
      local.get 0
      i32.const 10
      i32.sub
      i32.store
      i32.const 2
      i32.const 0
      i32.const 1
      i32.const 8
      call 0
      drop
      i32.const 255
      call 1
      global.get 11
      i32.const 4
      i32.add
      global.set 11
    )
    (func (;20;) (type 3) (param i32 i32) (result i32)
      (local i32)
      global.get 11
      i32.const 4
      i32.sub
      global.set 11
      global.get 11
      i32.const 4892
      i32.lt_s
      if ;; label = @1
        i32.const 37680
        i32.const 37728
        i32.const 1
        i32.const 1
        call 19
        unreachable
      end
      global.get 11
      i32.const 0
      i32.store
      global.get 11
      local.get 0
      i32.store
      local.get 1
      i32.const 0
      i32.lt_s
      local.get 0
      i32.const 20
      i32.sub
      i32.load offset=16
      local.tee 2
      local.get 1
      i32.lt_u
      i32.or
      if ;; label = @1
        i32.const 1472
        i32.const 1680
        i32.const 134
        i32.const 7
        call 19
        unreachable
      end
      i32.const 1728
      local.get 0
      local.get 1
      i32.add
      i32.store
      i32.const 1732
      local.get 2
      local.get 1
      i32.sub
      i32.store
      i32.const 0
      i32.const 1728
      i32.const 1
      i32.const 1736
      call 2
      local.tee 0
      i32.const 65535
      i32.and
      if ;; label = @1
        local.get 0
        call 14
        i32.const 1680
        i32.const 139
        i32.const 14
        call 19
        unreachable
      end
      i32.const 1736
      i32.load
      global.get 11
      i32.const 4
      i32.add
      global.set 11
    )
    (func (;21;) (type 1) (param i32) (result i32)
      (local i32 i32)
      global.get 11
      i32.const 8
      i32.sub
      global.set 11
      block ;; label = @1
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i64.const 0
        i64.store
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              global.get 0
              i32.const 1
              i32.sub
              br_table 1 (;@3;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
            end
            unreachable
          end
          global.get 11
          local.get 0
          i32.store
          local.get 0
          i32.const 20
          i32.sub
          i32.load offset=16
          local.set 2
        end
        global.get 11
        i32.const 0
        i32.store
        global.get 11
        local.get 0
        i32.store offset=4
        global.get 11
        i32.const 12
        i32.sub
        global.set 11
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i64.const 0
        i64.store
        global.get 11
        i32.const 0
        i32.store offset=8
        global.get 11
        i32.const 12
        i32.const 4
        call 13
        local.tee 1
        i32.store
        global.get 11
        local.get 1
        i32.store offset=4
        local.get 1
        i32.const 0
        i32.store
        local.get 1
        i32.const 0
        call 15
        global.get 11
        local.get 1
        i32.store offset=4
        local.get 1
        i32.const 0
        i32.store offset=4
        global.get 11
        local.get 1
        i32.store offset=4
        local.get 1
        i32.const 0
        i32.store offset=8
        global.get 11
        local.get 0
        i32.store offset=4
        local.get 0
        i32.const 20
        i32.sub
        i32.load offset=16
        local.get 2
        i32.lt_u
        local.get 2
        i32.const 1073741820
        i32.gt_u
        i32.or
        if ;; label = @2
          i32.const 1168
          i32.const 4752
          i32.const 25
          i32.const 7
          call 19
          unreachable
        end
        global.get 11
        local.get 1
        i32.store offset=4
        global.get 11
        local.get 0
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store
        local.get 1
        local.get 0
        call 15
        global.get 11
        local.get 1
        i32.store offset=4
        local.get 1
        local.get 0
        i32.store offset=4
        global.get 11
        local.get 1
        i32.store offset=4
        local.get 1
        local.get 2
        i32.store offset=8
        global.get 11
        i32.const 12
        i32.add
        global.set 11
        global.get 11
        i32.const 8
        i32.add
        global.set 11
        local.get 1
        return
      end
      i32.const 37680
      i32.const 37728
      i32.const 1
      i32.const 1
      call 19
      unreachable
    )
    (func (;22;) (type 1) (param i32) (result i32)
      global.get 11
      i32.const 4
      i32.sub
      global.set 11
      global.get 11
      i32.const 4892
      i32.lt_s
      if ;; label = @1
        i32.const 37680
        i32.const 37728
        i32.const 1
        i32.const 1
        call 19
        unreachable
      end
      global.get 11
      i32.const 0
      i32.store
      global.get 11
      local.get 0
      i32.store
      local.get 0
      i32.load offset=8
      global.get 11
      i32.const 4
      i32.add
      global.set 11
    )
    (func (;23;) (type 0) (param i32)
      global.get 11
      i32.const 4
      i32.sub
      global.set 11
      block ;; label = @1
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i32.const 0
        i32.store
        global.get 11
        local.get 0
        i32.store
        global.get 11
        i32.const 4
        i32.sub
        global.set 11
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i32.const 0
        i32.store
        i32.const 1728
        local.get 0
        i32.store
        global.get 11
        local.get 0
        i32.store
        i32.const 1732
        local.get 0
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.store
        i32.const 1
        i32.const 1728
        i32.const 1
        i32.const 1736
        call 0
        local.tee 0
        i32.const 65535
        i32.and
        if ;; label = @2
          local.get 0
          call 14
          i32.const 1680
          i32.const 148
          i32.const 12
          call 19
          unreachable
        end
        global.get 11
        i32.const 4
        i32.add
        global.set 11
        global.get 11
        i32.const 4
        i32.add
        global.set 11
        return
      end
      i32.const 37680
      i32.const 37728
      i32.const 1
      i32.const 1
      call 19
      unreachable
    )
    (func (;24;) (type 3) (param i32 i32) (result i32)
      global.get 11
      i32.const 4
      i32.sub
      global.set 11
      global.get 11
      i32.const 4892
      i32.lt_s
      if ;; label = @1
        i32.const 37680
        i32.const 37728
        i32.const 1
        i32.const 1
        call 19
        unreachable
      end
      global.get 11
      i32.const 0
      i32.store
      global.get 11
      local.get 0
      i32.store
      local.get 1
      local.get 0
      i32.load offset=4
      i32.add
      i32.load8_u
      global.get 11
      i32.const 4
      i32.add
      global.set 11
    )
    (func (;25;) (type 10) (param i32 i32 i32)
      global.get 11
      i32.const 4
      i32.sub
      global.set 11
      global.get 11
      i32.const 4892
      i32.lt_s
      if ;; label = @1
        i32.const 37680
        i32.const 37728
        i32.const 1
        i32.const 1
        call 19
        unreachable
      end
      global.get 11
      i32.const 0
      i32.store
      global.get 11
      local.get 0
      i32.store
      local.get 1
      local.get 0
      i32.load offset=4
      i32.add
      local.get 2
      i32.store8
      global.get 11
      i32.const 4
      i32.add
      global.set 11
    )
    (func (;26;) (type 0) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get 11
      i32.const 24
      i32.sub
      global.set 11
      block ;; label = @1
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i32.const 0
        i32.const 24
        memory.fill
        global.get 11
        global.get 11
        local.get 0
        i32.store
        i32.const 1
        global.set 0
        global.get 11
        i32.const 4
        i32.sub
        global.set 11
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i32.const 0
        i32.store
        global.get 11
        local.get 0
        i32.store
        global.get 11
        i32.const 12
        i32.sub
        global.set 11
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i64.const 0
        i64.store
        global.get 11
        i32.const 0
        i32.store offset=8
        global.get 11
        local.get 0
        i32.store
        global.get 11
        local.get 0
        i32.store offset=4
        local.get 0
        i32.const 20
        i32.sub
        i32.load offset=16
        local.set 3
        global.get 11
        i32.const 12
        i32.const 5
        call 13
        local.tee 4
        i32.store offset=8
        local.get 4
        local.get 0
        i32.store
        local.get 4
        local.get 0
        call 15
        local.get 4
        local.get 3
        i32.store offset=8
        local.get 4
        local.get 0
        i32.store offset=4
        global.get 11
        i32.const 12
        i32.add
        global.set 11
        global.get 11
        i32.const 4
        i32.add
        global.set 11
        local.get 4
        i32.store offset=4
        global.get 11
        local.get 4
        i32.store
        local.get 4
        call 22
        local.tee 3
        i32.const 1048576
        i32.le_s
        if ;; label = @2
          global.get 11
          i32.const 4
          call 28
          local.tee 0
          i32.store offset=8
          global.get 11
          local.get 0
          i32.store offset=12
          i32.const 1
          global.set 0
          local.get 0
          call 21
          local.set 1
          global.get 11
          local.get 1
          i32.store
          global.get 11
          local.get 4
          i32.store offset=16
          global.get 11
          local.get 4
          i32.load
          local.tee 2
          i32.store offset=12
          local.get 2
          i32.const 20
          i32.sub
          i32.load offset=16
          local.set 2
          global.get 11
          i32.const 4
          i32.sub
          global.set 11
          global.get 11
          i32.const 4892
          i32.lt_s
          br_if 1 (;@1;)
          global.get 11
          i32.const 0
          i32.store
          global.get 11
          local.get 1
          i32.store
          local.get 1
          i32.load offset=8
          i32.const 4
          i32.lt_s
          if ;; label = @3
            i32.const 1472
            i32.const 4752
            i32.const 142
            i32.const 7
            call 19
            unreachable
          end
          global.get 11
          local.get 1
          i32.store
          local.get 1
          i32.load offset=4
          local.get 2
          i32.store
          global.get 11
          i32.const 4
          i32.add
          global.set 11
          global.get 11
          local.get 0
          i32.store
          local.get 0
          call 23
          global.get 11
          local.get 4
          i32.store offset=12
          global.get 11
          local.get 4
          i32.load
          local.tee 0
          i32.store
          local.get 0
          call 23
          global.get 11
          i32.const 24
          i32.add
          global.set 11
          return
        end
        loop ;; label = @2
          local.get 2
          local.get 3
          i32.lt_s
          if ;; label = @3
            local.get 3
            local.get 2
            i32.const 1048568
            i32.add
            local.tee 0
            i32.le_s
            if (result i32) ;; label = @4
              local.get 3
            else
              i32.const -1
              local.set 1
              loop ;; label = @5
                local.get 0
                local.get 3
                i32.lt_s
                if ;; label = @6
                  block ;; label = @7
                    global.get 11
                    local.get 4
                    i32.store
                    local.get 4
                    local.get 0
                    call 24
                    i32.const 44
                    i32.eq
                    if ;; label = @8
                      local.get 0
                      local.set 1
                      br 1 (;@7;)
                    end
                    local.get 0
                    i32.const 1
                    i32.add
                    local.set 0
                    br 2 (;@5;)
                  end
                end
              end
              local.get 3
              local.get 1
              local.get 1
              i32.const -1
              i32.eq
              select
            end
            local.set 1
            global.get 11
            local.get 4
            i32.store
            local.get 4
            local.get 2
            call 24
            local.set 6
            global.get 11
            local.get 4
            i32.store
            local.get 4
            local.get 1
            i32.const 1
            i32.sub
            call 24
            local.set 7
            i32.const 0
            local.set 5
            i32.const 0
            local.set 0
            global.get 11
            local.get 6
            i32.const 91
            i32.eq
            if (result i32) ;; label = @4
              local.get 7
              i32.const 93
              i32.ne
            else
              local.get 6
              i32.const 44
              i32.eq
              if (result i32) ;; label = @5
                i32.const 1
                local.set 5
                i32.const 1
                local.set 0
                local.get 7
                i32.const 93
                i32.ne
              else
                i32.const 0
              end
            end
            local.tee 7
            local.get 1
            local.get 2
            i32.const 1
            i32.add
            local.get 2
            local.get 0
            select
            local.tee 9
            i32.sub
            local.tee 10
            local.get 5
            i32.add
            i32.add
            local.tee 11
            i32.const 4
            i32.add
            local.set 2
            global.get 11
            i32.const 8
            i32.sub
            global.set 11
            global.get 11
            i32.const 4892
            i32.lt_s
            br_if 2 (;@1;)
            global.get 11
            i64.const 0
            i64.store
            global.get 11
            i32.const 12
            i32.const 5
            call 13
            local.tee 0
            i32.store
            global.get 11
            global.get 11
            local.get 0
            i32.store offset=4
            global.get 11
            i32.const 16
            i32.sub
            global.set 11
            global.get 11
            i32.const 4892
            i32.lt_s
            br_if 2 (;@1;)
            global.get 11
            i64.const 0
            i64.store
            global.get 11
            i64.const 0
            i64.store offset=8
            local.get 0
            i32.eqz
            if ;; label = @4
              global.get 11
              i32.const 12
              i32.const 3
              call 13
              local.tee 0
              i32.store
            end
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store
            local.get 0
            i32.const 0
            call 15
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store offset=4
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store offset=8
            local.get 2
            i32.const 1073741820
            i32.gt_u
            if ;; label = @4
              i32.const 1168
              i32.const 1216
              i32.const 19
              i32.const 57
              call 19
              unreachable
            end
            global.get 11
            local.get 2
            i32.const 1
            call 13
            local.tee 6
            i32.store offset=8
            global.get 11
            local.get 0
            i32.store offset=4
            global.get 11
            local.get 6
            i32.store offset=12
            local.get 0
            local.get 6
            i32.store
            local.get 0
            local.get 6
            call 15
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            local.get 6
            i32.store offset=4
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            local.get 2
            i32.store offset=8
            global.get 11
            i32.const 16
            i32.add
            global.set 11
            local.get 0
            i32.store
            global.get 11
            i32.const 8
            i32.add
            global.set 11
            local.get 0
            local.tee 2
            i32.store offset=20
            global.get 11
            local.get 0
            i32.store
            local.get 0
            i32.const 0
            local.get 11
            i32.const 255
            i32.and
            call 25
            global.get 11
            local.get 0
            i32.store
            local.get 0
            i32.const 1
            local.get 11
            i32.const 8
            i32.shr_s
            i32.const 255
            i32.and
            call 25
            global.get 11
            local.get 0
            i32.store
            local.get 0
            i32.const 2
            local.get 11
            i32.const 16
            i32.shr_s
            i32.const 255
            i32.and
            call 25
            global.get 11
            local.get 0
            i32.store
            local.get 0
            i32.const 3
            local.get 11
            i32.const 24
            i32.shr_s
            i32.const 255
            i32.and
            call 25
            local.get 5
            if (result i32) ;; label = @4
              global.get 11
              local.get 0
              i32.store
              local.get 0
              i32.const 4
              i32.const 91
              call 25
              i32.const 5
            else
              i32.const 4
            end
            local.set 5
            global.get 11
            local.get 2
            i32.store
            global.get 11
            local.get 4
            i32.store offset=16
            global.get 11
            i32.const 12
            i32.sub
            global.set 11
            global.get 11
            i32.const 4892
            i32.lt_s
            br_if 2 (;@1;)
            global.get 11
            i64.const 0
            i64.store
            global.get 11
            i32.const 0
            i32.store offset=8
            global.get 11
            local.get 4
            i32.store
            local.get 1
            local.set 0
            global.get 11
            local.get 4
            i32.store offset=4
            local.get 4
            call 22
            local.set 1
            global.get 11
            i32.const 12
            i32.const 5
            call 13
            local.tee 6
            i32.store offset=8
            global.get 11
            local.get 4
            i32.store offset=4
            local.get 6
            local.get 4
            i32.load
            local.tee 8
            i32.store
            local.get 6
            local.get 8
            call 15
            global.get 11
            local.get 4
            i32.store offset=4
            local.get 6
            local.get 9
            i32.const 0
            i32.lt_s
            if (result i32) ;; label = @4
              local.get 1
              local.get 9
              i32.add
              local.tee 8
              i32.const 0
              local.get 8
              i32.const 0
              i32.gt_s
              select
            else
              local.get 9
              local.get 1
              local.get 1
              local.get 9
              i32.gt_s
              select
            end
            local.tee 8
            local.get 4
            i32.load offset=4
            i32.add
            i32.store offset=4
            local.get 6
            local.get 0
            i32.const 0
            i32.lt_s
            if (result i32) ;; label = @4
              local.get 0
              local.get 1
              i32.add
              local.tee 1
              i32.const 0
              local.get 1
              i32.const 0
              i32.gt_s
              select
            else
              local.get 0
              local.get 1
              local.get 0
              local.get 1
              i32.lt_s
              select
            end
            local.tee 1
            local.get 8
            local.get 1
            local.get 8
            i32.gt_s
            select
            local.get 8
            i32.sub
            i32.store offset=8
            global.get 11
            i32.const 12
            i32.add
            global.set 11
            global.get 11
            local.get 6
            i32.store offset=12
            global.get 11
            i32.const 12
            i32.sub
            global.set 11
            global.get 11
            i32.const 4892
            i32.lt_s
            br_if 2 (;@1;)
            global.get 11
            i64.const 0
            i64.store
            global.get 11
            i32.const 0
            i32.store offset=8
            global.get 11
            local.get 2
            i32.store
            global.get 11
            local.get 6
            i32.store offset=4
            global.get 11
            local.get 6
            i32.store offset=8
            local.get 6
            call 22
            local.set 1
            local.get 5
            i32.const 0
            i32.lt_s
            if (result i32) ;; label = @4
              i32.const 1
            else
              global.get 11
              local.get 2
              i32.store offset=8
              local.get 2
              call 22
              local.get 1
              local.get 5
              i32.add
              i32.lt_s
            end
            if ;; label = @4
              i32.const 1472
              i32.const 4816
              i32.const 1902
              i32.const 5
              call 19
              unreachable
            end
            global.get 11
            local.get 2
            i32.store offset=8
            local.get 5
            local.get 2
            i32.load offset=4
            i32.add
            global.get 11
            local.get 6
            i32.store offset=8
            local.get 6
            i32.load offset=4
            local.get 1
            memory.copy
            global.get 11
            i32.const 12
            i32.add
            global.set 11
            local.get 7
            if ;; label = @4
              global.get 11
              local.get 2
              i32.store
              local.get 2
              local.get 5
              local.get 10
              i32.add
              i32.const 93
              call 25
            end
            global.get 11
            local.get 2
            i32.store offset=12
            global.get 11
            local.get 2
            i32.load
            local.tee 1
            i32.store
            local.get 1
            call 23
            local.get 0
            local.set 2
            br 1 (;@2;)
          end
        end
        global.get 11
        i32.const 24
        i32.add
        global.set 11
        return
      end
      i32.const 37680
      i32.const 37728
      i32.const 1
      i32.const 1
      call 19
      unreachable
    )
    (func (;27;) (type 2)
      (local i32 i32 i32 i32)
      global.get 11
      i32.const 8
      i32.sub
      global.set 11
      block ;; label = @1
        global.get 11
        i32.const 4892
        i32.lt_s
        br_if 0 (;@1;)
        global.get 11
        i64.const 0
        i64.store
        loop ;; label = @2
          global.get 11
          local.set 1
          i32.const 0
          local.set 0
          global.get 11
          i32.const 16
          i32.sub
          global.set 11
          global.get 11
          i32.const 4892
          i32.lt_s
          br_if 1 (;@1;)
          global.get 11
          i64.const 0
          i64.store
          global.get 11
          i64.const 0
          i64.store offset=8
          global.get 11
          i32.const 4
          call 28
          local.tee 2
          i32.store
          global.get 11
          local.get 2
          i32.store offset=4
          local.get 2
          i32.const 0
          call 20
          drop
          global.get 11
          local.get 2
          i32.store offset=4
          i32.const 1
          global.set 0
          global.get 11
          local.get 2
          call 21
          local.tee 2
          i32.store offset=8
          global.get 11
          local.get 2
          i32.store offset=4
          global.get 11
          i32.const 4
          i32.sub
          global.set 11
          global.get 11
          i32.const 4892
          i32.lt_s
          br_if 1 (;@1;)
          global.get 11
          i32.const 0
          i32.store
          global.get 11
          local.get 2
          i32.store
          local.get 2
          i32.load offset=8
          i32.const 4
          i32.lt_s
          if ;; label = @3
            i32.const 1472
            i32.const 4752
            i32.const 87
            i32.const 7
            call 19
            unreachable
          else
            global.get 11
            local.get 2
            i32.store
            local.get 2
            i32.load offset=4
            i32.load
            local.set 3
            global.get 11
            i32.const 4
            i32.add
            global.set 11
            global.get 11
            local.get 3
            call 28
            local.tee 2
            i32.store offset=12
            loop ;; label = @4
              local.get 0
              local.get 3
              i32.lt_s
              if ;; label = @5
                global.get 11
                local.get 2
                i32.store offset=4
                local.get 2
                local.get 0
                call 20
                local.get 0
                i32.add
                local.set 0
                br 1 (;@4;)
              end
            end
            global.get 11
            i32.const 16
            i32.add
            global.set 11
            local.get 1
            local.get 2
            i32.store
            global.get 11
            local.get 2
            i32.store offset=4
            local.get 2
            call 26
            br 1 (;@2;)
          end
          unreachable
        end
        unreachable
      end
      i32.const 37680
      i32.const 37728
      i32.const 1
      i32.const 1
      call 19
      unreachable
    )
    (func (;28;) (type 1) (param i32) (result i32)
      global.get 11
      i32.const 4
      i32.sub
      global.set 11
      global.get 11
      i32.const 4892
      i32.lt_s
      if ;; label = @1
        i32.const 37680
        i32.const 37728
        i32.const 1
        i32.const 1
        call 19
        unreachable
      end
      global.get 11
      i32.const 0
      i32.store
      local.get 0
      i32.const 1073741820
      i32.gt_u
      if ;; label = @1
        i32.const 1168
        i32.const 1216
        i32.const 52
        i32.const 43
        call 19
        unreachable
      end
      global.get 11
      local.get 0
      i32.const 1
      call 13
      local.tee 0
      i32.store
      global.get 11
      i32.const 4
      i32.add
      global.set 11
      local.get 0
    )
    (data (;0;) (i32.const 1036) "<")
    (data (;1;) (i32.const 1048) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
    (data (;2;) (i32.const 1100) ",")
    (data (;3;) (i32.const 1112) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
    (data (;4;) (i32.const 1148) ",")
    (data (;5;) (i32.const 1160) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
    (data (;6;) (i32.const 1196) "<")
    (data (;7;) (i32.const 1208) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
    (data (;8;) (i32.const 1260) "<")
    (data (;9;) (i32.const 1272) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
    (data (;10;) (i32.const 1324) "<")
    (data (;11;) (i32.const 1336) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
    (data (;12;) (i32.const 1452) "<")
    (data (;13;) (i32.const 1464) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
    (data (;14;) (i32.const 1516) ",")
    (data (;15;) (i32.const 1528) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
    (data (;16;) (i32.const 1596) "<")
    (data (;17;) (i32.const 1608) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
    (data (;18;) (i32.const 1660) "<")
    (data (;19;) (i32.const 1672) "\02\00\00\00(\00\00\00~\00l\00i\00b\00/\00w\00a\00s\00i\00_\00p\00r\00o\00c\00e\00s\00s\00.\00t\00s")
    (data (;20;) (i32.const 1756) ",")
    (data (;21;) (i32.const 1768) "\02\00\00\00\0e\00\00\00S\00U\00C\00C\00E\00S\00S")
    (data (;22;) (i32.const 1804) "\1c")
    (data (;23;) (i32.const 1816) "\02\00\00\00\0c\00\00\00T\00O\00O\00B\00I\00G")
    (data (;24;) (i32.const 1836) "\1c")
    (data (;25;) (i32.const 1848) "\02\00\00\00\0a\00\00\00A\00C\00C\00E\00S")
    (data (;26;) (i32.const 1868) ",")
    (data (;27;) (i32.const 1880) "\02\00\00\00\12\00\00\00A\00D\00D\00R\00I\00N\00U\00S\00E")
    (data (;28;) (i32.const 1916) ",")
    (data (;29;) (i32.const 1928) "\02\00\00\00\18\00\00\00A\00D\00D\00R\00N\00O\00T\00A\00V\00A\00I\00L")
    (data (;30;) (i32.const 1964) ",")
    (data (;31;) (i32.const 1976) "\02\00\00\00\16\00\00\00A\00F\00N\00O\00S\00U\00P\00P\00O\00R\00T")
    (data (;32;) (i32.const 2012) "\1c")
    (data (;33;) (i32.const 2024) "\02\00\00\00\0a\00\00\00A\00G\00A\00I\00N")
    (data (;34;) (i32.const 2044) ",")
    (data (;35;) (i32.const 2056) "\02\00\00\00\0e\00\00\00A\00L\00R\00E\00A\00D\00Y")
    (data (;36;) (i32.const 2092) "\1c")
    (data (;37;) (i32.const 2104) "\02\00\00\00\08\00\00\00B\00A\00D\00F")
    (data (;38;) (i32.const 2124) "\1c")
    (data (;39;) (i32.const 2136) "\02\00\00\00\0c\00\00\00B\00A\00D\00M\00S\00G")
    (data (;40;) (i32.const 2156) "\1c")
    (data (;41;) (i32.const 2168) "\02\00\00\00\08\00\00\00B\00U\00S\00Y")
    (data (;42;) (i32.const 2188) ",")
    (data (;43;) (i32.const 2200) "\02\00\00\00\10\00\00\00C\00A\00N\00C\00E\00L\00E\00D")
    (data (;44;) (i32.const 2236) "\1c")
    (data (;45;) (i32.const 2248) "\02\00\00\00\0a\00\00\00C\00H\00I\00L\00D")
    (data (;46;) (i32.const 2268) ",")
    (data (;47;) (i32.const 2280) "\02\00\00\00\16\00\00\00C\00O\00N\00N\00A\00B\00O\00R\00T\00E\00D")
    (data (;48;) (i32.const 2316) ",")
    (data (;49;) (i32.const 2328) "\02\00\00\00\16\00\00\00C\00O\00N\00N\00R\00E\00F\00U\00S\00E\00D")
    (data (;50;) (i32.const 2364) ",")
    (data (;51;) (i32.const 2376) "\02\00\00\00\12\00\00\00C\00O\00N\00N\00R\00E\00S\00E\00T")
    (data (;52;) (i32.const 2412) "\1c")
    (data (;53;) (i32.const 2424) "\02\00\00\00\0c\00\00\00D\00E\00A\00D\00L\00K")
    (data (;54;) (i32.const 2444) ",")
    (data (;55;) (i32.const 2456) "\02\00\00\00\16\00\00\00D\00E\00S\00T\00A\00D\00D\00R\00R\00E\00Q")
    (data (;56;) (i32.const 2492) "\1c")
    (data (;57;) (i32.const 2504) "\02\00\00\00\06\00\00\00D\00O\00M")
    (data (;58;) (i32.const 2524) "\1c")
    (data (;59;) (i32.const 2536) "\02\00\00\00\0a\00\00\00D\00Q\00U\00O\00T")
    (data (;60;) (i32.const 2556) "\1c")
    (data (;61;) (i32.const 2568) "\02\00\00\00\0a\00\00\00E\00X\00I\00S\00T")
    (data (;62;) (i32.const 2588) "\1c")
    (data (;63;) (i32.const 2600) "\02\00\00\00\0a\00\00\00F\00A\00U\00L\00T")
    (data (;64;) (i32.const 2620) "\1c")
    (data (;65;) (i32.const 2632) "\02\00\00\00\08\00\00\00F\00B\00I\00G")
    (data (;66;) (i32.const 2652) ",")
    (data (;67;) (i32.const 2664) "\02\00\00\00\16\00\00\00H\00O\00S\00T\00U\00N\00R\00E\00A\00C\00H")
    (data (;68;) (i32.const 2700) "\1c")
    (data (;69;) (i32.const 2712) "\02\00\00\00\08\00\00\00I\00D\00R\00M")
    (data (;70;) (i32.const 2732) "\1c")
    (data (;71;) (i32.const 2744) "\02\00\00\00\0a\00\00\00I\00L\00S\00E\00Q")
    (data (;72;) (i32.const 2764) ",")
    (data (;73;) (i32.const 2776) "\02\00\00\00\14\00\00\00I\00N\00P\00R\00O\00G\00R\00E\00S\00S")
    (data (;74;) (i32.const 2812) "\1c")
    (data (;75;) (i32.const 2824) "\02\00\00\00\08\00\00\00I\00N\00T\00R")
    (data (;76;) (i32.const 2844) "\1c")
    (data (;77;) (i32.const 2856) "\02\00\00\00\0a\00\00\00I\00N\00V\00A\00L")
    (data (;78;) (i32.const 2876) "\1c")
    (data (;79;) (i32.const 2888) "\02\00\00\00\04\00\00\00I\00O")
    (data (;80;) (i32.const 2908) "\1c")
    (data (;81;) (i32.const 2920) "\02\00\00\00\0c\00\00\00I\00S\00C\00O\00N\00N")
    (data (;82;) (i32.const 2940) "\1c")
    (data (;83;) (i32.const 2952) "\02\00\00\00\0a\00\00\00I\00S\00D\00I\00R")
    (data (;84;) (i32.const 2972) "\1c")
    (data (;85;) (i32.const 2984) "\02\00\00\00\08\00\00\00L\00O\00O\00P")
    (data (;86;) (i32.const 3004) "\1c")
    (data (;87;) (i32.const 3016) "\02\00\00\00\0a\00\00\00M\00F\00I\00L\00E")
    (data (;88;) (i32.const 3036) "\1c")
    (data (;89;) (i32.const 3048) "\02\00\00\00\0a\00\00\00M\00L\00I\00N\00K")
    (data (;90;) (i32.const 3068) ",")
    (data (;91;) (i32.const 3080) "\02\00\00\00\0e\00\00\00M\00S\00G\00S\00I\00Z\00E")
    (data (;92;) (i32.const 3116) ",")
    (data (;93;) (i32.const 3128) "\02\00\00\00\10\00\00\00M\00U\00L\00T\00I\00H\00O\00P")
    (data (;94;) (i32.const 3164) ",")
    (data (;95;) (i32.const 3176) "\02\00\00\00\16\00\00\00N\00A\00M\00E\00T\00O\00O\00L\00O\00N\00G")
    (data (;96;) (i32.const 3212) ",")
    (data (;97;) (i32.const 3224) "\02\00\00\00\0e\00\00\00N\00E\00T\00D\00O\00W\00N")
    (data (;98;) (i32.const 3260) ",")
    (data (;99;) (i32.const 3272) "\02\00\00\00\10\00\00\00N\00E\00T\00R\00E\00S\00E\00T")
    (data (;100;) (i32.const 3308) ",")
    (data (;101;) (i32.const 3320) "\02\00\00\00\14\00\00\00N\00E\00T\00U\00N\00R\00E\00A\00C\00H")
    (data (;102;) (i32.const 3356) "\1c")
    (data (;103;) (i32.const 3368) "\02\00\00\00\0a\00\00\00N\00F\00I\00L\00E")
    (data (;104;) (i32.const 3388) "\1c")
    (data (;105;) (i32.const 3400) "\02\00\00\00\0c\00\00\00N\00O\00B\00U\00F\00S")
    (data (;106;) (i32.const 3420) "\1c")
    (data (;107;) (i32.const 3432) "\02\00\00\00\0a\00\00\00N\00O\00D\00E\00V")
    (data (;108;) (i32.const 3452) "\1c")
    (data (;109;) (i32.const 3464) "\02\00\00\00\0a\00\00\00N\00O\00E\00N\00T")
    (data (;110;) (i32.const 3484) "\1c")
    (data (;111;) (i32.const 3496) "\02\00\00\00\0c\00\00\00N\00O\00E\00X\00E\00C")
    (data (;112;) (i32.const 3516) "\1c")
    (data (;113;) (i32.const 3528) "\02\00\00\00\0a\00\00\00N\00O\00L\00C\00K")
    (data (;114;) (i32.const 3548) "\1c")
    (data (;115;) (i32.const 3560) "\02\00\00\00\0c\00\00\00N\00O\00L\00I\00N\00K")
    (data (;116;) (i32.const 3580) "\1c")
    (data (;117;) (i32.const 3592) "\02\00\00\00\0a\00\00\00N\00O\00M\00E\00M")
    (data (;118;) (i32.const 3612) "\1c")
    (data (;119;) (i32.const 3624) "\02\00\00\00\0a\00\00\00N\00O\00M\00S\00G")
    (data (;120;) (i32.const 3644) ",")
    (data (;121;) (i32.const 3656) "\02\00\00\00\14\00\00\00N\00O\00P\00R\00O\00T\00O\00O\00P\00T")
    (data (;122;) (i32.const 3692) "\1c")
    (data (;123;) (i32.const 3704) "\02\00\00\00\0a\00\00\00N\00O\00S\00P\00C")
    (data (;124;) (i32.const 3724) "\1c")
    (data (;125;) (i32.const 3736) "\02\00\00\00\0a\00\00\00N\00O\00S\00Y\00S")
    (data (;126;) (i32.const 3756) ",")
    (data (;127;) (i32.const 3768) "\02\00\00\00\0e\00\00\00N\00O\00T\00C\00O\00N\00N")
    (data (;128;) (i32.const 3804) "\1c")
    (data (;129;) (i32.const 3816) "\02\00\00\00\0c\00\00\00N\00O\00T\00D\00I\00R")
    (data (;130;) (i32.const 3836) ",")
    (data (;131;) (i32.const 3848) "\02\00\00\00\10\00\00\00N\00O\00T\00E\00M\00P\00T\00Y")
    (data (;132;) (i32.const 3884) ",")
    (data (;133;) (i32.const 3896) "\02\00\00\00\1c\00\00\00N\00O\00T\00R\00E\00C\00O\00V\00E\00R\00A\00B\00L\00E")
    (data (;134;) (i32.const 3932) ",")
    (data (;135;) (i32.const 3944) "\02\00\00\00\0e\00\00\00N\00O\00T\00S\00O\00C\00K")
    (data (;136;) (i32.const 3980) "\1c")
    (data (;137;) (i32.const 3992) "\02\00\00\00\0c\00\00\00N\00O\00T\00S\00U\00P")
    (data (;138;) (i32.const 4012) "\1c")
    (data (;139;) (i32.const 4024) "\02\00\00\00\0a\00\00\00N\00O\00T\00T\00Y")
    (data (;140;) (i32.const 4044) "\1c")
    (data (;141;) (i32.const 4056) "\02\00\00\00\08\00\00\00N\00X\00I\00O")
    (data (;142;) (i32.const 4076) ",")
    (data (;143;) (i32.const 4088) "\02\00\00\00\10\00\00\00O\00V\00E\00R\00F\00L\00O\00W")
    (data (;144;) (i32.const 4124) ",")
    (data (;145;) (i32.const 4136) "\02\00\00\00\12\00\00\00O\00W\00N\00E\00R\00D\00E\00A\00D")
    (data (;146;) (i32.const 4172) "\1c")
    (data (;147;) (i32.const 4184) "\02\00\00\00\08\00\00\00P\00E\00R\00M")
    (data (;148;) (i32.const 4204) "\1c")
    (data (;149;) (i32.const 4216) "\02\00\00\00\08\00\00\00P\00I\00P\00E")
    (data (;150;) (i32.const 4236) "\1c")
    (data (;151;) (i32.const 4248) "\02\00\00\00\0a\00\00\00P\00R\00O\00T\00O")
    (data (;152;) (i32.const 4268) ",")
    (data (;153;) (i32.const 4280) "\02\00\00\00\1c\00\00\00P\00R\00O\00T\00O\00N\00O\00S\00U\00P\00P\00O\00R\00T")
    (data (;154;) (i32.const 4316) ",")
    (data (;155;) (i32.const 4328) "\02\00\00\00\12\00\00\00P\00R\00O\00T\00O\00T\00Y\00P\00E")
    (data (;156;) (i32.const 4364) "\1c")
    (data (;157;) (i32.const 4376) "\02\00\00\00\0a\00\00\00R\00A\00N\00G\00E")
    (data (;158;) (i32.const 4396) "\1c")
    (data (;159;) (i32.const 4408) "\02\00\00\00\08\00\00\00R\00O\00F\00S")
    (data (;160;) (i32.const 4428) "\1c")
    (data (;161;) (i32.const 4440) "\02\00\00\00\0a\00\00\00S\00P\00I\00P\00E")
    (data (;162;) (i32.const 4460) "\1c")
    (data (;163;) (i32.const 4472) "\02\00\00\00\08\00\00\00S\00R\00C\00H")
    (data (;164;) (i32.const 4492) "\1c")
    (data (;165;) (i32.const 4504) "\02\00\00\00\0a\00\00\00S\00T\00A\00L\00E")
    (data (;166;) (i32.const 4524) ",")
    (data (;167;) (i32.const 4536) "\02\00\00\00\10\00\00\00T\00I\00M\00E\00D\00O\00U\00T")
    (data (;168;) (i32.const 4572) "\1c")
    (data (;169;) (i32.const 4584) "\02\00\00\00\0c\00\00\00T\00X\00T\00B\00S\00Y")
    (data (;170;) (i32.const 4604) "\1c")
    (data (;171;) (i32.const 4616) "\02\00\00\00\08\00\00\00X\00D\00E\00V")
    (data (;172;) (i32.const 4636) ",")
    (data (;173;) (i32.const 4648) "\02\00\00\00\14\00\00\00N\00O\00T\00C\00A\00P\00A\00B\00L\00E")
    (data (;174;) (i32.const 4684) ",")
    (data (;175;) (i32.const 4696) "\02\00\00\00\0e\00\00\00U\00N\00K\00N\00O\00W\00N")
    (data (;176;) (i32.const 4732) "<")
    (data (;177;) (i32.const 4744) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00d\00a\00t\00a\00v\00i\00e\00w\00.\00t\00s")
    (data (;178;) (i32.const 4796) "<")
    (data (;179;) (i32.const 4808) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
    (data (;180;) (i32.const 4864) "\06\00\00\00 \00\00\00 \00\00\00 ")
    (data (;181;) (i32.const 4888) "A")
  )
  (core module $wit-component:adapter:wasi_snapshot_preview1 (;1;)
    (type (;0;) (func (param i32 i32)))
    (type (;1;) (func (param i32 i32 i32 i32)))
    (type (;2;) (func (param i32)))
    (type (;3;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;4;) (func (param i32 i64 i32)))
    (type (;5;) (func (param i32 i32 i32 i32 i32)))
    (type (;6;) (func (param i32) (result i32)))
    (type (;7;) (func (param i32 i32 i32)))
    (type (;8;) (func))
    (type (;9;) (func (result i32)))
    (type (;10;) (func (param i32 i32 i32) (result i32)))
    (import "env" "memory" (memory (;0;) 0))
    (import "wasi:io/streams@0.2.6" "[method]output-stream.check-write" (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream11check_write11wit_import117h6e29a78bb1e6ce35E (;0;) (type 0)))
    (import "wasi:io/streams@0.2.6" "[method]output-stream.write" (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream5write11wit_import217ha4065b9ebc3c4463E (;1;) (type 1)))
    (import "wasi:io/streams@0.2.6" "[method]output-stream.blocking-flush" (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream14blocking_flush11wit_import117h3f39821517b8fcafE (;2;) (type 0)))
    (import "wasi:filesystem/types@0.2.6" "filesystem-error-code" (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types21filesystem_error_code11wit_import117hec44f7c9679761cfE (;3;) (type 0)))
    (import "wasi:io/error@0.2.6" "[resource-drop]error" (func $_ZN128_$LT$wasi_snapshot_preview1..bindings..wasi..io..error..Error$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17h28b49e34c3f913e7E (;4;) (type 2)))
    (import "wasi:filesystem/preopens@0.2.6" "get-directories" (func $_ZN22wasi_snapshot_preview111descriptors31wasi_filesystem_get_directories17h6f6ffe1530906a56E (;5;) (type 2)))
    (import "wasi:filesystem/types@0.2.6" "[resource-drop]descriptor" (func $_ZN141_$LT$wasi_snapshot_preview1..bindings..wasi..filesystem..types..Descriptor$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17hf4c86b9b2c710766E (;6;) (type 2)))
    (import "wasi:io/streams@0.2.6" "[resource-drop]output-stream" (func $_ZN137_$LT$wasi_snapshot_preview1..bindings..wasi..io..streams..OutputStream$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17ha5301ace69c1ec80E (;7;) (type 2)))
    (import "wasi:io/streams@0.2.6" "[method]input-stream.blocking-read" (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams11InputStream13blocking_read11wit_import117h08adea216919b298E (;8;) (type 4)))
    (import "wasi:io/streams@0.2.6" "[method]input-stream.read" (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams11InputStream4read11wit_import117h08f0fa01ab0d661eE (;9;) (type 4)))
    (import "wasi:io/streams@0.2.6" "[resource-drop]input-stream" (func $_ZN136_$LT$wasi_snapshot_preview1..bindings..wasi..io..streams..InputStream$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17he261c14510126a76E (;10;) (type 2)))
    (import "__main_module__" "_start" (func $_ZN22wasi_snapshot_preview13run6_start17h9a39352f3a66d6a9E (;11;) (type 8)))
    (import "wasi:cli/stderr@0.2.6" "get-stderr" (func $_ZN22wasi_snapshot_preview18bindings4wasi3cli6stderr10get_stderr11wit_import017hf222d491a524afddE (;12;) (type 9)))
    (import "wasi:io/streams@0.2.6" "[method]output-stream.blocking-write-and-flush" (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush11wit_import217h4ddad3b45e9cedc3E (;13;) (type 1)))
    (import "wasi:filesystem/types@0.2.6" "[method]descriptor.read-via-stream" (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor15read_via_stream11wit_import117h57c6387817993995E (;14;) (type 4)))
    (import "wasi:filesystem/types@0.2.6" "[method]descriptor.write-via-stream" (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor16write_via_stream11wit_import117hd8284ac5165e3c5dE (;15;) (type 4)))
    (import "wasi:cli/stdin@0.2.6" "get-stdin" (func $_ZN22wasi_snapshot_preview18bindings4wasi3cli5stdin9get_stdin11wit_import017h58854027ae8afcb9E (;16;) (type 9)))
    (import "wasi:cli/stdout@0.2.6" "get-stdout" (func $_ZN22wasi_snapshot_preview18bindings4wasi3cli6stdout10get_stdout11wit_import017hec4f54697a66871fE (;17;) (type 9)))
    (import "wasi:cli/exit@0.2.6" "exit" (func $_ZN22wasi_snapshot_preview18bindings4wasi3cli4exit4exit11wit_import117hd163e692951f3ed3E (;18;) (type 2)))
    (import "wasi:filesystem/types@0.2.6" "[method]descriptor.append-via-stream" (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor17append_via_stream11wit_import117hf3fe07cdc09bd749E (;19;) (type 0)))
    (import "wasi:filesystem/types@0.2.6" "[method]descriptor.stat" (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor4stat11wit_import117hb49e8f43c65e44d3E (;20;) (type 0)))
    (import "wasi:filesystem/types@0.2.6" "[method]descriptor.get-type" (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor8get_type11wit_import117h54c823cf8ae77d8aE (;21;) (type 0)))
    (global $__stack_pointer (;0;) (mut i32) i32.const 0)
    (global $internal_state_ptr (;1;) (mut i32) i32.const 0)
    (global $allocation_state (;2;) (mut i32) i32.const 0)
    (export "fd_write" (func $fd_write))
    (export "proc_exit" (func $proc_exit))
    (export "wasi:cli/run@0.2.6#run" (func $wasi:cli/run@0.2.6#run))
    (export "fd_read" (func $fd_read))
    (export "cabi_import_realloc" (func $cabi_import_realloc))
    (start $allocate_stack)
    (func $realloc_via_memory_grow (;22;) (type 3) (param i32 i32 i32 i32) (result i32)
      (local i32)
      i32.const 0
      local.get 0
      i32.ne
      if ;; label = @1
        unreachable
      end
      i32.const 0
      local.get 1
      i32.ne
      if ;; label = @1
        unreachable
      end
      i32.const 65536
      local.get 3
      i32.ne
      if ;; label = @1
        unreachable
      end
      i32.const 1
      memory.grow
      local.tee 4
      i32.const -1
      i32.eq
      if ;; label = @1
        unreachable
      end
      local.get 4
      i32.const 16
      i32.shl
    )
    (func $_ZN22wasi_snapshot_preview1154_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi..filesystem..types..ErrorCode$GT$$u20$for$u20$wasip1..lib_generated..Errno$GT$4from17h3471f09acf6a1d8fE (;23;) (type 6) (param i32) (result i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.set 1
      i32.const 6
      local.set 2
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          block ;; label = @11
                            block ;; label = @12
                              block ;; label = @13
                                block ;; label = @14
                                  block ;; label = @15
                                    block ;; label = @16
                                      block ;; label = @17
                                        block ;; label = @18
                                          block ;; label = @19
                                            block ;; label = @20
                                              block ;; label = @21
                                                block ;; label = @22
                                                  block ;; label = @23
                                                    block ;; label = @24
                                                      block ;; label = @25
                                                        block ;; label = @26
                                                          block ;; label = @27
                                                            block ;; label = @28
                                                              block ;; label = @29
                                                                block ;; label = @30
                                                                  block ;; label = @31
                                                                    block ;; label = @32
                                                                      block ;; label = @33
                                                                        block ;; label = @34
                                                                          block ;; label = @35
                                                                            block ;; label = @36
                                                                              block ;; label = @37
                                                                                local.get 0
                                                                                i32.const 255
                                                                                i32.and
                                                                                br_table 0 (;@37;) 36 (;@1;) 1 (;@36;) 2 (;@35;) 3 (;@34;) 4 (;@33;) 5 (;@32;) 6 (;@31;) 7 (;@30;) 8 (;@29;) 9 (;@28;) 10 (;@27;) 11 (;@26;) 12 (;@25;) 13 (;@24;) 14 (;@23;) 15 (;@22;) 16 (;@21;) 17 (;@20;) 18 (;@19;) 19 (;@18;) 20 (;@17;) 21 (;@16;) 22 (;@15;) 23 (;@14;) 24 (;@13;) 25 (;@12;) 26 (;@11;) 27 (;@10;) 28 (;@9;) 29 (;@8;) 30 (;@7;) 31 (;@6;) 32 (;@5;) 33 (;@4;) 34 (;@3;) 35 (;@2;) 0 (;@37;)
                                                                              end
                                                                              local.get 1
                                                                              i32.const 2
                                                                              i32.store16 offset=14
                                                                              local.get 1
                                                                              i32.const 14
                                                                              i32.add
                                                                              local.set 0
                                                                              local.get 1
                                                                              i32.load16_u offset=14
                                                                              return
                                                                            end
                                                                            i32.const 7
                                                                            return
                                                                          end
                                                                          i32.const 8
                                                                          return
                                                                        end
                                                                        i32.const 10
                                                                        return
                                                                      end
                                                                      i32.const 16
                                                                      return
                                                                    end
                                                                    i32.const 19
                                                                    return
                                                                  end
                                                                  i32.const 20
                                                                  return
                                                                end
                                                                i32.const 22
                                                                return
                                                              end
                                                              i32.const 25
                                                              return
                                                            end
                                                            i32.const 26
                                                            return
                                                          end
                                                          i32.const 27
                                                          return
                                                        end
                                                        i32.const 28
                                                        return
                                                      end
                                                      i32.const 29
                                                      return
                                                    end
                                                    i32.const 31
                                                    return
                                                  end
                                                  i32.const 32
                                                  return
                                                end
                                                i32.const 34
                                                return
                                              end
                                              i32.const 35
                                              return
                                            end
                                            i32.const 37
                                            return
                                          end
                                          i32.const 43
                                          return
                                        end
                                        i32.const 44
                                        return
                                      end
                                      i32.const 46
                                      return
                                    end
                                    i32.const 48
                                    return
                                  end
                                  i32.const 51
                                  return
                                end
                                i32.const 54
                                return
                              end
                              i32.const 55
                              return
                            end
                            i32.const 56
                            return
                          end
                          i32.const 58
                          return
                        end
                        i32.const 59
                        return
                      end
                      i32.const 60
                      return
                    end
                    i32.const 61
                    return
                  end
                  i32.const 63
                  return
                end
                i32.const 64
                return
              end
              i32.const 69
              return
            end
            i32.const 70
            return
          end
          i32.const 74
          return
        end
        i32.const 75
        local.set 2
      end
      local.get 2
    )
    (func $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE (;24;) (type 2) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 32
      i32.store8 offset=47
      local.get 1
      i32.const 1701734764
      i32.store offset=43 align=1
      local.get 1
      i64.const 2338042707334751329
      i64.store offset=35 align=1
      local.get 1
      i64.const 2338600898263348341
      i64.store offset=27 align=1
      local.get 1
      i64.const 7162263158133189730
      i64.store offset=19 align=1
      local.get 1
      i64.const 7018969289221893749
      i64.store offset=11 align=1
      local.get 1
      i32.const 11
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      local.get 0
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17hb645ead8df04f6caE
      local.get 1
      i32.const 48
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E (;25;) (type 0) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli6stderr10get_stderr11wit_import017hf222d491a524afddE
      i32.store offset=12
      local.get 2
      i32.const 4
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 0
      local.get 1
      call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush17h0d192985911ea523E
      block ;; label = @1
        local.get 2
        i32.load offset=4
        local.tee 1
        i32.const 2
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        br_if 0 (;@1;)
        local.get 2
        i32.load offset=8
        local.tee 1
        i32.const -1
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        call $_ZN128_$LT$wasi_snapshot_preview1..bindings..wasi..io..error..Error$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17h28b49e34c3f913e7E
      end
      block ;; label = @1
        local.get 2
        i32.load offset=12
        local.tee 1
        i32.const -1
        i32.eq
        br_if 0 (;@1;)
        local.get 1
        call $_ZN137_$LT$wasi_snapshot_preview1..bindings..wasi..io..streams..OutputStream$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17ha5301ace69c1ec80E
      end
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E (;26;) (type 2) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 1
      i32.const 32
      i32.store8 offset=47
      local.get 1
      i64.const 7308895158390646132
      i64.store offset=39 align=1
      local.get 1
      i64.const 8097863973307965728
      i64.store offset=31 align=1
      local.get 1
      i64.const 7234307576302018670
      i64.store offset=23 align=1
      local.get 1
      i64.const 8028075845441778529
      i64.store offset=15 align=1
      local.get 1
      i32.const 15
      i32.add
      i32.const 33
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      local.get 0
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h6db63539958e7edbE
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview112BlockingMode5write17h98e193f01fdc6647E (;27;) (type 5) (param i32 i32 i32 i32 i32)
      (local i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 5
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.eqz
          br_if 0 (;@2;)
          local.get 4
          local.set 1
          block ;; label = @3
            block ;; label = @4
              loop ;; label = @5
                local.get 5
                local.get 2
                local.get 3
                local.get 1
                i32.const 4096
                local.get 1
                i32.const 4096
                i32.lt_u
                select
                local.tee 6
                call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush17h0d192985911ea523E
                block ;; label = @6
                  local.get 5
                  i32.load
                  local.tee 7
                  i32.const 2
                  i32.eq
                  br_if 0 (;@6;)
                  local.get 7
                  br_if 2 (;@4;)
                  local.get 5
                  i32.load offset=4
                  call $_ZN22wasi_snapshot_preview121stream_error_to_errno17h829d46e8481b67e6E
                  local.set 1
                  br 3 (;@3;)
                end
                local.get 3
                local.get 6
                i32.add
                local.set 3
                local.get 1
                local.get 6
                i32.sub
                local.tee 1
                br_if 0 (;@5;)
              end
              local.get 0
              i32.const 0
              i32.store16
              local.get 0
              local.get 4
              i32.store offset=4
              br 3 (;@1;)
            end
            i32.const 29
            local.set 1
          end
          local.get 0
          i32.const 1
          i32.store16
          local.get 0
          local.get 1
          i32.store16 offset=2
          br 1 (;@1;)
        end
        local.get 2
        i32.load
        local.get 5
        call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream11check_write11wit_import117h6e29a78bb1e6ce35E
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 5
              i32.load8_u
              i32.eqz
              br_if 0 (;@4;)
              i32.const 0
              local.set 1
              local.get 5
              i32.load8_u offset=8
              br_if 1 (;@3;)
              local.get 5
              i32.load offset=12
              call $_ZN22wasi_snapshot_preview121stream_error_to_errno17h829d46e8481b67e6E
              local.set 1
              br 2 (;@2;)
            end
            local.get 5
            i64.load offset=8
            local.set 8
            block ;; label = @4
              local.get 4
              i32.eqz
              br_if 0 (;@4;)
              i32.const 6
              local.set 1
              local.get 8
              i64.eqz
              br_if 2 (;@2;)
            end
            local.get 8
            i32.wrap_i64
            local.tee 1
            local.get 4
            local.get 1
            local.get 4
            i32.lt_u
            select
            local.set 1
          end
          local.get 2
          i32.load
          local.get 3
          local.get 1
          local.get 5
          call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream5write11wit_import217ha4065b9ebc3c4463E
          block ;; label = @3
            local.get 5
            i32.load8_u
            br_if 0 (;@3;)
            local.get 2
            i32.load
            local.get 5
            call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream14blocking_flush11wit_import117h3f39821517b8fcafE
            block ;; label = @4
              local.get 5
              i32.load8_u
              br_if 0 (;@4;)
              local.get 0
              i32.const 0
              i32.store16
              local.get 0
              local.get 1
              i32.store offset=4
              br 3 (;@1;)
            end
            block ;; label = @4
              block ;; label = @5
                local.get 5
                i32.load8_u offset=4
                i32.eqz
                br_if 0 (;@5;)
                i32.const 0
                local.set 1
                local.get 0
                i32.const 0
                i32.store offset=4
                br 1 (;@4;)
              end
              local.get 0
              local.get 5
              i32.load offset=8
              call $_ZN22wasi_snapshot_preview121stream_error_to_errno17h829d46e8481b67e6E
              i32.store16 offset=2
              i32.const 1
              local.set 1
            end
            local.get 0
            local.get 1
            i32.store16
            br 2 (;@1;)
          end
          block ;; label = @3
            block ;; label = @4
              local.get 5
              i32.load8_u offset=4
              i32.eqz
              br_if 0 (;@4;)
              i32.const 0
              local.set 1
              local.get 0
              i32.const 0
              i32.store offset=4
              br 1 (;@3;)
            end
            local.get 0
            local.get 5
            i32.load offset=8
            call $_ZN22wasi_snapshot_preview121stream_error_to_errno17h829d46e8481b67e6E
            i32.store16 offset=2
            i32.const 1
            local.set 1
          end
          local.get 0
          local.get 1
          i32.store16
          br 1 (;@1;)
        end
        local.get 0
        i32.const 1
        i32.store16
        local.get 0
        local.get 1
        i32.store16 offset=2
      end
      local.get 5
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush17h0d192985911ea523E (;28;) (type 1) (param i32 i32 i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 1
      i32.load
      local.get 2
      local.get 3
      local.get 4
      i32.const 4
      i32.add
      call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams12OutputStream24blocking_write_and_flush11wit_import217h4ddad3b45e9cedc3E
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.load8_u offset=4
          br_if 0 (;@2;)
          i32.const 2
          local.set 1
          br 1 (;@1;)
        end
        local.get 0
        local.get 4
        i32.load offset=12
        i32.store offset=4
        local.get 4
        i32.load8_u offset=8
        i32.const 0
        i32.ne
        local.set 1
      end
      local.get 0
      local.get 1
      i32.store
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview121stream_error_to_errno17h829d46e8481b67e6E (;29;) (type 6) (param i32) (result i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      local.get 1
      i32.const 14
      i32.add
      call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types21filesystem_error_code11wit_import117hec44f7c9679761cfE
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.load8_u offset=14
          i32.const 1
          i32.eq
          br_if 0 (;@2;)
          i32.const 29
          local.set 2
          br 1 (;@1;)
        end
        local.get 1
        i32.load8_u offset=15
        call $_ZN22wasi_snapshot_preview1154_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi..filesystem..types..ErrorCode$GT$$u20$for$u20$wasip1..lib_generated..Errno$GT$4from17h3471f09acf6a1d8fE
        local.set 2
      end
      block ;; label = @1
        local.get 0
        i32.const -1
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        call $_ZN128_$LT$wasi_snapshot_preview1..bindings..wasi..io..error..Error$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17h28b49e34c3f913e7E
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 2
    )
    (func $_ZN22wasi_snapshot_preview15State11descriptors17h860b12a5e30a2fabE (;30;) (type 0) (param i32 i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 6160
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.load offset=24
          br_if 0 (;@2;)
          local.get 1
          i32.const -1
          i32.store offset=24
          local.get 1
          i32.const 32
          i32.add
          local.set 3
          block ;; label = @3
            local.get 1
            i32.load offset=6180
            i32.const 2
            i32.ne
            br_if 0 (;@3;)
            local.get 2
            local.get 1
            call $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new17h610d7ff06fad0b15E
            local.get 3
            local.get 2
            i32.const 6160
            memory.copy
            local.get 1
            i32.load offset=6180
            i32.const 2
            i32.eq
            br_if 2 (;@1;)
          end
          local.get 0
          local.get 1
          i32.const 24
          i32.add
          i32.store offset=4
          local.get 0
          local.get 3
          i32.store
          local.get 2
          i32.const 6160
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 2894
        call $_ZN22wasi_snapshot_preview16macros11unreachable17h72b2e3b41475977aE
        unreachable
      end
      i32.const 2898
      call $_ZN22wasi_snapshot_preview16macros11unreachable17h72b2e3b41475977aE
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new17h610d7ff06fad0b15E (;31;) (type 0) (param i32 i32)
      (local i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 6256
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      i32.const 0
      local.set 3
      local.get 2
      i32.const 0
      i32.store offset=6156
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli5stdin9get_stdin11wit_import017h58854027ae8afcb9E
      local.set 4
      local.get 2
      i32.const 2
      i32.store8 offset=49
      local.get 2
      i32.const 0
      i32.store8 offset=32
      local.get 2
      i64.const 0
      i64.store offset=24
      local.get 2
      i32.const 1
      i32.store offset=8
      local.get 2
      local.get 4
      i64.extend_i32_u
      i64.const 32
      i64.shl
      i64.const 1
      i64.or
      i64.store offset=16
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli6stdout10get_stdout11wit_import017hec4f54697a66871fE
      local.set 4
      local.get 2
      i32.const 2
      i32.store8 offset=97
      local.get 2
      i32.const 1
      i32.store8 offset=80
      local.get 2
      i64.const 0
      i64.store offset=64
      local.get 2
      i32.const 1
      i32.store offset=56
      local.get 2
      local.get 4
      i64.extend_i32_u
      i64.const 32
      i64.shl
      i64.const 1
      i64.or
      i64.store offset=72
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli6stderr10get_stderr11wit_import017hf222d491a524afddE
      local.set 4
      local.get 2
      i32.const 3
      i32.store16 offset=6152
      local.get 2
      i32.const 2
      i32.store8 offset=145
      local.get 2
      i32.const 2
      i32.store8 offset=128
      local.get 2
      i64.const 0
      i64.store offset=112
      local.get 2
      i32.const 1
      i32.store offset=104
      local.get 2
      local.get 4
      i64.extend_i32_u
      i64.const 32
      i64.shl
      i64.const 1
      i64.or
      i64.store offset=120
      local.get 2
      i32.const 59032
      i32.store offset=6184
      local.get 2
      local.get 1
      i32.const 6192
      i32.add
      i32.store offset=6180
      local.get 2
      i64.const 1
      i64.store offset=6172 align=4
      local.get 2
      i32.const 6208
      i32.add
      local.get 1
      local.get 2
      i32.const 6172
      i32.add
      call $_ZN22wasi_snapshot_preview15State17with_import_alloc17h3c55888fffb7735aE
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.load offset=6212
            local.tee 5
            i32.eqz
            br_if 0 (;@3;)
            local.get 2
            i32.load offset=6208
            local.set 1
            local.get 2
            i32.const 152
            i32.add
            local.set 4
            local.get 2
            i32.const 6216
            i32.add
            local.set 6
            loop ;; label = @4
              local.get 2
              local.get 1
              i32.load offset=8
              i32.store offset=6200
              local.get 2
              local.get 1
              i64.load align=4
              i64.store offset=6192
              local.get 2
              local.get 2
              i32.const 6192
              i32.add
              call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor8get_type17hf85c5e73d4b238b4E
              local.get 2
              i32.load8_u
              br_if 2 (;@2;)
              local.get 2
              i32.load8_u offset=1
              local.set 7
              local.get 6
              i64.const 0
              i64.store
              local.get 6
              i64.const 0
              i64.store offset=8
              local.get 2
              local.get 2
              i32.load offset=6200
              i32.store offset=6252
              local.get 2
              i32.const 256
              i32.store16 offset=6248
              local.get 2
              i64.const 0
              i64.store offset=6240
              local.get 2
              local.get 2
              i32.load offset=6192
              i32.store offset=6232
              local.get 2
              i32.const 1
              i32.store offset=6208
              local.get 2
              local.get 7
              i32.store8 offset=6236
              local.get 3
              i32.const 125
              i32.eq
              br_if 3 (;@1;)
              local.get 4
              local.get 2
              i32.const 6208
              i32.add
              i32.const 48
              memory.copy
              local.get 2
              local.get 3
              i32.const 4
              i32.add
              i32.store16 offset=6152
              local.get 1
              i32.const 12
              i32.add
              local.set 1
              local.get 4
              i32.const 48
              i32.add
              local.set 4
              local.get 3
              i32.const 1
              i32.add
              local.tee 7
              local.set 3
              local.get 5
              local.get 7
              i32.ne
              br_if 0 (;@4;)
            end
          end
          local.get 0
          local.get 2
          i32.const 8
          i32.add
          i32.const 6160
          memory.copy
          local.get 2
          i32.const 6256
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 167
        call $_ZN22wasi_snapshot_preview16macros11unreachable17h72b2e3b41475977aE
        unreachable
      end
      local.get 2
      i32.const 6208
      i32.add
      call $_ZN4core3ptr68drop_in_place$LT$wasi_snapshot_preview1..descriptors..Descriptor$GT$17h3d9fa5f5ce587ca8E
      i32.const 167
      call $_ZN22wasi_snapshot_preview16macros11unreachable17h72b2e3b41475977aE
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview16macros11unreachable17h72b2e3b41475977aE (;32;) (type 2) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE
      local.get 1
      i32.const 10
      i32.store8 offset=15
      local.get 1
      i32.const 15
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview15State17with_import_alloc17h3c55888fffb7735aE (;33;) (type 7) (param i32 i32 i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 1
      local.get 2
      i64.load offset=8 align=4
      i64.store offset=12 align=4
      local.get 1
      local.get 2
      i32.load offset=16
      i32.store offset=20
      local.get 1
      i32.load offset=4
      local.set 4
      local.get 1
      local.get 2
      i64.load align=4
      i64.store offset=4 align=4
      block ;; label = @1
        local.get 4
        i32.const 4
        i32.ne
        br_if 0 (;@1;)
        local.get 3
        i64.const 0
        i64.store align=4
        local.get 3
        call $_ZN22wasi_snapshot_preview111descriptors31wasi_filesystem_get_directories17h6f6ffe1530906a56E
        local.get 0
        local.get 3
        i64.load align=4
        i64.store align=4
        local.get 0
        local.get 1
        i32.const 4
        i32.add
        local.tee 1
        i32.load offset=16
        i32.store offset=24
        local.get 0
        local.get 1
        i64.load offset=8 align=4
        i64.store offset=16 align=4
        local.get 0
        local.get 1
        i64.load align=4
        i64.store offset=8 align=4
        local.get 1
        i32.const 4
        i32.store
        local.get 3
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 2945
      call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE
      local.get 3
      i32.const 8250
      i32.store16 align=1
      local.get 3
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      local.get 3
      i32.const 10
      i32.store8 offset=28
      local.get 3
      i32.const 1952805664
      i32.store offset=24 align=1
      local.get 3
      i64.const 8747223464599642400
      i64.store offset=16 align=1
      local.get 3
      i64.const 8245937404367563884
      i64.store offset=8 align=1
      local.get 3
      i64.const 6998721855778483561
      i64.store align=1
      local.get 3
      i32.const 29
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      local.get 3
      i32.const 10
      i32.store8
      local.get 3
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview15State3new17hc3017e6c6a6402baE (;34;) (type 9) (result i32)
      (local i32)
      block ;; label = @1
        call $get_allocation_state
        i32.const 2
        i32.ne
        br_if 0 (;@1;)
        i32.const 3
        call $set_allocation_state
        i32.const 0
        i32.const 0
        i32.const 8
        i32.const 65536
        call $realloc_via_memory_grow
        local.set 0
        i32.const 4
        call $set_allocation_state
        local.get 0
        i32.const 0
        i32.store offset=65520
        local.get 0
        i32.const 2
        i32.store offset=6180
        local.get 0
        i32.const 0
        i32.store offset=24
        local.get 0
        i64.const 17740359541
        i64.store
        local.get 0
        i32.const 65480
        i32.add
        i32.const 0
        i32.const 37
        memory.fill
        local.get 0
        i32.const 560490357
        i32.store offset=65532
        local.get 0
        i32.const 11822
        i32.store16 offset=65528
        local.get 0
        return
      end
      i32.const 2836
      call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview15State3ptr17h8f6c929b68e85383E (;35;) (type 9) (result i32)
      (local i32)
      block ;; label = @1
        call $get_state_ptr
        local.tee 0
        br_if 0 (;@1;)
        call $_ZN22wasi_snapshot_preview15State3new17hc3017e6c6a6402baE
        local.tee 0
        call $set_state_ptr
      end
      local.get 0
    )
    (func $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E (;36;) (type 10) (param i32 i32 i32) (result i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 1
            i32.popcnt
            i32.const 1
            i32.ne
            br_if 0 (;@3;)
            local.get 0
            i32.load offset=4
            local.tee 4
            local.get 1
            local.get 0
            i32.load
            local.tee 5
            i32.add
            i32.const -1
            i32.add
            i32.const 0
            local.get 1
            i32.sub
            i32.and
            local.get 5
            i32.sub
            local.tee 1
            i32.lt_u
            br_if 1 (;@2;)
            local.get 4
            local.get 1
            i32.sub
            local.tee 4
            local.get 2
            i32.ge_u
            br_if 2 (;@1;)
            i32.const 450
            call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE
            local.get 3
            i32.const 8250
            i32.store16 offset=3 align=1
            local.get 3
            i32.const 3
            i32.add
            i32.const 2
            call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
            local.get 3
            i32.const 10
            i32.store8 offset=31
            local.get 3
            i32.const 1701278305
            i32.store offset=27 align=1
            local.get 3
            i64.const 7791349879831294825
            i64.store offset=19 align=1
            local.get 3
            i64.const 2334406575183130223
            i64.store offset=11 align=1
            local.get 3
            i64.const 7598805550979902561
            i64.store offset=3 align=1
            local.get 3
            i32.const 3
            i32.add
            i32.const 29
            call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
            local.get 3
            i32.const 10
            i32.store8 offset=3
            local.get 3
            i32.const 3
            i32.add
            i32.const 1
            call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
            unreachable
          end
          i32.const 460
          call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE
          local.get 3
          i32.const 8250
          i32.store16 offset=3 align=1
          local.get 3
          i32.const 3
          i32.add
          i32.const 2
          call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
          local.get 3
          i32.const 2676
          i32.store16 offset=19 align=1
          local.get 3
          i64.const 7954884637768641633
          i64.store offset=11 align=1
          local.get 3
          i64.const 2334106421097295465
          i64.store offset=3 align=1
          local.get 3
          i32.const 3
          i32.add
          i32.const 18
          call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
          local.get 3
          i32.const 10
          i32.store8 offset=3
          local.get 3
          i32.const 3
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
          unreachable
        end
        i32.const 464
        call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE
        local.get 3
        i32.const 8250
        i32.store16 offset=3 align=1
        local.get 3
        i32.const 3
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
        local.get 3
        i32.const 10
        i32.store8 offset=21
        local.get 3
        i32.const 25972
        i32.store16 offset=19 align=1
        local.get 3
        i64.const 7017575155838820463
        i64.store offset=11 align=1
        local.get 3
        i64.const 8367798494427701606
        i64.store offset=3 align=1
        local.get 3
        i32.const 3
        i32.add
        i32.const 19
        call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
        local.get 3
        i32.const 10
        i32.store8 offset=3
        local.get 3
        i32.const 3
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
        unreachable
      end
      local.get 0
      local.get 4
      local.get 2
      i32.sub
      i32.store offset=4
      local.get 0
      local.get 5
      local.get 1
      i32.add
      local.tee 1
      local.get 2
      i32.add
      i32.store
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $cabi_import_realloc (;37;) (type 3) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i64)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        call $_ZN22wasi_snapshot_preview15State3ptr17h8f6c929b68e85383E
                        local.tee 5
                        i32.load
                        i32.const 560490357
                        i32.ne
                        br_if 0 (;@9;)
                        block ;; label = @10
                          local.get 5
                          i32.load offset=65532
                          i32.const 560490357
                          i32.ne
                          br_if 0 (;@10;)
                          local.get 5
                          i64.load offset=4 align=4
                          local.set 6
                          local.get 5
                          i32.const 4
                          i32.store offset=4
                          local.get 4
                          local.get 5
                          i32.load offset=20
                          i32.store offset=16
                          local.get 4
                          local.get 5
                          i64.load offset=12 align=4
                          i64.store offset=8
                          local.get 4
                          local.get 6
                          i64.store
                          local.get 0
                          i32.eqz
                          br_if 2 (;@8;)
                          local.get 1
                          local.get 3
                          i32.le_u
                          br_if 3 (;@7;)
                          local.get 2
                          i32.const 1
                          i32.eq
                          br_if 8 (;@2;)
                          i32.const 387
                          call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                          unreachable
                        end
                        i32.const 2805
                        call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                        unreachable
                      end
                      i32.const 2804
                      call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                      unreachable
                    end
                    local.get 4
                    i32.load
                    br_table 1 (;@6;) 4 (;@3;) 3 (;@4;) 2 (;@5;) 6 (;@1;) 1 (;@6;)
                  end
                  i32.const 386
                  call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                  unreachable
                end
                local.get 4
                i32.const 4
                i32.or
                local.get 2
                local.get 3
                call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E
                local.set 0
                local.get 4
                i32.const 4
                i32.store
                br 3 (;@2;)
              end
              local.get 4
              i32.const 12
              i32.add
              local.set 0
              block ;; label = @5
                local.get 2
                i32.const 1
                i32.eq
                br_if 0 (;@5;)
                local.get 0
                local.get 2
                local.get 3
                call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E
                local.set 0
                br 3 (;@2;)
              end
              local.get 4
              local.get 4
              i32.load offset=4
              local.tee 2
              i32.const 1
              i32.add
              i32.store offset=4
              block ;; label = @5
                local.get 2
                local.get 4
                i32.load offset=8
                i32.eq
                br_if 0 (;@5;)
                local.get 4
                local.get 4
                i64.load offset=12 align=4
                i64.store offset=24 align=4
                local.get 4
                i32.const 24
                i32.add
                i32.const 1
                local.get 3
                call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E
                local.set 0
                br 3 (;@2;)
              end
              local.get 0
              i32.const 1
              local.get 3
              call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E
              local.set 0
              br 2 (;@2;)
            end
            block ;; label = @4
              local.get 2
              i32.const 1
              i32.eq
              br_if 0 (;@4;)
              local.get 4
              i32.const 12
              i32.add
              local.get 2
              local.get 3
              call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E
              local.set 0
              br 2 (;@2;)
            end
            local.get 4
            i32.const 4
            i32.or
            i32.const 1
            local.get 3
            i32.const 1
            i32.add
            call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E
            local.set 0
            br 1 (;@2;)
          end
          block ;; label = @3
            local.get 2
            i32.const 1
            i32.eq
            br_if 0 (;@3;)
            local.get 4
            i32.const 8
            i32.add
            local.get 2
            local.get 3
            call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E
            local.set 0
            br 1 (;@2;)
          end
          local.get 4
          local.get 4
          i32.load offset=4
          local.get 3
          i32.add
          i32.store offset=4
          local.get 4
          local.get 4
          i64.load offset=8
          i64.store offset=24 align=4
          local.get 4
          i32.const 24
          i32.add
          i32.const 1
          local.get 3
          call $_ZN22wasi_snapshot_preview19BumpAlloc5alloc17hc681aeb79b7f7494E
          local.set 0
        end
        local.get 5
        i32.const 4
        i32.add
        local.tee 5
        local.get 4
        i32.load offset=16
        i32.store offset=16
        local.get 5
        local.get 4
        i64.load offset=8
        i64.store offset=8 align=4
        local.get 5
        local.get 4
        i64.load
        i64.store align=4
        local.get 4
        i32.const 48
        i32.add
        global.set $__stack_pointer
        local.get 0
        return
      end
      i32.const 428
      call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE
      local.get 4
      i32.const 8250
      i32.store16 offset=24 align=1
      local.get 4
      i32.const 24
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      local.get 4
      i64.const 748834980320733542
      i64.store offset=40 align=1
      local.get 4
      i64.const 7957688057596965985
      i64.store offset=32 align=1
      local.get 4
      i64.const 7165064744911531886
      i64.store offset=24 align=1
      local.get 4
      i32.const 24
      i32.add
      i32.const 24
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      local.get 4
      i32.const 10
      i32.store8 offset=24
      local.get 4
      i32.const 24
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor8get_type17hf85c5e73d4b238b4E (;38;) (type 0) (param i32 i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 1
      i32.load
      local.get 2
      i32.const 14
      i32.add
      call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor8get_type11wit_import117h54c823cf8ae77d8aE
      i32.const 0
      local.set 3
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            local.get 2
            i32.load8_u offset=14
            br_table 1 (;@2;) 0 (;@3;) 2 (;@1;)
          end
          i32.const 1
          local.set 3
        end
        local.get 2
        i32.load8_u offset=15
        local.set 1
      end
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 0
      local.get 3
      i32.const 1
      i32.and
      i32.store8
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor4stat17hf48376d2b8f81141E (;39;) (type 0) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 112
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 1
      i32.load
      local.get 2
      i32.const 8
      i32.add
      call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor4stat11wit_import117hb49e8f43c65e44d3E
      local.get 2
      i32.load8_u offset=16
      local.set 1
      block ;; label = @1
        block ;; label = @2
          local.get 2
          i32.load8_u offset=8
          br_if 0 (;@2;)
          local.get 0
          local.get 2
          i64.load offset=32
          i64.store offset=16
          local.get 0
          local.get 2
          i64.load offset=24
          i64.store offset=8
          local.get 0
          local.get 1
          i32.store8
          local.get 0
          local.get 2
          i32.load offset=104
          i32.store offset=88
          local.get 0
          local.get 2
          i64.load offset=96
          i64.store offset=80
          local.get 0
          local.get 2
          i32.load offset=80
          i32.store offset=64
          local.get 0
          local.get 2
          i64.load offset=72
          i64.store offset=56
          local.get 0
          local.get 2
          i32.load offset=56
          i32.store offset=40
          local.get 0
          local.get 2
          i64.load offset=48
          i64.store offset=32
          local.get 0
          local.get 2
          i32.load8_u offset=88
          i32.const 0
          i32.ne
          i64.extend_i32_u
          i64.store offset=72
          local.get 0
          local.get 2
          i32.load8_u offset=64
          i32.const 0
          i32.ne
          i64.extend_i32_u
          i64.store offset=48
          local.get 0
          local.get 2
          i32.load8_u offset=40
          i32.const 0
          i32.ne
          i64.extend_i32_u
          i64.store offset=24
          br 1 (;@1;)
        end
        local.get 0
        i64.const 2
        i64.store offset=72
        local.get 0
        local.get 1
        i32.store8
      end
      local.get 2
      i32.const 112
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor17append_via_stream17hd592c1213d8038aeE (;40;) (type 0) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      local.get 2
      i64.const 0
      i64.store offset=8
      local.get 1
      i32.load
      local.get 2
      i32.const 8
      i32.add
      call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor17append_via_stream11wit_import117hf3fe07cdc09bd749E
      block ;; label = @1
        block ;; label = @2
          local.get 2
          i32.load8_u offset=8
          local.tee 1
          br_if 0 (;@2;)
          local.get 0
          local.get 2
          i32.load offset=12
          i32.store offset=4
          br 1 (;@1;)
        end
        local.get 0
        local.get 2
        i32.load8_u offset=12
        i32.store8 offset=1
      end
      local.get 0
      local.get 1
      i32.store8
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $fd_read (;41;) (type 3) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i64)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        block ;; label = @10
                          block ;; label = @11
                            block ;; label = @12
                              block ;; label = @13
                                block ;; label = @14
                                  local.get 2
                                  i32.const 2
                                  i32.lt_u
                                  br_if 0 (;@14;)
                                  local.get 1
                                  local.get 2
                                  i32.const 3
                                  i32.shl
                                  i32.add
                                  i32.const -8
                                  i32.add
                                  local.set 5
                                  loop ;; label = @15
                                    local.get 1
                                    i32.const 4
                                    i32.add
                                    i32.load
                                    local.tee 6
                                    br_if 3 (;@12;)
                                    local.get 1
                                    i32.const 8
                                    i32.add
                                    local.set 1
                                    local.get 2
                                    i32.const -1
                                    i32.add
                                    local.tee 2
                                    i32.const 1
                                    i32.gt_u
                                    br_if 0 (;@15;)
                                  end
                                  local.get 5
                                  local.set 1
                                  br 1 (;@13;)
                                end
                                local.get 2
                                i32.eqz
                                br_if 2 (;@11;)
                              end
                              local.get 1
                              i32.load offset=4
                              local.set 6
                            end
                            local.get 1
                            i32.load
                            local.set 7
                            call $_ZN22wasi_snapshot_preview15State3ptr17h8f6c929b68e85383E
                            local.tee 1
                            i32.load
                            i32.const 560490357
                            i32.ne
                            br_if 1 (;@10;)
                            local.get 1
                            i32.load offset=65532
                            i32.const 560490357
                            i32.ne
                            br_if 4 (;@7;)
                            local.get 4
                            i32.const 8
                            i32.add
                            local.get 1
                            call $_ZN22wasi_snapshot_preview15State11descriptors17h860b12a5e30a2fabE
                            i32.const 8
                            local.set 5
                            local.get 4
                            i32.load offset=12
                            local.set 2
                            local.get 0
                            local.get 4
                            i32.load offset=8
                            local.tee 8
                            i32.load16_u offset=6144
                            i32.ge_u
                            br_if 9 (;@2;)
                            local.get 8
                            local.get 0
                            i32.const 48
                            i32.mul
                            i32.add
                            local.tee 0
                            i32.load
                            i32.const 1
                            i32.ne
                            br_if 9 (;@2;)
                            local.get 0
                            i32.load8_u offset=41
                            local.set 5
                            local.get 4
                            i32.const 16
                            i32.add
                            local.get 0
                            i32.const 8
                            i32.add
                            call $_ZN22wasi_snapshot_preview111descriptors7Streams15get_read_stream17h524fdb9a4cef43baE
                            block ;; label = @12
                              local.get 4
                              i32.load16_u offset=16
                              i32.const 1
                              i32.ne
                              br_if 0 (;@12;)
                              local.get 4
                              i32.load16_u offset=18
                              local.set 5
                              br 10 (;@2;)
                            end
                            local.get 4
                            i32.load offset=20
                            local.set 9
                            local.get 1
                            local.get 6
                            i32.store offset=12
                            local.get 1
                            local.get 7
                            i32.store offset=8
                            local.get 1
                            i32.load offset=4
                            local.set 8
                            local.get 1
                            i32.const 0
                            i32.store offset=4
                            local.get 8
                            i32.const 4
                            i32.ne
                            br_if 2 (;@9;)
                            local.get 6
                            i64.extend_i32_u
                            local.set 10
                            block ;; label = @12
                              block ;; label = @13
                                block ;; label = @14
                                  local.get 5
                                  i32.const 255
                                  i32.and
                                  i32.eqz
                                  br_if 0 (;@14;)
                                  local.get 9
                                  i32.load
                                  local.get 10
                                  local.get 4
                                  i32.const 16
                                  i32.add
                                  call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams11InputStream13blocking_read11wit_import117h08adea216919b298E
                                  local.get 4
                                  i32.load8_u offset=16
                                  i32.eqz
                                  br_if 1 (;@13;)
                                  local.get 4
                                  i32.load8_u offset=20
                                  i32.const 0
                                  i32.ne
                                  local.set 9
                                  local.get 4
                                  i32.load offset=24
                                  local.set 5
                                  br 8 (;@6;)
                                end
                                local.get 9
                                i32.load
                                local.get 10
                                local.get 4
                                i32.const 16
                                i32.add
                                call $_ZN22wasi_snapshot_preview18bindings4wasi2io7streams11InputStream4read11wit_import117h08f0fa01ab0d661eE
                                block ;; label = @14
                                  block ;; label = @15
                                    block ;; label = @16
                                      local.get 4
                                      i32.load8_u offset=16
                                      i32.eqz
                                      br_if 0 (;@16;)
                                      local.get 4
                                      i32.load8_u offset=20
                                      i32.const 0
                                      i32.ne
                                      local.set 9
                                      local.get 4
                                      i32.load offset=24
                                      local.set 5
                                      br 1 (;@15;)
                                    end
                                    i32.const -2147483648
                                    local.set 5
                                    local.get 4
                                    i32.load offset=20
                                    local.set 9
                                    local.get 4
                                    i32.load offset=24
                                    local.tee 8
                                    i32.const -2147483648
                                    i32.ne
                                    br_if 1 (;@14;)
                                  end
                                  local.get 9
                                  i32.const 1
                                  i32.and
                                  br_if 10 (;@4;)
                                  local.get 5
                                  call $_ZN22wasi_snapshot_preview121stream_error_to_errno17h829d46e8481b67e6E
                                  i32.const 65535
                                  i32.and
                                  local.set 5
                                  br 9 (;@5;)
                                end
                                local.get 6
                                i32.eqz
                                br_if 1 (;@12;)
                                i32.const 6
                                local.set 5
                                local.get 8
                                br_if 1 (;@12;)
                                br 8 (;@5;)
                              end
                              i32.const -2147483648
                              local.set 5
                              local.get 4
                              i32.load offset=20
                              local.set 9
                              local.get 4
                              i32.load offset=24
                              local.tee 8
                              i32.const -2147483648
                              i32.eq
                              br_if 6 (;@6;)
                            end
                            local.get 1
                            i32.const 4
                            i32.store offset=4
                            block ;; label = @12
                              local.get 8
                              i32.eqz
                              br_if 0 (;@12;)
                              local.get 9
                              local.get 7
                              i32.ne
                              br_if 4 (;@8;)
                            end
                            local.get 8
                            local.get 6
                            i32.le_u
                            br_if 8 (;@3;)
                            i32.const 1279
                            call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                            unreachable
                          end
                          i32.const 0
                          local.set 5
                          local.get 3
                          i32.const 0
                          i32.store
                          br 9 (;@1;)
                        end
                        i32.const 2804
                        call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                        unreachable
                      end
                      i32.const 2945
                      call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE
                      local.get 4
                      i32.const 8250
                      i32.store16 offset=16 align=1
                      local.get 4
                      i32.const 16
                      i32.add
                      i32.const 2
                      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
                      local.get 4
                      i32.const 10
                      i32.store8 offset=44
                      local.get 4
                      i32.const 1952805664
                      i32.store offset=40 align=1
                      local.get 4
                      i64.const 8747223464599642400
                      i64.store offset=32 align=1
                      local.get 4
                      i64.const 8245937404367563884
                      i64.store offset=24 align=1
                      local.get 4
                      i64.const 6998721855778483561
                      i64.store offset=16 align=1
                      local.get 4
                      i32.const 16
                      i32.add
                      i32.const 29
                      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
                      local.get 4
                      i32.const 10
                      i32.store8 offset=16
                      local.get 4
                      i32.const 16
                      i32.add
                      i32.const 1
                      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
                      unreachable
                    end
                    i32.const 1278
                    call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                    unreachable
                  end
                  i32.const 2805
                  call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                  unreachable
                end
                local.get 9
                i32.const 1
                i32.and
                br_if 1 (;@4;)
                local.get 5
                call $_ZN22wasi_snapshot_preview121stream_error_to_errno17h829d46e8481b67e6E
                i32.const 65535
                i32.and
                local.set 5
              end
              local.get 1
              i32.const 4
              i32.store offset=4
              br 2 (;@2;)
            end
            local.get 1
            i32.const 4
            i32.store offset=4
            i32.const 0
            local.set 8
          end
          block ;; label = @3
            local.get 0
            i32.load8_u offset=41
            i32.const 2
            i32.eq
            br_if 0 (;@3;)
            local.get 0
            local.get 0
            i64.load offset=32
            local.get 8
            i64.extend_i32_u
            i64.add
            i64.store offset=32
          end
          local.get 3
          local.get 8
          i32.store
          i32.const 0
          local.set 5
        end
        local.get 2
        local.get 2
        i32.load
        i32.const 1
        i32.add
        i32.store
      end
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 5
      i32.const 65535
      i32.and
    )
    (func $_ZN22wasi_snapshot_preview111descriptors7Streams15get_read_stream17h524fdb9a4cef43baE (;42;) (type 0) (param i32 i32)
      (local i32 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 1
              i32.load
              br_if 0 (;@4;)
              local.get 1
              i32.load8_u offset=33
              i32.const 2
              i32.eq
              br_if 1 (;@3;)
              block ;; label = @5
                local.get 1
                i32.load8_u offset=20
                i32.const 3
                i32.ne
                br_if 0 (;@5;)
                local.get 0
                i32.const 8
                i32.store16 offset=2
                i32.const 1
                local.set 1
                br 4 (;@1;)
              end
              local.get 1
              i64.load offset=24
              local.set 3
              local.get 2
              i64.const 0
              i64.store offset=8
              local.get 1
              i32.load offset=16
              local.get 3
              local.get 2
              i32.const 8
              i32.add
              call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor15read_via_stream11wit_import117h57c6387817993995E
              block ;; label = @5
                local.get 2
                i32.load8_u offset=8
                i32.eqz
                br_if 0 (;@5;)
                local.get 0
                local.get 2
                i32.load8_u offset=12
                call $_ZN22wasi_snapshot_preview1154_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi..filesystem..types..ErrorCode$GT$$u20$for$u20$wasip1..lib_generated..Errno$GT$4from17h3471f09acf6a1d8fE
                i32.store16 offset=2
                i32.const 1
                local.set 1
                br 4 (;@1;)
              end
              local.get 1
              i32.load
              i32.const 1
              i32.eq
              br_if 2 (;@2;)
              local.get 1
              local.get 2
              i32.load offset=12
              i32.store offset=4
              local.get 1
              i32.const 1
              i32.store
            end
            local.get 0
            local.get 1
            i32.const 4
            i32.add
            i32.store offset=4
            i32.const 0
            local.set 1
            br 2 (;@1;)
          end
          local.get 0
          i32.const 8
          i32.store16 offset=2
          i32.const 1
          local.set 1
          br 1 (;@1;)
        end
        i32.const 167
        call $_ZN22wasi_snapshot_preview16macros11unreachable17h72b2e3b41475977aE
        unreachable
      end
      local.get 0
      local.get 1
      i32.store16
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN4core3ptr68drop_in_place$LT$wasi_snapshot_preview1..descriptors..Descriptor$GT$17h3d9fa5f5ce587ca8E (;43;) (type 2) (param i32)
      (local i32)
      block ;; label = @1
        local.get 0
        i32.load
        i32.const 1
        i32.ne
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 0
          i32.load offset=8
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=12
          local.tee 1
          i32.const -1
          i32.eq
          br_if 0 (;@2;)
          local.get 1
          call $_ZN136_$LT$wasi_snapshot_preview1..bindings..wasi..io..streams..InputStream$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17he261c14510126a76E
        end
        block ;; label = @2
          local.get 0
          i32.load offset=16
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=20
          local.tee 1
          i32.const -1
          i32.eq
          br_if 0 (;@2;)
          local.get 1
          call $_ZN137_$LT$wasi_snapshot_preview1..bindings..wasi..io..streams..OutputStream$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17ha5301ace69c1ec80E
        end
        local.get 0
        i32.load8_u offset=41
        i32.const 2
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=24
        local.tee 0
        i32.const -1
        i32.eq
        br_if 0 (;@1;)
        local.get 0
        call $_ZN141_$LT$wasi_snapshot_preview1..bindings..wasi..filesystem..types..Descriptor$u20$as$u20$wasi_snapshot_preview1..bindings.._rt..WasmResource$GT$4drop4drop17hf4c86b9b2c710766E
      end
    )
    (func $fd_write (;44;) (type 3) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 112
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            call $get_allocation_state
            i32.const -2
            i32.add
            br_table 1 (;@2;) 0 (;@3;) 1 (;@2;) 0 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.store
          i32.const 29
          local.set 1
          br 1 (;@1;)
        end
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    block ;; label = @8
                      block ;; label = @9
                        local.get 2
                        i32.const 2
                        i32.lt_u
                        br_if 0 (;@9;)
                        local.get 1
                        local.get 2
                        i32.const 3
                        i32.shl
                        i32.add
                        i32.const -8
                        i32.add
                        local.set 5
                        loop ;; label = @10
                          local.get 1
                          i32.const 4
                          i32.add
                          i32.load
                          local.tee 6
                          br_if 3 (;@7;)
                          local.get 1
                          i32.const 8
                          i32.add
                          local.set 1
                          local.get 2
                          i32.const -1
                          i32.add
                          local.tee 2
                          i32.const 1
                          i32.gt_u
                          br_if 0 (;@10;)
                        end
                        local.get 5
                        local.set 1
                        br 1 (;@8;)
                      end
                      local.get 2
                      i32.eqz
                      br_if 2 (;@6;)
                    end
                    local.get 1
                    i32.load offset=4
                    local.set 6
                  end
                  local.get 1
                  i32.load
                  local.set 7
                  call $_ZN22wasi_snapshot_preview15State3ptr17h8f6c929b68e85383E
                  local.tee 1
                  i32.load
                  i32.const 560490357
                  i32.ne
                  br_if 1 (;@5;)
                  block ;; label = @7
                    local.get 1
                    i32.load offset=65532
                    i32.const 560490357
                    i32.ne
                    br_if 0 (;@7;)
                    local.get 4
                    i32.const 8
                    i32.add
                    local.get 1
                    call $_ZN22wasi_snapshot_preview15State11descriptors17h860b12a5e30a2fabE
                    i32.const 8
                    local.set 1
                    local.get 4
                    i32.load offset=12
                    local.set 2
                    local.get 0
                    local.get 4
                    i32.load offset=8
                    local.tee 5
                    i32.load16_u offset=6144
                    i32.ge_u
                    br_if 5 (;@2;)
                    local.get 5
                    local.get 0
                    i32.const 48
                    i32.mul
                    i32.add
                    local.tee 0
                    i32.load
                    i32.const 1
                    i32.ne
                    br_if 5 (;@2;)
                    local.get 4
                    i32.const 16
                    i32.add
                    local.get 0
                    i32.const 8
                    i32.add
                    call $_ZN22wasi_snapshot_preview111descriptors7Streams16get_write_stream17h35fb3943f63e0539E
                    local.get 4
                    i32.load16_u offset=16
                    i32.const 1
                    i32.eq
                    br_if 4 (;@3;)
                    local.get 4
                    i32.load offset=20
                    local.set 1
                    block ;; label = @8
                      local.get 0
                      i32.load8_u offset=41
                      local.tee 5
                      i32.const 2
                      i32.eq
                      br_if 0 (;@8;)
                      local.get 4
                      i32.const 16
                      i32.add
                      local.get 5
                      i32.const 1
                      i32.and
                      local.get 1
                      local.get 7
                      local.get 6
                      call $_ZN22wasi_snapshot_preview112BlockingMode5write17h98e193f01fdc6647E
                      local.get 4
                      i32.load16_u offset=16
                      br_if 5 (;@3;)
                      br 4 (;@4;)
                    end
                    local.get 4
                    i32.const 16
                    i32.add
                    i32.const 1
                    local.get 1
                    local.get 7
                    local.get 6
                    call $_ZN22wasi_snapshot_preview112BlockingMode5write17h98e193f01fdc6647E
                    local.get 4
                    i32.load16_u offset=16
                    br_if 4 (;@3;)
                    br 3 (;@4;)
                  end
                  i32.const 2805
                  call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
                  unreachable
                end
                i32.const 0
                local.set 1
                local.get 3
                i32.const 0
                i32.store
                br 4 (;@1;)
              end
              i32.const 2804
              call $_ZN22wasi_snapshot_preview16macros11assert_fail17h032a0ff8e4dd1d49E
              unreachable
            end
            local.get 4
            i32.load offset=20
            local.set 1
            block ;; label = @4
              local.get 0
              i32.load8_u offset=41
              i32.const 2
              i32.eq
              br_if 0 (;@4;)
              block ;; label = @5
                local.get 0
                i32.load8_u offset=40
                br_if 0 (;@5;)
                local.get 0
                local.get 0
                i64.load offset=32
                local.get 1
                i64.extend_i32_u
                i64.add
                i64.store offset=32
                br 1 (;@4;)
              end
              local.get 4
              i32.const 16
              i32.add
              local.get 0
              i32.const 24
              i32.add
              call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor4stat17hf48376d2b8f81141E
              block ;; label = @5
                local.get 4
                i64.load offset=88
                i64.const 2
                i64.ne
                br_if 0 (;@5;)
                local.get 4
                i32.load8_u offset=16
                call $_ZN22wasi_snapshot_preview1154_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi..filesystem..types..ErrorCode$GT$$u20$for$u20$wasip1..lib_generated..Errno$GT$4from17h3471f09acf6a1d8fE
                local.set 1
                br 3 (;@2;)
              end
              local.get 0
              local.get 4
              i64.load offset=32
              i64.store offset=32
            end
            local.get 3
            local.get 1
            i32.store
            i32.const 0
            local.set 1
            br 1 (;@2;)
          end
          local.get 4
          i32.load16_u offset=18
          local.set 1
        end
        local.get 2
        local.get 2
        i32.load
        i32.const 1
        i32.add
        i32.store
      end
      local.get 4
      i32.const 112
      i32.add
      global.set $__stack_pointer
      local.get 1
      i32.const 65535
      i32.and
    )
    (func $_ZN22wasi_snapshot_preview111descriptors7Streams16get_write_stream17h35fb3943f63e0539E (;45;) (type 0) (param i32 i32)
      (local i32 i64 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 1
              i32.load offset=8
              br_if 0 (;@4;)
              block ;; label = @5
                block ;; label = @6
                  local.get 1
                  i32.load8_u offset=33
                  i32.const 2
                  i32.eq
                  br_if 0 (;@6;)
                  block ;; label = @7
                    local.get 1
                    i32.load8_u offset=20
                    i32.const 3
                    i32.ne
                    br_if 0 (;@7;)
                    local.get 0
                    i32.const 8
                    i32.store16 offset=2
                    br 5 (;@2;)
                  end
                  block ;; label = @7
                    local.get 1
                    i32.load8_u offset=32
                    br_if 0 (;@7;)
                    local.get 1
                    i64.load offset=24
                    local.set 3
                    local.get 2
                    i64.const 0
                    i64.store offset=8
                    local.get 1
                    i32.load offset=16
                    local.get 3
                    local.get 2
                    i32.const 8
                    i32.add
                    call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor16write_via_stream11wit_import117hd8284ac5165e3c5dE
                    local.get 2
                    i32.load8_u offset=8
                    i32.eqz
                    br_if 2 (;@5;)
                    local.get 0
                    local.get 2
                    i32.load8_u offset=12
                    call $_ZN22wasi_snapshot_preview1154_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi..filesystem..types..ErrorCode$GT$$u20$for$u20$wasip1..lib_generated..Errno$GT$4from17h3471f09acf6a1d8fE
                    i32.store16 offset=2
                    br 5 (;@2;)
                  end
                  local.get 2
                  i32.const 8
                  i32.add
                  local.get 1
                  i32.const 16
                  i32.add
                  call $_ZN22wasi_snapshot_preview18bindings4wasi10filesystem5types10Descriptor17append_via_stream17hd592c1213d8038aeE
                  local.get 2
                  i32.load8_u offset=8
                  i32.eqz
                  br_if 1 (;@5;)
                  local.get 0
                  local.get 2
                  i32.load8_u offset=9
                  call $_ZN22wasi_snapshot_preview1154_$LT$impl$u20$core..convert..From$LT$wasi_snapshot_preview1..bindings..wasi..filesystem..types..ErrorCode$GT$$u20$for$u20$wasip1..lib_generated..Errno$GT$4from17h3471f09acf6a1d8fE
                  i32.store16 offset=2
                  br 4 (;@2;)
                end
                local.get 0
                i32.const 8
                i32.store16 offset=2
                br 3 (;@2;)
              end
              local.get 2
              i32.load offset=12
              local.set 4
              local.get 1
              i32.load offset=8
              i32.const 1
              i32.eq
              br_if 1 (;@3;)
              local.get 1
              local.get 4
              i32.store offset=12
              local.get 1
              i32.const 1
              i32.store offset=8
            end
            local.get 0
            local.get 1
            i32.const 12
            i32.add
            i32.store offset=4
            i32.const 0
            local.set 1
            br 2 (;@1;)
          end
          i32.const 167
          call $_ZN22wasi_snapshot_preview16macros11unreachable17h72b2e3b41475977aE
          unreachable
        end
        i32.const 1
        local.set 1
      end
      local.get 0
      local.get 1
      i32.store16
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $proc_exit (;46;) (type 2) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      local.get 0
      i32.const 0
      i32.ne
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli4exit4exit17hd793cfb360844762E
      i32.const 2325
      call $_ZN22wasi_snapshot_preview16macros18eprint_unreachable17h19381446a19b9f5cE
      local.get 1
      i32.const 8250
      i32.store16 offset=10 align=1
      local.get 1
      i32.const 10
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      local.get 1
      i32.const 2593
      i32.store16 offset=46 align=1
      local.get 1
      i32.const 1953069157
      i32.store offset=42 align=1
      local.get 1
      i64.const 2338537461596644384
      i64.store offset=34 align=1
      local.get 1
      i64.const 7957695015159098981
      i64.store offset=26 align=1
      local.get 1
      i64.const 7882825952909664372
      i64.store offset=18 align=1
      local.get 1
      i64.const 7599935561254793064
      i64.store offset=10 align=1
      local.get 1
      i32.const 10
      i32.add
      i32.const 38
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      local.get 1
      i32.const 10
      i32.store8 offset=10
      local.get 1
      i32.const 10
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview18bindings4wasi3cli4exit4exit17hd793cfb360844762E (;47;) (type 2) (param i32)
      local.get 0
      call $_ZN22wasi_snapshot_preview18bindings4wasi3cli4exit4exit11wit_import117hd163e692951f3ed3E
    )
    (func $wasi:cli/run@0.2.6#run (;48;) (type 9) (result i32)
      call $_ZN22wasi_snapshot_preview13run6_start17h9a39352f3a66d6a9E
      i32.const 0
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17hb645ead8df04f6caE (;49;) (type 2) (param i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.const 10
        i32.div_u
        local.tee 2
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17hb645ead8df04f6caE
        local.get 1
        local.get 2
        i32.const 246
        i32.mul
        local.get 0
        i32.add
        i32.const 48
        i32.or
        i32.store8 offset=15
        local.get 1
        i32.const 15
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17hf9e73ed5aebf48c0E
      end
      local.get 1
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3217h6db63539958e7edbE (;50;) (type 2) (param i32)
      local.get 0
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17hb645ead8df04f6caE
    )
    (func $get_state_ptr (;51;) (type 9) (result i32)
      global.get $internal_state_ptr
    )
    (func $set_state_ptr (;52;) (type 2) (param i32)
      local.get 0
      global.set $internal_state_ptr
    )
    (func $get_allocation_state (;53;) (type 9) (result i32)
      global.get $allocation_state
    )
    (func $set_allocation_state (;54;) (type 2) (param i32)
      local.get 0
      global.set $allocation_state
    )
    (func $allocate_stack (;55;) (type 8)
      global.get $allocation_state
      i32.const 0
      i32.eq
      if ;; label = @1
        i32.const 1
        global.set $allocation_state
        i32.const 0
        i32.const 0
        i32.const 8
        i32.const 65536
        call $realloc_via_memory_grow
        i32.const 65536
        i32.add
        global.set $__stack_pointer
        i32.const 2
        global.set $allocation_state
      end
    )
    (@producers
      (language "Rust" "")
      (processed-by "rustc" "1.95.0 (59807616e 2026-04-14)")
    )
  )
  (core module $wit-component-shim-module (;2;)
    (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;1;) (func (param i32)))
    (type (;2;) (func (param i32 i32)))
    (type (;3;) (func (param i32 i32 i32 i32)))
    (type (;4;) (func (param i32 i64 i32)))
    (type (;5;) (func (param i32)))
    (table (;0;) 16 16 funcref)
    (export "0" (func 0))
    (export "1" (func 1))
    (export "2" (func 2))
    (export "3" (func 3))
    (export "4" (func 4))
    (export "5" (func 5))
    (export "6" (func 6))
    (export "7" (func 7))
    (export "8" (func 8))
    (export "9" (func 9))
    (export "10" (func 10))
    (export "11" (func 11))
    (export "12" (func 12))
    (export "13" (func 13))
    (export "14" (func 14))
    (export "15" (func 15))
    (export "$imports" (table 0))
    (func (;0;) (type 0) (param i32 i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 0
      call_indirect (type 0)
    )
    (func (;1;) (type 1) (param i32)
      local.get 0
      i32.const 1
      call_indirect (type 1)
    )
    (func (;2;) (type 0) (param i32 i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 2
      call_indirect (type 0)
    )
    (func (;3;) (type 2) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 3
      call_indirect (type 2)
    )
    (func (;4;) (type 3) (param i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 4
      call_indirect (type 3)
    )
    (func (;5;) (type 2) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 5
      call_indirect (type 2)
    )
    (func (;6;) (type 4) (param i32 i64 i32)
      local.get 0
      local.get 1
      local.get 2
      i32.const 6
      call_indirect (type 4)
    )
    (func (;7;) (type 4) (param i32 i64 i32)
      local.get 0
      local.get 1
      local.get 2
      i32.const 7
      call_indirect (type 4)
    )
    (func (;8;) (type 3) (param i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 8
      call_indirect (type 3)
    )
    (func (;9;) (type 2) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 9
      call_indirect (type 2)
    )
    (func (;10;) (type 4) (param i32 i64 i32)
      local.get 0
      local.get 1
      local.get 2
      i32.const 10
      call_indirect (type 4)
    )
    (func (;11;) (type 4) (param i32 i64 i32)
      local.get 0
      local.get 1
      local.get 2
      i32.const 11
      call_indirect (type 4)
    )
    (func (;12;) (type 2) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 12
      call_indirect (type 2)
    )
    (func (;13;) (type 2) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 13
      call_indirect (type 2)
    )
    (func (;14;) (type 2) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 14
      call_indirect (type 2)
    )
    (func (;15;) (type 5) (param i32)
      local.get 0
      i32.const 15
      call_indirect (type 5)
    )
    (@producers
      (processed-by "wit-component" "0.251.0")
    )
  )
  (core module $wit-component-fixup (;3;)
    (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;1;) (func (param i32)))
    (type (;2;) (func (param i32 i32)))
    (type (;3;) (func (param i32 i32 i32 i32)))
    (type (;4;) (func (param i32 i64 i32)))
    (type (;5;) (func (param i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "1" (func (;1;) (type 1)))
    (import "" "2" (func (;2;) (type 0)))
    (import "" "3" (func (;3;) (type 2)))
    (import "" "4" (func (;4;) (type 3)))
    (import "" "5" (func (;5;) (type 2)))
    (import "" "6" (func (;6;) (type 4)))
    (import "" "7" (func (;7;) (type 4)))
    (import "" "8" (func (;8;) (type 3)))
    (import "" "9" (func (;9;) (type 2)))
    (import "" "10" (func (;10;) (type 4)))
    (import "" "11" (func (;11;) (type 4)))
    (import "" "12" (func (;12;) (type 2)))
    (import "" "13" (func (;13;) (type 2)))
    (import "" "14" (func (;14;) (type 2)))
    (import "" "15" (func (;15;) (type 5)))
    (import "" "$imports" (table (;0;) 16 16 funcref))
    (elem (;0;) (i32.const 0) func 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
    (@producers
      (processed-by "wit-component" "0.251.0")
    )
  )
  (core instance $wit-component-shim-instance (;0;) (instantiate $wit-component-shim-module))
  (alias core export $wit-component-shim-instance "0" (core func $adapt-wasi_snapshot_preview1-fd_write (;0;)))
  (alias core export $wit-component-shim-instance "1" (core func $adapt-wasi_snapshot_preview1-proc_exit (;1;)))
  (alias core export $wit-component-shim-instance "2" (core func $adapt-wasi_snapshot_preview1-fd_read (;2;)))
  (core instance $wasi_snapshot_preview1 (;1;)
    (export "fd_write" (func $adapt-wasi_snapshot_preview1-fd_write))
    (export "proc_exit" (func $adapt-wasi_snapshot_preview1-proc_exit))
    (export "fd_read" (func $adapt-wasi_snapshot_preview1-fd_read))
  )
  (core instance $main (;2;) (instantiate $main
      (with "wasi_snapshot_preview1" (instance $wasi_snapshot_preview1))
    )
  )
  (alias core export $main "memory" (core memory $memory (;0;)))
  (core instance $env (;3;)
    (export "memory" (memory $memory))
  )
  (alias core export $wit-component-shim-instance "3" (core func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.check-write" (;3;)))
  (alias core export $wit-component-shim-instance "4" (core func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.write" (;4;)))
  (alias core export $wit-component-shim-instance "5" (core func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-flush" (;5;)))
  (alias export $wasi:io/streams@0.2.6 "output-stream" (type $"#type18 output-stream" (@name "output-stream") (;18;)))
  (core func $resource.drop (;6;) (canon resource.drop $"#type18 output-stream"))
  (alias core export $wit-component-shim-instance "6" (core func $"indirect-wasi:io/streams@0.2.6-[method]input-stream.blocking-read" (;7;)))
  (alias core export $wit-component-shim-instance "7" (core func $"indirect-wasi:io/streams@0.2.6-[method]input-stream.read" (;8;)))
  (alias export $wasi:io/streams@0.2.6 "input-stream" (type $"#type19 input-stream" (@name "input-stream") (;19;)))
  (core func $"#core-func9 resource.drop" (@name "resource.drop") (;9;) (canon resource.drop $"#type19 input-stream"))
  (alias core export $wit-component-shim-instance "8" (core func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush" (;10;)))
  (core instance $wasi:io/streams@0.2.6 (;4;)
    (export "[method]output-stream.check-write" (func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.check-write"))
    (export "[method]output-stream.write" (func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.write"))
    (export "[method]output-stream.blocking-flush" (func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-flush"))
    (export "[resource-drop]output-stream" (func $resource.drop))
    (export "[method]input-stream.blocking-read" (func $"indirect-wasi:io/streams@0.2.6-[method]input-stream.blocking-read"))
    (export "[method]input-stream.read" (func $"indirect-wasi:io/streams@0.2.6-[method]input-stream.read"))
    (export "[resource-drop]input-stream" (func $"#core-func9 resource.drop"))
    (export "[method]output-stream.blocking-write-and-flush" (func $"indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush"))
  )
  (alias core export $wit-component-shim-instance "9" (core func $indirect-wasi:filesystem/types@0.2.6-filesystem-error-code (;11;)))
  (alias export $wasi:filesystem/types@0.2.6 "descriptor" (type $"#type20 descriptor" (@name "descriptor") (;20;)))
  (core func $"#core-func12 resource.drop" (@name "resource.drop") (;12;) (canon resource.drop $"#type20 descriptor"))
  (alias core export $wit-component-shim-instance "10" (core func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.read-via-stream" (;13;)))
  (alias core export $wit-component-shim-instance "11" (core func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.write-via-stream" (;14;)))
  (alias core export $wit-component-shim-instance "12" (core func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.append-via-stream" (;15;)))
  (alias core export $wit-component-shim-instance "13" (core func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.stat" (;16;)))
  (alias core export $wit-component-shim-instance "14" (core func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.get-type" (;17;)))
  (core instance $wasi:filesystem/types@0.2.6 (;5;)
    (export "filesystem-error-code" (func $indirect-wasi:filesystem/types@0.2.6-filesystem-error-code))
    (export "[resource-drop]descriptor" (func $"#core-func12 resource.drop"))
    (export "[method]descriptor.read-via-stream" (func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.read-via-stream"))
    (export "[method]descriptor.write-via-stream" (func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.write-via-stream"))
    (export "[method]descriptor.append-via-stream" (func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.append-via-stream"))
    (export "[method]descriptor.stat" (func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.stat"))
    (export "[method]descriptor.get-type" (func $"indirect-wasi:filesystem/types@0.2.6-[method]descriptor.get-type"))
  )
  (alias export $wasi:io/error@0.2.6 "error" (type $"#type21 error" (@name "error") (;21;)))
  (core func $"#core-func18 resource.drop" (@name "resource.drop") (;18;) (canon resource.drop $"#type21 error"))
  (core instance $wasi:io/error@0.2.6 (;6;)
    (export "[resource-drop]error" (func $"#core-func18 resource.drop"))
  )
  (alias core export $wit-component-shim-instance "15" (core func $indirect-wasi:filesystem/preopens@0.2.6-get-directories (;19;)))
  (core instance $wasi:filesystem/preopens@0.2.6 (;7;)
    (export "get-directories" (func $indirect-wasi:filesystem/preopens@0.2.6-get-directories))
  )
  (alias core export $main "_start" (core func $_start (;20;)))
  (core instance $__main_module__ (;8;)
    (export "_start" (func $_start))
  )
  (alias export $wasi:cli/stderr@0.2.6 "get-stderr" (func $get-stderr (;0;)))
  (core func $get-stderr (;21;) (canon lower (func $get-stderr)))
  (core instance $wasi:cli/stderr@0.2.6 (;9;)
    (export "get-stderr" (func $get-stderr))
  )
  (alias export $wasi:cli/stdin@0.2.6 "get-stdin" (func $get-stdin (;1;)))
  (core func $get-stdin (;22;) (canon lower (func $get-stdin)))
  (core instance $wasi:cli/stdin@0.2.6 (;10;)
    (export "get-stdin" (func $get-stdin))
  )
  (alias export $wasi:cli/stdout@0.2.6 "get-stdout" (func $get-stdout (;2;)))
  (core func $get-stdout (;23;) (canon lower (func $get-stdout)))
  (core instance $wasi:cli/stdout@0.2.6 (;11;)
    (export "get-stdout" (func $get-stdout))
  )
  (alias export $wasi:cli/exit@0.2.6 "exit" (func $exit (;3;)))
  (core func $exit (;24;) (canon lower (func $exit)))
  (core instance $wasi:cli/exit@0.2.6 (;12;)
    (export "exit" (func $exit))
  )
  (core instance $"#core-instance13 wasi_snapshot_preview1" (@name "wasi_snapshot_preview1") (;13;) (instantiate $wit-component:adapter:wasi_snapshot_preview1
      (with "env" (instance $env))
      (with "wasi:io/streams@0.2.6" (instance $wasi:io/streams@0.2.6))
      (with "wasi:filesystem/types@0.2.6" (instance $wasi:filesystem/types@0.2.6))
      (with "wasi:io/error@0.2.6" (instance $wasi:io/error@0.2.6))
      (with "wasi:filesystem/preopens@0.2.6" (instance $wasi:filesystem/preopens@0.2.6))
      (with "__main_module__" (instance $__main_module__))
      (with "wasi:cli/stderr@0.2.6" (instance $wasi:cli/stderr@0.2.6))
      (with "wasi:cli/stdin@0.2.6" (instance $wasi:cli/stdin@0.2.6))
      (with "wasi:cli/stdout@0.2.6" (instance $wasi:cli/stdout@0.2.6))
      (with "wasi:cli/exit@0.2.6" (instance $wasi:cli/exit@0.2.6))
    )
  )
  (alias core export $wit-component-shim-instance "$imports" (core table $"shim table" (;0;)))
  (alias core export $"#core-instance13 wasi_snapshot_preview1" "fd_write" (core func $fd_write (;25;)))
  (alias core export $"#core-instance13 wasi_snapshot_preview1" "proc_exit" (core func $proc_exit (;26;)))
  (alias core export $"#core-instance13 wasi_snapshot_preview1" "fd_read" (core func $fd_read (;27;)))
  (alias export $wasi:io/streams@0.2.6 "[method]output-stream.check-write" (func $"[method]output-stream.check-write" (;4;)))
  (alias core export $"#core-instance13 wasi_snapshot_preview1" "cabi_import_realloc" (core func $realloc (;28;)))
  (core func $"#core-func29 indirect-wasi:io/streams@0.2.6-[method]output-stream.check-write" (@name "indirect-wasi:io/streams@0.2.6-[method]output-stream.check-write") (;29;) (canon lower (func $"[method]output-stream.check-write") (memory $memory)))
  (alias export $wasi:io/streams@0.2.6 "[method]output-stream.write" (func $"[method]output-stream.write" (;5;)))
  (core func $"#core-func30 indirect-wasi:io/streams@0.2.6-[method]output-stream.write" (@name "indirect-wasi:io/streams@0.2.6-[method]output-stream.write") (;30;) (canon lower (func $"[method]output-stream.write") (memory $memory)))
  (alias export $wasi:io/streams@0.2.6 "[method]output-stream.blocking-flush" (func $"[method]output-stream.blocking-flush" (;6;)))
  (core func $"#core-func31 indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-flush" (@name "indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-flush") (;31;) (canon lower (func $"[method]output-stream.blocking-flush") (memory $memory)))
  (alias export $wasi:io/streams@0.2.6 "[method]input-stream.blocking-read" (func $"[method]input-stream.blocking-read" (;7;)))
  (core func $"#core-func32 indirect-wasi:io/streams@0.2.6-[method]input-stream.blocking-read" (@name "indirect-wasi:io/streams@0.2.6-[method]input-stream.blocking-read") (;32;) (canon lower (func $"[method]input-stream.blocking-read") (memory $memory) (realloc $realloc)))
  (alias export $wasi:io/streams@0.2.6 "[method]input-stream.read" (func $"[method]input-stream.read" (;8;)))
  (core func $"#core-func33 indirect-wasi:io/streams@0.2.6-[method]input-stream.read" (@name "indirect-wasi:io/streams@0.2.6-[method]input-stream.read") (;33;) (canon lower (func $"[method]input-stream.read") (memory $memory) (realloc $realloc)))
  (alias export $wasi:io/streams@0.2.6 "[method]output-stream.blocking-write-and-flush" (func $"[method]output-stream.blocking-write-and-flush" (;9;)))
  (core func $"#core-func34 indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush" (@name "indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush") (;34;) (canon lower (func $"[method]output-stream.blocking-write-and-flush") (memory $memory)))
  (alias export $wasi:filesystem/types@0.2.6 "filesystem-error-code" (func $filesystem-error-code (;10;)))
  (core func $"#core-func35 indirect-wasi:filesystem/types@0.2.6-filesystem-error-code" (@name "indirect-wasi:filesystem/types@0.2.6-filesystem-error-code") (;35;) (canon lower (func $filesystem-error-code) (memory $memory)))
  (alias export $wasi:filesystem/types@0.2.6 "[method]descriptor.read-via-stream" (func $"[method]descriptor.read-via-stream" (;11;)))
  (core func $"#core-func36 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.read-via-stream" (@name "indirect-wasi:filesystem/types@0.2.6-[method]descriptor.read-via-stream") (;36;) (canon lower (func $"[method]descriptor.read-via-stream") (memory $memory)))
  (alias export $wasi:filesystem/types@0.2.6 "[method]descriptor.write-via-stream" (func $"[method]descriptor.write-via-stream" (;12;)))
  (core func $"#core-func37 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.write-via-stream" (@name "indirect-wasi:filesystem/types@0.2.6-[method]descriptor.write-via-stream") (;37;) (canon lower (func $"[method]descriptor.write-via-stream") (memory $memory)))
  (alias export $wasi:filesystem/types@0.2.6 "[method]descriptor.append-via-stream" (func $"[method]descriptor.append-via-stream" (;13;)))
  (core func $"#core-func38 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.append-via-stream" (@name "indirect-wasi:filesystem/types@0.2.6-[method]descriptor.append-via-stream") (;38;) (canon lower (func $"[method]descriptor.append-via-stream") (memory $memory)))
  (alias export $wasi:filesystem/types@0.2.6 "[method]descriptor.stat" (func $"[method]descriptor.stat" (;14;)))
  (core func $"#core-func39 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.stat" (@name "indirect-wasi:filesystem/types@0.2.6-[method]descriptor.stat") (;39;) (canon lower (func $"[method]descriptor.stat") (memory $memory)))
  (alias export $wasi:filesystem/types@0.2.6 "[method]descriptor.get-type" (func $"[method]descriptor.get-type" (;15;)))
  (core func $"#core-func40 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.get-type" (@name "indirect-wasi:filesystem/types@0.2.6-[method]descriptor.get-type") (;40;) (canon lower (func $"[method]descriptor.get-type") (memory $memory)))
  (alias export $wasi:filesystem/preopens@0.2.6 "get-directories" (func $get-directories (;16;)))
  (core func $"#core-func41 indirect-wasi:filesystem/preopens@0.2.6-get-directories" (@name "indirect-wasi:filesystem/preopens@0.2.6-get-directories") (;41;) (canon lower (func $get-directories) (memory $memory) (realloc $realloc) string-encoding=utf8))
  (core instance $fixup-args (;14;)
    (export "$imports" (table $"shim table"))
    (export "0" (func $fd_write))
    (export "1" (func $proc_exit))
    (export "2" (func $fd_read))
    (export "3" (func $"#core-func29 indirect-wasi:io/streams@0.2.6-[method]output-stream.check-write"))
    (export "4" (func $"#core-func30 indirect-wasi:io/streams@0.2.6-[method]output-stream.write"))
    (export "5" (func $"#core-func31 indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-flush"))
    (export "6" (func $"#core-func32 indirect-wasi:io/streams@0.2.6-[method]input-stream.blocking-read"))
    (export "7" (func $"#core-func33 indirect-wasi:io/streams@0.2.6-[method]input-stream.read"))
    (export "8" (func $"#core-func34 indirect-wasi:io/streams@0.2.6-[method]output-stream.blocking-write-and-flush"))
    (export "9" (func $"#core-func35 indirect-wasi:filesystem/types@0.2.6-filesystem-error-code"))
    (export "10" (func $"#core-func36 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.read-via-stream"))
    (export "11" (func $"#core-func37 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.write-via-stream"))
    (export "12" (func $"#core-func38 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.append-via-stream"))
    (export "13" (func $"#core-func39 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.stat"))
    (export "14" (func $"#core-func40 indirect-wasi:filesystem/types@0.2.6-[method]descriptor.get-type"))
    (export "15" (func $"#core-func41 indirect-wasi:filesystem/preopens@0.2.6-get-directories"))
  )
  (core instance $fixup (;15;) (instantiate $wit-component-fixup
      (with "" (instance $fixup-args))
    )
  )
  (type (;22;) (result))
  (type (;23;) (func (result 22)))
  (alias core export $"#core-instance13 wasi_snapshot_preview1" "wasi:cli/run@0.2.6#run" (core func $wasi:cli/run@0.2.6#run (;42;)))
  (func $run (;17;) (type 23) (canon lift (core func $wasi:cli/run@0.2.6#run)))
  (component $wasi:cli/run@0.2.6-shim-component (;0;)
    (type (;0;) (result))
    (type (;1;) (func (result 0)))
    (import "import-func-run" (func (;0;) (type 1)))
    (type (;2;) (result))
    (type (;3;) (func (result 2)))
    (export (;1;) "run" (func 0) (func (type 3)))
  )
  (instance $wasi:cli/run@0.2.6-shim-instance (;9;) (instantiate $wasi:cli/run@0.2.6-shim-component
      (with "import-func-run" (func $run))
    )
  )
  (export $wasi:cli/run@0.2.6 (;10;) "wasi:cli/run@0.2.6" (instance $wasi:cli/run@0.2.6-shim-instance))
  (@producers
    (processed-by "wit-component" "0.251.0")
  )
)
