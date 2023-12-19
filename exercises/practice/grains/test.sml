(* version 1.0.0 *)

use "testlib.sml";
use "grains.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "grains" [
    describe "returns the number of grains on the square" [
      test "grains on square 1"
        (fn _ => square 1 |> Expect.equalTo "1"),

      test "grains on square 2"
        (fn _ => square 2 |> Expect.equalTo "2"),

      test "grains on square 3"
        (fn _ => square 3 |> Expect.equalTo "4"),

      test "grains on square 4"
        (fn _ => square 4 |> Expect.equalTo "8"),

      test "grains on square 16"
        (fn _ => square 16 |> Expect.equalTo "32768"),

      test "grains on square 32"
        (fn _ => square 32 |> Expect.equalTo "2147483648"),

      test "grains on square 64"
        (fn _ => square 64 |> Expect.equalTo "9223372036854775808"),

      test "square 0 is invalid"
        (fn _ => (fn _ => square 0) |> Expect.error (Fail "square must be between 1 and 64")),

      test "negative square is invalid"
        (fn _ => (fn _ => square ~1) |> Expect.error (Fail "square must be between 1 and 64")),

      test "square greater than 64 is invalid"
        (fn _ => (fn _ => square 65) |> Expect.error (Fail "square must be between 1 and 64"))
    ],

    test "returns the total number of grains on the board"
      (fn _ => total () |> Expect.equalTo "18446744073709551615")
  ]

val _ = Test.run testsuite
