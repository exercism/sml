(* version 1.0.0 *)

use "testlib.sml";
use "resistor-color.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "resistor-color" [
    describe "Color codes" [
      test "Black"
        (fn _ => colorCode "black" |> Expect.equalTo 0),

      test "White"
        (fn _ => colorCode "white" |> Expect.equalTo 9),

      test "Orange"
        (fn _ => colorCode "orange" |> Expect.equalTo 3)
    ],

    test "Colors"
      (fn _ => let
        val expected = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
      in
        colors |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
