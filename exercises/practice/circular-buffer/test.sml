use "circular-buffer.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "circular-buffer" [
    test "reading empty buffer should fail"
      (fn _ => (fn _ => let val buf = CircularBuffer.create 1
                        in  CircularBuffer.read buf
                        end
               ) |> Expect.error CircularBuffer.BufferEmpty),

    test "can read an item just written"
      (fn _ => let val buf = CircularBuffer.create 1
               in  CircularBuffer.write buf 100;
                   CircularBuffer.read buf |> Expect.equalTo 100
               end),

    test "each item may only be read once"
      (fn _ => (fn _ => let val buf = CircularBuffer.create 1
                        in  CircularBuffer.write buf 100;
                            CircularBuffer.read buf |> Expect.equalTo 100;
                            CircularBuffer.read buf
                        end
               ) |> Expect.error CircularBuffer.BufferEmpty),

    test "items are read in the order they are written"
      (fn _ => let val buf = CircularBuffer.create 2
               in  CircularBuffer.write buf 100;
                   CircularBuffer.write buf 200;
                   CircularBuffer.read buf |> Expect.equalTo 100;
                   CircularBuffer.read buf |> Expect.equalTo 200
               end),

    test "full buffer can't be written to"
      (fn _ => (fn _ => let val buf = CircularBuffer.create 1
                        in  CircularBuffer.write buf 100;
                            CircularBuffer.write buf 200
                        end
               ) |> Expect.error CircularBuffer.BufferFull),

    test "a read frees up capacity for another write"
      (fn _ => let val buf = CircularBuffer.create 1
               in  CircularBuffer.write buf 100;
                   CircularBuffer.read buf |> Expect.equalTo 100;
                   CircularBuffer.write buf 200;
                   CircularBuffer.read buf |> Expect.equalTo 200
               end),

    test "read position is maintained even across multiple writes"
      (fn _ => let val buf = CircularBuffer.create 3
               in  CircularBuffer.write buf 100;
                   CircularBuffer.write buf 200;
                   CircularBuffer.read buf |> Expect.equalTo 100;
                   CircularBuffer.write buf 300;
                   CircularBuffer.read buf |> Expect.equalTo 200;
                   CircularBuffer.read buf |> Expect.equalTo 300
               end),

    test "items cleared out of buffer can't be read"
      (fn _ => (fn _ => let val buf = CircularBuffer.create 1
                        in  CircularBuffer.write buf 100;
                            CircularBuffer.clear buf;
                            CircularBuffer.read buf
                        end
               ) |> Expect.error CircularBuffer.BufferEmpty),

    test "clear frees up capacity for another write"
      (fn _ => let val buf = CircularBuffer.create 1
               in  CircularBuffer.write buf 100;
                   CircularBuffer.clear buf;
                   CircularBuffer.write buf 200;
                   CircularBuffer.read buf |> Expect.equalTo 200
               end),

    test "clear does nothing on empty buffer"
      (fn _ => let val buf = CircularBuffer.create 1
               in  CircularBuffer.clear buf;
                   CircularBuffer.write buf 100;
                   CircularBuffer.read buf |> Expect.equalTo 100
               end),

    test "overwrite acts like write on non-full buffer"
      (fn _ => let val buf = CircularBuffer.create 2
               in  CircularBuffer.write buf 100;
                   CircularBuffer.overwrite buf 200;
                   CircularBuffer.read buf |> Expect.equalTo 100;
                   CircularBuffer.read buf |> Expect.equalTo 200
               end),

    test "overwrite replaces the oldest item on full buffer"
      (fn _ => let val buf = CircularBuffer.create 2
               in  CircularBuffer.write buf 100;
                   CircularBuffer.write buf 200;
                   CircularBuffer.overwrite buf 300;
                   CircularBuffer.read buf |> Expect.equalTo 200;
                   CircularBuffer.read buf |> Expect.equalTo 300
               end),

    test "overwrite replaces the oldest item remaining in buffer following a read"
      (fn _ => let val buf = CircularBuffer.create 3
               in  CircularBuffer.write buf 100;
                   CircularBuffer.write buf 200;
                   CircularBuffer.write buf 300;
                   CircularBuffer.read buf |> Expect.equalTo 100;
                   CircularBuffer.write buf 400;
                   CircularBuffer.overwrite buf 500;
                   CircularBuffer.read buf |> Expect.equalTo 300;
                   CircularBuffer.read buf |> Expect.equalTo 400;
                   CircularBuffer.read buf |> Expect.equalTo 500
               end),

    test "initial clear does not affect wrapping around"
      (fn _ => (fn _ => let val buf = CircularBuffer.create 2
                        in  CircularBuffer.clear buf;
                            CircularBuffer.write buf 100;
                            CircularBuffer.write buf 200;
                            CircularBuffer.overwrite buf 300;
                            CircularBuffer.overwrite buf 400;
                            CircularBuffer.read buf |> Expect.equalTo 300;
                            CircularBuffer.read buf |> Expect.equalTo 400;
                            CircularBuffer.read buf
                        end
               ) |> Expect.error CircularBuffer.BufferEmpty)
  ]

val _ = Test.run testsuite
