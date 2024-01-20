(* version 1.0.0 *)

use "testlib.sml";
use "rotational-cipher.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "rotational-cipher" [
    test "rotate a by 0, same output as input"
      (fn _ => let
        val phrase = "a"
        val expect = "a"
      in
        rotate 0 phrase |> Expect.equalTo expect
      end),

    test "rotate a by 1"
      (fn _ => let
        val phrase = "a"
        val expect = "b"
      in
        rotate 1 phrase |> Expect.equalTo expect
      end),

    test "rotate a by 26, same output as input"
      (fn _ => let
        val phrase = "a"
        val expect = "a"
      in
        rotate 26 phrase |> Expect.equalTo expect
      end),

    test "rotate m by 13"
      (fn _ => let
        val phrase = "m"
        val expect = "z"
      in
        rotate 13 phrase |> Expect.equalTo expect
      end),

    test "rotate n by 13 with wrap around alphabet"
      (fn _ => let
        val phrase = "n"
        val expect = "a"
      in
        rotate 13 phrase |> Expect.equalTo expect
      end),

    test "rotate capital letters"
      (fn _ => let
        val phrase = "OMG"
        val expect = "TRL"
      in
        rotate 5 phrase |> Expect.equalTo expect
      end),

    test "rotate spaces"
      (fn _ => let
        val phrase = "O M G"
        val expect = "T R L"
      in
        rotate 5 phrase |> Expect.equalTo expect
      end),

    test "rotate numbers"
      (fn _ => let
        val phrase = "Testing 1 2 3 testing"
        val expect = "Xiwxmrk 1 2 3 xiwxmrk"
      in
        rotate 4 phrase |> Expect.equalTo expect
      end),

    test "rotate punctuation"
      (fn _ => let
        val phrase = "Let's eat, Grandma!"
        val expect = "Gzo'n zvo, Bmviyhv!"
      in
        rotate 21 phrase |> Expect.equalTo expect
      end),

    test "rotate all letters"
      (fn _ => let
        val phrase = "The quick brown fox jumps over the lazy dog."
        val expect = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
      in
        rotate 13 phrase |> Expect.equalTo expect
      end)
  ]

val _ = Test.run testsuite
