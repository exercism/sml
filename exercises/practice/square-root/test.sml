(* version 1.0.0 *)

use "testlib.sml";
use "square-root.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "square-root" [
    test "root of 1"
      (fn _ => squareRoot 1 |> Expect.equalTo 1),

    test "root of 4"
      (fn _ => squareRoot 4 |> Expect.equalTo 2),

    test "root of 25"
      (fn _ => squareRoot 25 |> Expect.equalTo 5),

    test "root of 81"
      (fn _ => squareRoot 81 |> Expect.equalTo 9),

    test "root of 196"
      (fn _ => squareRoot 196 |> Expect.equalTo 14),

    test "root of 65025"
      (fn _ => squareRoot 65025 |> Expect.equalTo 255)
  ]

val _ = Test.run testsuite
