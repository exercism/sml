(* version 1.4.0 *)

use "testlib.sml";
use "anagram.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "anagram" [
    test "no matches"
      (fn _ => anagramsFor "diaper" ["hello", "world", "zombies", "pants"] |> Expect.equalTo []),

    test "detects simple anagram"
      (fn _ => anagramsFor "ant" ["tan", "stand", "at"] |> Expect.equalTo ["tan"]),

    test "does not detect false positives"
      (fn _ => anagramsFor "galea" ["eagle"] |> Expect.equalTo []),

    test "detects two anagrams"
      (fn _ => anagramsFor "master" ["stream", "pigeon", "maters"] |> Expect.equalTo ["stream", "maters"]),

    test "does not detect anagram subsets"
      (fn _ => anagramsFor "good" ["dog", "goody"] |> Expect.equalTo []),

    test "detects anagram"
      (fn _ => anagramsFor "listen" ["enlists", "google", "inlets", "banana"] |> Expect.equalTo ["inlets"]),

    test "detects three anagrams"
      (fn _ => anagramsFor "allergy" ["gallery", "ballerina", "regally", "clergy", "largely", "leading"] |> Expect.equalTo ["gallery", "regally", "largely"]),

    test "does not detect identical words"
      (fn _ => anagramsFor "corn" ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"] |> Expect.equalTo ["cron"]),

    test "does not detect non-anagrams with identical checksum"
      (fn _ => anagramsFor "mass" ["last"] |> Expect.equalTo []),

    test "detects anagrams case-insensitively"
      (fn _ => anagramsFor "Orchestra" ["cashregister", "Carthorse", "radishes"] |> Expect.equalTo ["Carthorse"]),

    test "detects anagrams using case-insensitive subject"
      (fn _ => anagramsFor "Orchestra" ["cashregister", "carthorse", "radishes"] |> Expect.equalTo ["carthorse"]),

    test "detects anagrams using case-insensitive possible matches"
      (fn _ => anagramsFor "orchestra" ["cashregister", "Carthorse", "radishes"] |> Expect.equalTo ["Carthorse"]),

    test "does not detect a anagram if the original word is repeated"
      (fn _ => anagramsFor "go" ["go Go GO"] |> Expect.equalTo []),

    test "anagrams must use all letters exactly once"
      (fn _ => anagramsFor "tapper" ["patter"] |> Expect.equalTo []),

    test "words are not anagrams of themselves (case-insensitive)"
      (fn _ => anagramsFor "BANANA" ["BANANA", "Banana", "banana"] |> Expect.equalTo [])
  ]

val _ = Test.run testsuite
