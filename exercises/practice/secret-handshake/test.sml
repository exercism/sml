(* version 1.0.0 *)

use "testlib.sml";
use "secret-handshake.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "secret-handshake" [
    test "wink for 1"
      (fn _ => let
        val expected = ["wink"]
      in
        commands 1 |> Expect.equalTo expected
      end),

    test "double blink for 10"
      (fn _ => let
        val expected = ["double blink"]
      in
        commands 2 |> Expect.equalTo expected
      end),

    test "close your eyes for 100"
      (fn _ => let
        val expected = ["close your eyes"]
      in
        commands 4 |> Expect.equalTo expected
      end),

    test "jump for 1000"
      (fn _ => let
        val expected = ["jump"]
      in
        commands 8 |> Expect.equalTo expected
      end),

    test "combine two actions"
      (fn _ => let
        val expected = ["wink", "double blink"]
      in
        commands 3 |> Expect.equalTo expected
      end),

    test "reverse two actions"
      (fn _ => let
        val expected = ["double blink", "wink"]
      in
        commands 19 |> Expect.equalTo expected
      end),

    test "reversing one action gives the same action"
      (fn _ => let
        val expected = ["jump"]
      in
        commands 24 |> Expect.equalTo expected
      end),

    test "reversing no actions still gives no actions"
      (fn _ => let
        val expected = []
      in
        commands 16 |> Expect.equalTo expected
      end),

    test "all possible actions"
      (fn _ => let
        val expected = ["wink", "double blink", "close your eyes", "jump"]
      in
        commands 15 |> Expect.equalTo expected
      end),

    test "reverse all possible actions"
      (fn _ => let
        val expected = ["jump", "close your eyes", "double blink", "wink"]
      in
        commands 31 |> Expect.equalTo expected
      end),

    test "do nothing for zero"
      (fn _ => let
        val expected = []
      in
        commands 0 |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
