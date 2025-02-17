(* version 1.0.0 *)

use "testlib.sml";
use "house.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "house" [
    test "verse one - the house that jack built"
      (fn _ => let
        val expected =
          "This is the house that Jack built."
      in
        recite (1, 1) |> Expect.equalTo expected
      end),

    test "verse two - the malt that lay"
      (fn _ => let
        val expected =
          "This is the malt that lay in the house that Jack built."
      in
        recite (2, 2) |> Expect.equalTo expected
      end),

    test "verse three - the rat that ate"
      (fn _ => let
        val expected =
          "This is the rat that ate the malt that lay in the house that Jack built."
      in
        recite (3, 3) |> Expect.equalTo expected
      end),

    test "verse four - the cat that killed"
      (fn _ => let
        val expected =
          "This is the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (4, 4) |> Expect.equalTo expected
      end),

    test "verse five - the dog that worried"
      (fn _ => let
        val expected =
          "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (5, 5) |> Expect.equalTo expected
      end),

    test "verse six - the cow with the crumpled horn"
      (fn _ => let
        val expected =
          "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (6, 6) |> Expect.equalTo expected
      end),

    test "verse seven - the maiden all forlorn"
      (fn _ => let
        val expected =
          "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (7, 7) |> Expect.equalTo expected
      end),

    test "verse eight - the man all tattered and torn"
      (fn _ => let
        val expected =
          "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (8, 8) |> Expect.equalTo expected
      end),

    test "verse nine - the priest all shaven and shorn"
      (fn _ => let
        val expected =
          "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (9, 9) |> Expect.equalTo expected
      end),

    test "verse 10 - the rooster that crowed in the morn"
      (fn _ => let
        val expected =
          "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (10, 10) |> Expect.equalTo expected
      end),

    test "verse 11 - the farmer sowing his corn"
      (fn _ => let
        val expected =
          "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (11, 11) |> Expect.equalTo expected
      end),

    test "verse 12 - the horse and the hound and the horn"
      (fn _ => let
        val expected =
          "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (12, 12) |> Expect.equalTo expected
      end),

    test "multiple verses"
      (fn _ => let
        val expected =
          "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (4, 8) |> Expect.equalTo expected
      end),

    test "full rhyme"
      (fn _ => let
        val expected =
          "This is the house that Jack built.\n\
          \This is the malt that lay in the house that Jack built.\n\
          \This is the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n\
          \This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
      in
        recite (1, 12) |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
