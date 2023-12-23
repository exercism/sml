(* version 1.2.0 *)

use "pangram.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "pangram" [
    describe "Check if the given string is an pangram" [
      test "empty sentence"
        (fn _ => isPangram ("") |> Expect.falsy),

      test "perfect lower case"
        (fn _ => isPangram ("abcdefghijklmnopqrstuvwxyz") |> Expect.truthy),

      test "only lower case"
        (fn _ => isPangram ("the quick brown fox jumps over the lazy dog") |> Expect.truthy),

      test "missing the letter 'x'"
        (fn _ => isPangram ("a quick movement of the enemy will jeopardize five gunboats") |> Expect.falsy),

      test "missing the letter 'h'"
        (fn _ => isPangram ("five boxing wizards jump quickly at it") |> Expect.falsy),

      test "with underscores"
        (fn _ => isPangram ("the_quick_brown_fox_jumps_over_the_lazy_dog") |> Expect.truthy),

      test "with numbers"
        (fn _ => isPangram ("the 1 quick brown fox jumps over the 2 lazy dogs") |> Expect.truthy),

      test "missing letters replaced by numbers"
        (fn _ => isPangram ("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog") |> Expect.falsy),

      test "mixed case and punctuation"
        (fn _ => isPangram ("\"Five quacking Zephyrs jolt my wax bed.\"") |> Expect.truthy),

      test "a-m and A-M are 26 different characters but not a pangram"
        (fn _ => isPangram ("abcdefghijklm ABCDEFGHIJKLM") |> Expect.falsy)
    ]
  ]

val _ = Test.run testsuite