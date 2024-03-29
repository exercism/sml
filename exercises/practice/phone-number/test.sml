(* version 1.3.0 *)

use "testlib.sml";
use "phone-number.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "phone-number" [
    describe "Cleanup user-entered phone numbers" [
      test "cleans the number"
        (fn _ => clean ("(223) 456-7890") |> Expect.equalTo (SOME "2234567890")),

      test "cleans numbers with dots"
        (fn _ => clean ("223.456.7890") |> Expect.equalTo (SOME "2234567890")),

      test "cleans numbers with multiple spaces"
        (fn _ => clean ("223 456   7890   ") |> Expect.equalTo (SOME "2234567890")),

      test "invalid when 9 digits"
        (fn _ => clean ("123456789") |> Expect.equalTo NONE),

      test "invalid when 11 digits does not start with a 1"
        (fn _ => clean ("22234567890") |> Expect.equalTo NONE),

      test "valid when 11 digits and starting with 1"
        (fn _ => clean ("12234567890") |> Expect.equalTo (SOME "2234567890")),

      test "valid when 11 digits and starting with 1 even with punctuation"
        (fn _ => clean ("+1 (223) 456-7890") |> Expect.equalTo (SOME "2234567890")),

      test "invalid when more than 11 digits"
        (fn _ => clean ("321234567890") |> Expect.equalTo NONE),

      test "invalid with letters"
        (fn _ => clean ("523-abc-7890") |> Expect.equalTo NONE),

      test "invalid with punctuations"
        (fn _ => clean ("523-@:!-7890") |> Expect.equalTo NONE),

      test "invalid if area code starts with 0"
        (fn _ => clean ("(023) 456-7890") |> Expect.equalTo NONE),

      test "invalid if area code starts with 1"
        (fn _ => clean ("(123) 456-7890") |> Expect.equalTo NONE),

      test "invalid if exchange code starts with 0"
        (fn _ => clean ("(223) 056-7890") |> Expect.equalTo NONE),

      test "invalid if exchange code starts with 1"
        (fn _ => clean ("(223) 156-7890") |> Expect.equalTo NONE),

      test "invalid if area code starts with 0 on valid 11-digit number"
        (fn _ => clean ("1 (023) 456-7890") |> Expect.equalTo NONE),

      test "invalid if area code starts with 1 on valid 11-digit number"
        (fn _ => clean ("1 (123) 456-7890") |> Expect.equalTo NONE),

      test "invalid if exchange code starts with 0 on valid 11-digit number"
        (fn _ => clean ("1 (223) 056-7890") |> Expect.equalTo NONE),

      test "invalid if exchange code starts with 1 on valid 11-digit number"
        (fn _ => clean ("1 (223) 156-7890") |> Expect.equalTo NONE)
    ]
  ]

val _ = Test.run testsuite