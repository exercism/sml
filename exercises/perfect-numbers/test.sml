(* version 1.0.1 *)

use "perfect-numbers.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "perfect-numbers" [
    describe "Perfect numbers" [
      test "Smallest perfect number is classified correctly"
        (fn _ => classify (6) |> Expect.equalTo Perfect),

      test "Medium perfect number is classified correctly"
        (fn _ => classify (28) |> Expect.equalTo Perfect),

      test "Large perfect number is classified correctly"
        (fn _ => classify (33550336) |> Expect.equalTo Perfect)
    ],

    describe "Abundant numbers" [
      test "Smallest abundant number is classified correctly"
        (fn _ => classify (12) |> Expect.equalTo Abundant),

      test "Medium abundant number is classified correctly"
        (fn _ => classify (30) |> Expect.equalTo Abundant),

      test "Large abundant number is classified correctly"
        (fn _ => classify (33550335) |> Expect.equalTo Abundant)
    ],

    describe "Deficient numbers" [
      test "Smallest prime deficient number is classified correctly"
        (fn _ => classify (2) |> Expect.equalTo Deficient),

      test "Smallest non-prime deficient number is classified correctly"
        (fn _ => classify (4) |> Expect.equalTo Deficient),

      test "Medium deficient number is classified correctly"
        (fn _ => classify (32) |> Expect.equalTo Deficient),

      test "Large deficient number is classified correctly"
        (fn _ => classify (33550337) |> Expect.equalTo Deficient),

      test "Edge case (no factors other than itself) is classified correctly"
        (fn _ => classify (1) |> Expect.equalTo Deficient)
    ],

    describe "Invalid inputs" [
      test "Zero is rejected (not a natural number)"
        (fn _ => (fn _ => classify (~1)) |> Expect.error NotAPositiveInteger),

      test "Negative integer is rejected (not a natural number)"
        (fn _ => (fn _ => classify (~1)) |> Expect.error NotAPositiveInteger)
    ]
  ]

val _ = Test.run testsuite
