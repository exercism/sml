(* version 1.0.0 *)

use "testlib.sml";
use "palindrome-products.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "palindrome-products" [
    test "find the smallest palindrome from single digit factors"
      (fn _ => smallest (1, 9) |> Expect.equalTo (SOME {value = 1, factors = [(1, 1)]})),

    test "find the largest palindrome from single digit factors"
      (fn _ => largest (1, 9) |> Expect.equalTo (SOME {value = 9, factors = [(1, 9), (3, 3)]})),

    test "find the smallest palindrome from double digit factors"
      (fn _ => smallest (10, 99) |> Expect.equalTo (SOME {value = 121, factors = [(11, 11)]})),

    test "find the largest palindrome from double digit factors"
      (fn _ => largest (10, 99) |> Expect.equalTo (SOME {value = 9009, factors = [(91, 99)]})),

    test "find the smallest palindrome from triple digit factors"
      (fn _ => smallest (100, 999) |> Expect.equalTo (SOME {value = 10201, factors = [(101, 101)]})),

    test "find the largest palindrome from triple digit factors"
      (fn _ => largest (100, 999) |> Expect.equalTo (SOME {value = 906609, factors = [(913, 993)]})),

    test "find the smallest palindrome from four digit factors"
      (fn _ => smallest (1000, 9999) |> Expect.equalTo (SOME {value = 1002001, factors = [(1001, 1001)]})),

    test "find the largest palindrome from four digit factors"
      (fn _ => largest (1000, 9999) |> Expect.equalTo (SOME {value = 99000099, factors = [(9901, 9999)]})),

    test "empty result for smallest if no palindrome in the range"
      (fn _ => smallest (1002, 1003) |> Expect.equalTo NONE),

    test "empty result for largest if no palindrome in the range"
      (fn _ => largest (15, 15) |> Expect.equalTo NONE),

    test "error result for smallest if min is more than max"
      (fn _ => (fn _ => smallest (10000, 1)) |> Expect.error (Fail "min must be <= max")),

    test "error result for largest if min is more than max"
      (fn _ => (fn _ => largest (2, 1)) |> Expect.error (Fail "min must be <= max")),

    test "smallest product does not use the smallest factor"
      (fn _ => smallest (3215, 4000) |> Expect.equalTo (SOME {value = 10988901, factors = [(3297, 3333)]}))
  ]

val _ = Test.run testsuite
