(* version 1.0.0 *)

use "testlib.sml";
use "run-length-encoding.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "run-length-encoding" [
    describe "run-length encode a string" [
      test "empty string"
        (fn _ => let
          val phrase = ""
          val expect = ""
        in
          encode phrase |> Expect.equalTo expect
        end),

      test "single characters only are encoded without count"
        (fn _ => let
          val phrase = "XYZ"
          val expect = "XYZ"
        in
          encode phrase |> Expect.equalTo expect
        end),

      test "string with no single characters"
        (fn _ => let
          val phrase = "AABBBCCCC"
          val expect = "2A3B4C"
        in
          encode phrase |> Expect.equalTo expect
        end),

      test "single characters mixed with repeated characters"
        (fn _ => let
          val phrase = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
          val expect = "12WB12W3B24WB"
        in
          encode phrase |> Expect.equalTo expect
        end),

      test "multiple whitespace mixed in string"
        (fn _ => let
          val phrase = "  hsqq qww  "
          val expect = "2 hs2q q2w2 "
        in
          encode phrase |> Expect.equalTo expect
        end),

      test "lowercase characters"
        (fn _ => let
          val phrase = "aabbbcccc"
          val expect = "2a3b4c"
        in
          encode phrase |> Expect.equalTo expect
        end)
    ],

    describe "run-length decode a string" [
      test "empty string"
        (fn _ => let
          val phrase = ""
          val expect = ""
        in
          decode phrase |> Expect.equalTo expect
        end),

      test "single characters only"
        (fn _ => let
          val phrase = "XYZ"
          val expect = "XYZ"
        in
          decode phrase |> Expect.equalTo expect
        end),

      test "string with no single characters"
        (fn _ => let
          val phrase = "2A3B4C"
          val expect = "AABBBCCCC"
        in
          decode phrase |> Expect.equalTo expect
        end),

      test "single characters with repeated characters"
        (fn _ => let
          val phrase = "12WB12W3B24WB"
          val expect = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
        in
          decode phrase |> Expect.equalTo expect
        end),

      test "multiple whitespace mixed in string"
        (fn _ => let
          val phrase = "2 hs2q q2w2 "
          val expect = "  hsqq qww  "
        in
          decode phrase |> Expect.equalTo expect
        end),

      test "lowercase string"
        (fn _ => let
          val phrase = "2a3b4c"
          val expect = "aabbbcccc"
        in
          decode phrase |> Expect.equalTo expect
        end)
    ],

    describe "encode and then decode" [
      test "encode followed by decode gives original string"
        (fn _ => let
          val phrase = "zzz ZZ  zZ"
          val expect = "zzz ZZ  zZ"
        in
          (decode o encode) phrase |> Expect.equalTo expect
        end)
    ]
  ]

val _ = Test.run testsuite
