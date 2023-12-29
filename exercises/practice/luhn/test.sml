(* version 1.0.0 *)

use "testlib.sml";
use "luhn.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "luhn" [
    test "single digit strings can not be valid"
      (fn _ => valid "1" |> Expect.falsy),

    test "a single zero is invalid"
      (fn _ => valid "0" |> Expect.falsy),

    test "a simple valid SIN that remains valid if reversed"
      (fn _ => valid "059" |> Expect.truthy),

    test "a simple valid SIN that becomes invalid if reversed"
      (fn _ => valid "59" |> Expect.truthy),

    test "a valid Canadian SIN"
      (fn _ => valid "055 444 285" |> Expect.truthy),

    test "invalid Canadian SIN"
      (fn _ => valid "055 444 286" |> Expect.falsy),

    test "invalid credit card"
      (fn _ => valid "8273 1232 7352 0569" |> Expect.falsy),

    test "invalid long number with an even remainder"
      (fn _ => valid "1 2345 6789 1234 5678 9012" |> Expect.falsy),

    test "invalid long number with a remainder divisible by 5"
      (fn _ => valid "1 2345 6789 1234 5678 9013" |> Expect.falsy),

    test "valid number with an even number of digits"
      (fn _ => valid "095 245 88" |> Expect.truthy),

    test "valid number with an odd number of spaces"
      (fn _ => valid "234 567 891 234" |> Expect.truthy),

    test "valid strings with a non-digit added at the end become invalid"
      (fn _ => valid "059a" |> Expect.falsy),

    test "valid strings with punctuation included become invalid"
      (fn _ => valid "055-444-285" |> Expect.falsy),

    test "valid strings with symbols included become invalid"
      (fn _ => valid "055# 444$ 285" |> Expect.falsy),

    test "single zero with space is invalid"
      (fn _ => valid " 0" |> Expect.falsy),

    test "more than a single zero is valid"
      (fn _ => valid "0000 0" |> Expect.truthy),

    test "input digit 9 is correctly converted to output digit 9"
      (fn _ => valid "091" |> Expect.truthy),

    test "very long input is valid"
      (fn _ => valid "9999999999 9999999999 9999999999 9999999999" |> Expect.truthy),

    test "valid luhn with an odd number of digits and non zero first digit"
      (fn _ => valid "109" |> Expect.truthy),

    test "using ascii value for non-doubled non-digit isn't allowed"
      (fn _ => valid "055b 444 285" |> Expect.falsy),

    test "using ascii value for doubled non-digit isn't allowed"
      (fn _ => valid ":9" |> Expect.falsy),

    test "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed"
      (fn _ => valid "59%59" |> Expect.falsy)
  ]

val _ = Test.run testsuite
