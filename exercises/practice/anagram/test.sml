(* version 1.5.0 *)

use "testlib.sml";
use "anagram.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "anagram" [
    test "no matches"
      (fn _ => anagramsFor "diaper" ["hello", "world", "zombies", "pants"] |> Expect.equalTo []),

    test "detects two anagrams"
      (fn _ => anagramsFor "solemn" ["lemons", "cherry", "melons"] |> Expect.equalTo ["lemons", "melons"]),

    test "does not detect anagram subsets"
      (fn _ => anagramsFor "good" ["dog", "goody"] |> Expect.equalTo []),

    test "detects anagram"
      (fn _ => anagramsFor "listen" ["enlists", "google", "inlets", "banana"] |> Expect.equalTo ["inlets"]),

    test "detects three anagrams"
      (fn _ => anagramsFor "allergy" ["gallery", "ballerina", "regally", "clergy", "largely", "leading"] |> Expect.equalTo ["gallery", "regally", "largely"]),

    test "detects multiple anagrams with different case"
      (fn _ => anagramsFor "nose" ["Eons", "ONES"] |> Expect.equalTo ["Eons", "ONES"]),

    test "does not detect non-anagrams with identical checksum"
      (fn _ => anagramsFor "mass" ["last"] |> Expect.equalTo []),

    test "detects anagrams case-insensitively"
      (fn _ => anagramsFor "Orchestra" ["cashregister", "Carthorse", "radishes"] |> Expect.equalTo ["Carthorse"]),

    test "detects anagrams using case-insensitive subject"
      (fn _ => anagramsFor "Orchestra" ["cashregister", "carthorse", "radishes"] |> Expect.equalTo ["carthorse"]),

    test "detects anagrams using case-insensitive possible matches"
      (fn _ => anagramsFor "orchestra" ["cashregister", "Carthorse", "radishes"] |> Expect.equalTo ["Carthorse"]),

    test "does not detect an anagram if the original word is repeated"
      (fn _ => anagramsFor "go" ["goGoGO"] |> Expect.equalTo []),

    test "anagrams must use all letters exactly once"
      (fn _ => anagramsFor "tapper" ["patter"] |> Expect.equalTo []),

    test "words are not anagrams of themselves"
      (fn _ => anagramsFor "BANANA" ["BANANA"] |> Expect.equalTo []),

    test "words are not anagrams of themselves even if letter case is partially different"
      (fn _ => anagramsFor "BANANA" ["Banana"] |> Expect.equalTo []),

    test "words are not anagrams of themselves even if letter case is completely different"
      (fn _ => anagramsFor "BANANA" ["banana"] |> Expect.equalTo []),

    test "words other than themselves can be anagrams"
      (fn _ => anagramsFor "LISTEN" ["LISTEN", "Silent"] |> Expect.equalTo ["Silent"])
  ]

val _ = Test.run testsuite
