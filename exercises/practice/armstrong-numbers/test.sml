(* version 1.0.0 *)

use "testlib.sml";
use "armstrong-numbers.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "armstrong-numbers" [
    test "Zero is an Armstrong number"
      (fn _ => isArmstrongNumber 0 |> Expect.truthy),

    test "Single-digit numbers are Armstrong numbers"
      (fn _ => isArmstrongNumber 5 |> Expect.truthy),

    test "There are no two-digit Armstrong numbers"
      (fn _ => isArmstrongNumber 10 |> Expect.falsy),

    test "Three-digit number that is an Armstrong number"
      (fn _ => isArmstrongNumber 153 |> Expect.truthy),

    test "Three-digit number that is not an Armstrong number"
      (fn _ => isArmstrongNumber 100 |> Expect.falsy),

    test "Four-digit number that is an Armstrong number"
      (fn _ => isArmstrongNumber 9474 |> Expect.truthy),

    test "Four-digit number that is not an Armstrong number"
      (fn _ => isArmstrongNumber 9475 |> Expect.falsy),

    test "Seven-digit number that is an Armstrong number"
      (fn _ => isArmstrongNumber 9926315 |> Expect.truthy),

    test "Seven-digit number that is not an Armstrong number"
      (fn _ => isArmstrongNumber 9926314 |> Expect.falsy)
  ]

val _ = Test.run testsuite
