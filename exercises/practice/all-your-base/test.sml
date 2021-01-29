(* version 2.3.0 *)

use "all-your-base.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "all-your-base" [
    test "single bit one to decimal"
      (fn _ => rebase (2, 10, [1]) |> Expect.equalTo (SOME [1])),

    test "binary to single decimal"
      (fn _ => rebase (2, 10, [1, 0, 1]) |> Expect.equalTo (SOME [5])),

    test "single decimal to binary"
      (fn _ => rebase (10, 2, [5]) |> Expect.equalTo (SOME [1, 0, 1])),

    test "binary to multiple decimal"
      (fn _ => rebase (2, 10, [1, 0, 1, 0, 1, 0]) |> Expect.equalTo (SOME [4, 2])),

    test "decimal to binary"
      (fn _ => rebase (10, 2, [4, 2]) |> Expect.equalTo (SOME [1, 0, 1, 0, 1, 0])),

    test "trinary to hexadecimal"
      (fn _ => rebase (3, 16, [1, 1, 2, 0]) |> Expect.equalTo (SOME [2, 10])),

    test "hexadecimal to trinary"
      (fn _ => rebase (16, 3, [2, 10]) |> Expect.equalTo (SOME [1, 1, 2, 0])),

    test "15-bit integer"
      (fn _ => rebase (97, 73, [3, 46, 60]) |> Expect.equalTo (SOME [6, 10, 45])),

    test "empty list"
      (fn _ => rebase (2, 10, []) |> Expect.equalTo NONE),

    test "single zero"
      (fn _ => rebase (10, 2, [0]) |> Expect.equalTo NONE),

    test "multiple zeros"
      (fn _ => rebase (10, 2, [0, 0, 0]) |> Expect.equalTo NONE),

    test "leading zeros"
      (fn _ => rebase (7, 10, [0, 6, 0]) |> Expect.equalTo (SOME [4, 2])),

    test "input base is one"
      (fn _ => rebase (1, 10, []) |> Expect.equalTo NONE),

    test "input base is zero"
      (fn _ => rebase (0, 10, []) |> Expect.equalTo NONE),

    test "input base is negative"
      (fn _ => rebase (~2, 10, [1]) |> Expect.equalTo NONE),

    test "negative digit"
      (fn _ => rebase (2, 10, [1, ~1, 1, 0, 1, 0]) |> Expect.equalTo NONE),

    test "invalid positive digit"
      (fn _ => rebase (2, 10, [1, 2, 1, 0, 1, 0]) |> Expect.equalTo NONE),

    test "output base is one"
      (fn _ => rebase (2, 1, [1, 0, 1, 0, 1, 0]) |> Expect.equalTo NONE),

    test "output base is zero"
      (fn _ => rebase (10, 0, [7]) |> Expect.equalTo NONE),

    test "output base is negative"
      (fn _ => rebase (2, ~7, [1]) |> Expect.equalTo NONE),

    test "both bases are negative"
      (fn _ => rebase (~2, ~7, [1]) |> Expect.equalTo NONE)
  ]

val _ = Test.run testsuite
