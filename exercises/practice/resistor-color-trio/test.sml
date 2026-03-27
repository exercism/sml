(* version 1.0.0 *)

use "testlib.sml";
use "resistor-color-trio.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "resistor-color-trio" [
    test "Orange and orange and black"
      (fn _ => label ["orange", "orange", "black"] |> Expect.equalTo "33 ohms"),

    test "Blue and grey and brown"
      (fn _ => label ["blue", "grey", "brown"] |> Expect.equalTo "680 ohms"),

    test "Red and black and red"
      (fn _ => label ["red", "black", "red"] |> Expect.equalTo "2 kiloohms"),

    test "Green and brown and orange"
      (fn _ => label ["green", "brown", "orange"] |> Expect.equalTo "51 kiloohms"),

    test "Yellow and violet and yellow"
      (fn _ => label ["yellow", "violet", "yellow"] |> Expect.equalTo "470 kiloohms"),

    test "Blue and violet and blue"
      (fn _ => label ["blue", "violet", "blue"] |> Expect.equalTo "67 megaohms"),

    test "Minimum possible value"
      (fn _ => label ["black", "black", "black"] |> Expect.equalTo "0 ohms"),

    test "Maximum possible value"
      (fn _ => label ["white", "white", "white"] |> Expect.equalTo "99 gigaohms"),

    test "First two colors make an invalid octal number"
      (fn _ => label ["black", "grey", "black"] |> Expect.equalTo "8 ohms"),

    test "Ignore extra colors"
      (fn _ => label ["blue", "green", "yellow", "orange"] |> Expect.equalTo "650 kiloohms")
  ]

val _ = Test.run testsuite
