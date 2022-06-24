use "testlib.sml";
use "reverse-string.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "reverse-string" [
    test "an empty string"
      (fn _ => reverse "" |> Expect.equalTo ""),

    test "a word"
      (fn _ => reverse "robot" |> Expect.equalTo "tobor"),

    test "a capitalized word"
      (fn _ => reverse "Ramen" |> Expect.equalTo "nemaR"),

    test "a sentence with punctuation"
      (fn _ => reverse "I'm hungry!" |> Expect.equalTo "!yrgnuh m'I"),

    test "a palindrome"
      (fn _ => reverse "racecar" |> Expect.equalTo "racecar"),

    test "an even-sized word"
      (fn _ => reverse "drawer" |> Expect.equalTo "reward")
  ]

val _ = Test.run testsuite
