(* version 1.0.0 *)

use "testlib.sml";
use "proverb.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "proverb" [
    test "zero pieces"
      (fn _ => let
        val inputs = []
        val expected = ""
      in
        recite inputs |> Expect.equalTo expected
      end),

    test "one piece"
      (fn _ => let
        val inputs = [
          "nail"
        ]
        val expected =
          "And all for the want of a nail."
      in
        recite inputs |> Expect.equalTo expected
      end),

    test "two pieces"
      (fn _ => let
        val inputs = [
          "nail",
          "shoe"
        ]
        val expected =
          "For want of a nail the shoe was lost.\n\
          \And all for the want of a nail."
      in
        recite inputs |> Expect.equalTo expected
      end),

    test "three pieces"
      (fn _ => let
        val inputs = [
          "nail",
          "shoe",
          "horse"
        ]
        val expected =
          "For want of a nail the shoe was lost.\n\
          \For want of a shoe the horse was lost.\n\
          \And all for the want of a nail."
      in
        recite inputs |> Expect.equalTo expected
      end),

    test "full proverb"
      (fn _ => let
        val inputs = [
          "nail",
          "shoe",
          "horse",
          "rider",
          "message",
          "battle",
          "kingdom"
        ]
        val expected =
          "For want of a nail the shoe was lost.\n\
          \For want of a shoe the horse was lost.\n\
          \For want of a horse the rider was lost.\n\
          \For want of a rider the message was lost.\n\
          \For want of a message the battle was lost.\n\
          \For want of a battle the kingdom was lost.\n\
          \And all for the want of a nail."
      in
        recite inputs |> Expect.equalTo expected
      end),

    test "four pieces modernized"
      (fn _ => let
        val inputs = [
          "pin",
          "gun",
          "soldier",
          "battle"
        ]
        val expected =
          "For want of a pin the gun was lost.\n\
          \For want of a gun the soldier was lost.\n\
          \For want of a soldier the battle was lost.\n\
          \And all for the want of a pin."
      in
        recite inputs |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
