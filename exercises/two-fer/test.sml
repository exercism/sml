(* version 1.1.0 *)

use "testlib.sml";
use "two-fer.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "two-fer" [
    test "no name given"
      (fn _ => name (NONE) |> Expect.equalTo "One for you, one for me."),

    test "a name given"
      (fn _ => name (SOME "Alice") |> Expect.equalTo "One for Alice, one for me."),

    test "another name given"
      (fn _ => name (SOME "Bob") |> Expect.equalTo "One for Bob, one for me.")
  ]

val _ = Test.run testsuite
