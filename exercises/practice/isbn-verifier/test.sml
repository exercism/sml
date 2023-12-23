(* version 1.0.0 *)

use "testlib.sml";
use "isbn-verifier.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "isbn-verifier" [
    test "valid isbn"
      (fn _ => isValid "3-598-21508-8" |> Expect.truthy),

    test "invalid isbn check digit"
      (fn _ => isValid "3-598-21508-9" |> Expect.falsy),

    test "valid isbn with a check digit of 10"
      (fn _ => isValid "3-598-21507-X" |> Expect.truthy),

    test "check digit is a character other than X"
      (fn _ => isValid "3-598-21507-A" |> Expect.falsy),

    test "invalid check digit in isbn is not treated as zero"
      (fn _ => isValid "4-598-21507-B" |> Expect.falsy),

    test "invalid character in isbn is not treated as zero"
      (fn _ => isValid "3-598-P1581-X" |> Expect.falsy),

    test "X is only valid as a check digit"
      (fn _ => isValid "3-598-2X507-9" |> Expect.falsy),

    test "valid isbn without separating dashes"
      (fn _ => isValid "3598215088" |> Expect.truthy),

    test "isbn without separating dashes and X as check digit"
      (fn _ => isValid "359821507X" |> Expect.truthy),

    test "isbn without check digit and dashes"
      (fn _ => isValid "359821507" |> Expect.falsy),

    test "too long isbn and no dashes"
      (fn _ => isValid "3598215078X" |> Expect.falsy),

    test "too short isbn"
      (fn _ => isValid "00" |> Expect.falsy),

    test "isbn without check digit"
      (fn _ => isValid "3-598-21507" |> Expect.falsy),

    test "check digit of X should not be used for 0"
      (fn _ => isValid "3-598-21515-X" |> Expect.falsy),

    test "empty isbn"
      (fn _ => isValid "" |> Expect.falsy),

    test "input is 9 characters"
      (fn _ => isValid "134456729" |> Expect.falsy),

    test "invalid characters are not ignored after checking length"
      (fn _ => isValid "3132P34035" |> Expect.falsy),

    test "invalid characters are not ignored before checking length"
      (fn _ => isValid "3598P215088" |> Expect.falsy),

    test "input is too long but contains a valid isbn"
      (fn _ => isValid "98245726788" |> Expect.falsy)
  ]

val _ = Test.run testsuite
