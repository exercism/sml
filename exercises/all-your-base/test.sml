(* version 1.1.0 *)

use "all-your-base.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "all-your-base" [
    test "base_2(1) -> base_10(1)"
      (fn _ => rebase 2 [1] 10 |> Expect.equalTo (SOME [1])),
    test "base_2(101) -> base_10(5)"
      (fn _ => rebase 2 [1, 0, 1] 10 |> Expect.equalTo (SOME [5])),
    test "base_10(5) -> base_2(101)"
      (fn _ => rebase 10 [5] 2 |> Expect.equalTo (SOME [1, 0, 1])),
    test "base_2(101010) -> base_10(42)"
      (fn _ => rebase 2 [1, 0, 1, 0, 1, 0] 10 |> Expect.equalTo (SOME [4, 2])),
    test "base_10(42) -> base_2(101010)"
      (fn _ => rebase 10 [4, 2] 2 |> Expect.equalTo (SOME [1, 0, 1, 0, 1, 0])),
    test "base_3(1120) -> base_16(2A)"
      (fn _ => rebase 3 [1, 1, 2, 0] 16 |> Expect.equalTo (SOME [2, 10])),
    test "base_16(2A) -> base_3(1120)"
      (fn _ => rebase 16 [2, 10] 3 |> Expect.equalTo (SOME [1, 1, 2, 0])),
    test "base_97(34660) -> base_73(61045)"
      (fn _ => rebase 97 [3, 46, 60] 73 |> Expect.equalTo (SOME [6, 10, 45])),
    test "base_2([]) -> base_10([])"
      (fn _ => rebase 2 [] 10 |> Expect.equalTo (SOME [])),
    test "base_10(0) -> base_2(0)"
      (fn _ => rebase 10 [0] 2 |> Expect.equalTo (SOME [])),
    test "base_10(000) -> base_2(0)"
      (fn _ => rebase 10 [0, 0, 0] 2 |> Expect.equalTo (SOME [])),
    test "base_7(060) -> base_10(0)"
      (fn _ => rebase 7 [0, 6, 0] 10 |> Expect.equalTo (SOME [4, 2])),
    test "base_1 -> base_10 = UNDEFINED"
      (fn _ => rebase 1 [] 10 |> Expect.equalTo NONE),
    test "base_10 -> base_1 = UNDEFINED"
      (fn _ => rebase 10 [] 1 |> Expect.equalTo NONE),
    test "base_0 -> base_10 = UNDEFINED"
      (fn _ => rebase 0 [] 10 |> Expect.equalTo NONE),
    test "base_10 -> base_0 = UNDEFINED"
      (fn _ => rebase 10 [] 0 |> Expect.equalTo NONE),
    test "base_-2 -> base_10 = UNDEFINED"
      (fn _ => rebase ~2 [] 10 |> Expect.equalTo NONE),
    test "base_10 -> base_-2 = UNDEFINED"
      (fn _ => rebase 10 [] ~2 |> Expect.equalTo NONE),
    test "base_-2 -> base_-2 = UNDEFINED"
      (fn _ => rebase ~2 [] ~2 |> Expect.equalTo NONE),
    test "base_2([1, -1, 1, 0, 1, 0]) -> base_10 = UNDEFINED"
      (fn _ => rebase 2 [1, ~1, 1, 0, 1, 0] 10 |> Expect.equalTo NONE),
    test "base_2([1, 2, 1, 0, 1, 0]) -> base_10 = UNDEFINED"
      (fn _ => rebase 2 [1, 2, 1, 0, 1, 0] 10 |> Expect.equalTo NONE)
  ]

val _ = Test.run testsuite