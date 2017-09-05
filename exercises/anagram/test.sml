(* version 1.0.1 *)

use "testlib.sml";
use "anagram.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "anagram" [
    test "no matches"
      (fn _ => anagrams (["hello", "world", "zombies", "pants"], "diaper") |> Expect.equalTo []),

    test "detects simple anagram"
      (fn _ => anagrams (["tan", "stand", "at"], "ant") |> Expect.equalTo ["tan"]),

    test "does not detect false positives"
      (fn _ => anagrams (["eagle"], "galea") |> Expect.equalTo []),

    test "detects two anagrams"
      (fn _ => anagrams (["stream", "pigeon", "maters"], "master") |> Expect.equalTo ["stream", "maters"]),

    test "does not detect anagram subsets"
      (fn _ => anagrams (["dog", "goody"], "good") |> Expect.equalTo []),

    test "detects anagram"
      (fn _ => anagrams (["enlists", "google", "inlets", "banana"], "listen") |> Expect.equalTo ["inlets"]),

    test "detects three anagrams"
      (fn _ => anagrams (["gallery", "ballerina", "regally", "clergy", "largely", "leading"], "allergy") |> Expect.equalTo ["gallery", "regally", "largely"]),

    test "does not detect identical words"
      (fn _ => anagrams (["corn", "dark", "Corn", "rank", "CORN", "cron", "park"], "corn") |> Expect.equalTo ["cron"]),

    test "does not detect non-anagrams with identical checksum"
      (fn _ => anagrams (["last"], "mass") |> Expect.equalTo []),

    test "detects anagrams case-insensitively"
      (fn _ => anagrams (["cashregister", "Carthorse", "radishes"], "Orchestra") |> Expect.equalTo ["Carthorse"]),

    test "detects anagrams using case-insensitive subject"
      (fn _ => anagrams (["cashregister", "carthorse", "radishes"], "Orchestra") |> Expect.equalTo ["carthorse"]),

    test "detects anagrams using case-insensitive possible matches"
      (fn _ => anagrams (["cashregister", "Carthorse", "radishes"], "orchestra") |> Expect.equalTo ["Carthorse"]),

    test "does not detect a word as its own anagram"
      (fn _ => anagrams (["Banana"], "banana") |> Expect.equalTo []),

    test "does not detect a anagram if the original word is repeated"
      (fn _ => anagrams (["go Go GO"], "go") |> Expect.equalTo []),

    test "anagrams must use all letters exactly once"
      (fn _ => anagrams (["patter"], "tapper") |> Expect.equalTo []),

    test "capital word is not own anagram"
      (fn _ => anagrams (["Banana"], "BANANA") |> Expect.equalTo [])
  ]

val _ = Test.run testsuite