(* version 1.1.1 *)

use "testlib.sml";
use "collatz-conjecture.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "collatz-conjecture" [
    test "zero steps for one"
      (fn _ => steps (1) |> Expect.equalTo 0),

    test "divide if even"
      (fn _ => steps (16) |> Expect.equalTo 4),

    test "even and odd steps"
      (fn _ => steps (12) |> Expect.equalTo 9),

    test "Large number of even and odd steps"
      (fn _ => steps (1000000) |> Expect.equalTo 152),

    test "zero is an error"
      (fn _ => (fn _ => steps (0)) |> Expect.error NegativeInteger),

    test "negative value is an error"
      (fn _ => (fn _ => steps (~15)) |> Expect.error NegativeInteger)
  ]

val _ = Test.run testsuite
