use "testlib.sml";
use "resistor-color-duo.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "resistor-color-duo" [
    test "Brown and black"
      (fn _ => value ["brown", "black"] |> Expect.equalTo 10),

    test "Blue and grey"
      (fn _ => value ["blue", "grey"] |> Expect.equalTo 68),

    test "Yellow and violet"
      (fn _ => value ["yellow", "violet"] |> Expect.equalTo 47),

    test "White and red"
      (fn _ => value ["white", "red"] |> Expect.equalTo 92),

    test "Orange and orange"
      (fn _ => value ["orange", "orange"] |> Expect.equalTo 33),

    test "Ignore additional colors"
      (fn _ => value ["green", "brown", "orange"] |> Expect.equalTo 51),

    test "Black and brown, one-digit"
      (fn _ => value ["black", "brown"] |> Expect.equalTo 1)
  ]

val _ = Test.run testsuite