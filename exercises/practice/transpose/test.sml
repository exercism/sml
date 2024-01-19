(* version 1.0.0 *)

use "testlib.sml";
use "transpose.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "transpose" [
    test "empty string"
      (fn _ => let
        val lines = []
        val expected = []
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "two characters in a row"
      (fn _ => let
        val lines = [
          "A1"
        ]
        val expected = [
          "A",
          "1"
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "two characters in a column"
      (fn _ => let
        val lines = [
          "A",
          "1"
        ]
        val expected = [
          "A1"
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "simple"
      (fn _ => let
        val lines = [
          "ABC",
          "123"
        ]
        val expected = [
          "A1",
          "B2",
          "C3"
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "single line"
      (fn _ => let
        val lines = [
          "Single line."
        ]
        val expected = [
          "S",
          "i",
          "n",
          "g",
          "l",
          "e",
          " ",
          "l",
          "i",
          "n",
          "e",
          "."
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "first line longer than second line"
      (fn _ => let
        val lines = [
          "The fourth line.",
          "The fifth line."
        ]
        val expected = [
          "TT",
          "hh",
          "ee",
          "  ",
          "ff",
          "oi",
          "uf",
          "rt",
          "th",
          "h ",
          " l",
          "li",
          "in",
          "ne",
          "e.",
          "."
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "second line longer than first line"
      (fn _ => let
        val lines = [
          "The first line.",
          "The second line."
        ]
        val expected = [
          "TT",
          "hh",
          "ee",
          "  ",
          "fs",
          "ie",
          "rc",
          "so",
          "tn",
          " d",
          "l ",
          "il",
          "ni",
          "en",
          ".e",
          " ."
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "mixed line length"
      (fn _ => let
        val lines = [
          "The longest line.",
          "A long line.",
          "A longer line.",
          "A line."
        ]
        val expected = [
          "TAAA",
          "h   ",
          "elll",
          " ooi",
          "lnnn",
          "ogge",
          "n e.",
          "glr",
          "ei ",
          "snl",
          "tei",
          " .n",
          "l e",
          "i .",
          "n",
          "e",
          "."
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "square"
      (fn _ => let
        val lines = [
          "HEART",
          "EMBER",
          "ABUSE",
          "RESIN",
          "TREND"
        ]
        val expected = [
          "HEART",
          "EMBER",
          "ABUSE",
          "RESIN",
          "TREND"
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "rectangle"
      (fn _ => let
        val lines = [
          "FRACTURE",
          "OUTLINED",
          "BLOOMING",
          "SEPTETTE"
        ]
        val expected = [
          "FOBS",
          "RULE",
          "ATOP",
          "CLOT",
          "TIME",
          "UNIT",
          "RENT",
          "EDGE"
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "triangle"
      (fn _ => let
        val lines = [
          "T",
          "EE",
          "AAA",
          "SSSS",
          "EEEEE",
          "RRRRRR"
        ]
        val expected = [
          "TEASER",
          " EASER",
          "  ASER",
          "   SER",
          "    ER",
          "     R"
        ]
      in
        transpose lines |> Expect.equalTo expected
      end),

    test "jagged triangle"
      (fn _ => let
        val lines = [
          "11",
          "2",
          "3333",
          "444",
          "555555",
          "66666"
        ]
        val expected = [
          "123456",
          "1 3456",
          "  3456",
          "  3 56",
          "    56",
          "    5"
        ]
      in
        transpose lines |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
