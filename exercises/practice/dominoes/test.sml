(* version 1.0.0 *)

use "testlib.sml";
use "dominoes.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "dominoes" [
    test "empty input = empty output"
      (fn _ => canChain [] |> Expect.truthy),

    test "singleton input = singleton output"
      (fn _ => canChain [(1, 1)] |> Expect.truthy),

    test "singleton that can't be chained"
      (fn _ => canChain [(1, 2)] |> Expect.falsy),

    test "three elements"
      (fn _ => canChain [(1, 2), (3, 1), (2, 3)] |> Expect.truthy),

    test "can reverse dominoes"
      (fn _ => canChain [(1, 2), (1, 3), (2, 3)] |> Expect.truthy),

    test "can't be chained"
      (fn _ => canChain [(1, 2), (4, 1), (2, 3)] |> Expect.falsy),

    test "disconnected - simple"
      (fn _ => canChain [(1, 1), (2, 2)] |> Expect.falsy),

    test "disconnected - double loop"
      (fn _ => canChain [(1, 2), (2, 1), (3, 4), (4, 3)] |> Expect.falsy),

    test "disconnected - single isolated"
      (fn _ => canChain [(1, 2), (2, 3), (3, 1), (4, 4)] |> Expect.falsy),

    test "need backtrack"
      (fn _ => canChain [(1, 2), (2, 3), (3, 1), (2, 4), (2, 4)] |> Expect.truthy),

    test "separate loops"
      (fn _ => canChain [(1, 2), (2, 3), (3, 1), (1, 1), (2, 2), (3, 3)] |> Expect.truthy),

    test "nine elements"
      (fn _ => canChain [(1, 2), (5, 3), (3, 1), (1, 2), (2, 4), (1, 6), (2, 3), (3, 4), (5, 6)] |> Expect.truthy),

    test "separate three-domino loops"
      (fn _ => canChain [(1, 2), (2, 3), (3, 1), (4, 5), (5, 6), (6, 4)] |> Expect.falsy)
  ]

val _ = Test.run testsuite
