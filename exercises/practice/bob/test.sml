(* version 1.4.0 *)

use "bob.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "bob" [
    test "stating something"
      (fn _ => response ("Tom-ay-to, tom-aaaah-to.") |> Expect.equalTo "Whatever."),

    test "shouting"
      (fn _ => response ("WATCH OUT!") |> Expect.equalTo "Whoa, chill out!"),

    test "shouting gibberish"
      (fn _ => response ("FCECDFCAAB") |> Expect.equalTo "Whoa, chill out!"),

    test "asking a question"
      (fn _ => response ("Does this cryogenic chamber make me look fat?") |> Expect.equalTo "Sure."),

    test "asking a numeric question"
      (fn _ => response ("You are, what, like 15?") |> Expect.equalTo "Sure."),

    test "asking gibberish"
      (fn _ => response ("fffbbcbeab?") |> Expect.equalTo "Sure."),

    test "talking forcefully"
      (fn _ => response ("Let's go make out behind the gym!") |> Expect.equalTo "Whatever."),

    test "using acronyms in regular speech"
      (fn _ => response ("It's OK if you don't want to go to the DMV.") |> Expect.equalTo "Whatever."),

    test "forceful question"
      (fn _ => response ("WHAT THE HELL WERE YOU THINKING?") |> Expect.equalTo "Calm down, I know what I'm doing!"),

    test "shouting numbers"
      (fn _ => response ("1, 2, 3 GO!") |> Expect.equalTo "Whoa, chill out!"),

    test "no letters"
      (fn _ => response ("1, 2, 3") |> Expect.equalTo "Whatever."),

    test "question with only numbers"
      (fn _ => response ("4?") |> Expect.equalTo "Sure."),

    test "shouting with special characters"
      (fn _ => response ("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") |> Expect.equalTo "Whoa, chill out!"),

    test "shouting with no exclamation mark"
      (fn _ => response ("I HATE THE DMV") |> Expect.equalTo "Whoa, chill out!"),

    test "statement containing question mark"
      (fn _ => response ("Ending with ? means a question.") |> Expect.equalTo "Whatever."),

    test "non-letters with question"
      (fn _ => response (":) ?") |> Expect.equalTo "Sure."),

    test "prattling on"
      (fn _ => response ("Wait! Hang on. Are you going to be OK?") |> Expect.equalTo "Sure."),

    test "silence"
      (fn _ => response ("") |> Expect.equalTo "Fine. Be that way!"),

    test "prolonged silence"
      (fn _ => response ("          ") |> Expect.equalTo "Fine. Be that way!"),

    test "alternate silence"
      (fn _ => response ("\t\t\t\t\t\t\t\t\t\t") |> Expect.equalTo "Fine. Be that way!"),

    test "multiple line question"
      (fn _ => response ("\nDoes this cryogenic chamber make me look fat?\nNo.") |> Expect.equalTo "Whatever."),

    test "starting with whitespace"
      (fn _ => response ("         hmmmmmmm...") |> Expect.equalTo "Whatever."),

    test "ending with whitespace"
      (fn _ => response ("Okay if like my  spacebar  quite a bit?   ") |> Expect.equalTo "Sure."),

    test "other whitespace"
      (fn _ => response ("\n\r \t") |> Expect.equalTo "Fine. Be that way!"),

    test "non-question ending with whitespace"
      (fn _ => response ("This is a statement ending with whitespace      ") |> Expect.equalTo "Whatever.")
  ]

val _ = Test.run testsuite