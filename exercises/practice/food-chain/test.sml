(* version 1.0.0 *)

use "testlib.sml";
use "food-chain.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "food-chain" [
    test "fly"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die."
      in
        recite (1, 1) |> Expect.equalTo expected
      end),

    test "spider"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a spider.\n\
          \It wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die."
      in
        recite (2, 2) |> Expect.equalTo expected
      end),

    test "bird"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a bird.\n\
          \How absurd to swallow a bird!\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die."
      in
        recite (3, 3) |> Expect.equalTo expected
      end),

    test "cat"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a cat.\n\
          \Imagine that, to swallow a cat!\n\
          \She swallowed the cat to catch the bird.\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die."
      in
        recite (4, 4) |> Expect.equalTo expected
      end),

    test "dog"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a dog.\n\
          \What a hog, to swallow a dog!\n\
          \She swallowed the dog to catch the cat.\n\
          \She swallowed the cat to catch the bird.\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die."
      in
        recite (5, 5) |> Expect.equalTo expected
      end),

    test "goat"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a goat.\n\
          \Just opened her throat and swallowed a goat!\n\
          \She swallowed the goat to catch the dog.\n\
          \She swallowed the dog to catch the cat.\n\
          \She swallowed the cat to catch the bird.\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die."
      in
        recite (6, 6) |> Expect.equalTo expected
      end),

    test "cow"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a cow.\n\
          \I don't know how she swallowed a cow!\n\
          \She swallowed the cow to catch the goat.\n\
          \She swallowed the goat to catch the dog.\n\
          \She swallowed the dog to catch the cat.\n\
          \She swallowed the cat to catch the bird.\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die."
      in
        recite (7, 7) |> Expect.equalTo expected
      end),

    test "horse"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a horse.\n\
          \She's dead, of course!"
      in
        recite (8, 8) |> Expect.equalTo expected
      end),

    test "multiple verses"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a spider.\n\
          \It wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a bird.\n\
          \How absurd to swallow a bird!\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die."
      in
        recite (1, 3) |> Expect.equalTo expected
      end),

    test "full song"
      (fn _ => let
        val expected =
          "I know an old lady who swallowed a fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a spider.\n\
          \It wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a bird.\n\
          \How absurd to swallow a bird!\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a cat.\n\
          \Imagine that, to swallow a cat!\n\
          \She swallowed the cat to catch the bird.\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a dog.\n\
          \What a hog, to swallow a dog!\n\
          \She swallowed the dog to catch the cat.\n\
          \She swallowed the cat to catch the bird.\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a goat.\n\
          \Just opened her throat and swallowed a goat!\n\
          \She swallowed the goat to catch the dog.\n\
          \She swallowed the dog to catch the cat.\n\
          \She swallowed the cat to catch the bird.\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a cow.\n\
          \I don't know how she swallowed a cow!\n\
          \She swallowed the cow to catch the goat.\n\
          \She swallowed the goat to catch the dog.\n\
          \She swallowed the dog to catch the cat.\n\
          \She swallowed the cat to catch the bird.\n\
          \She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n\
          \She swallowed the spider to catch the fly.\n\
          \I don't know why she swallowed the fly. Perhaps she'll die.\n\
          \\n\
          \I know an old lady who swallowed a horse.\n\
          \She's dead, of course!"
      in
        recite (1, 8) |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
