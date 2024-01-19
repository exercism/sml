(* version 1.0.0 *)

use "testlib.sml";
use "wordy.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "wordy" [
    test "just a number"
      (fn _ => let
        val question = "What is 5?"
      in
        answer question |> Expect.equalTo (SOME 5)
      end),

    test "addition"
      (fn _ => let
        val question = "What is 1 plus 1?"
      in
        answer question |> Expect.equalTo (SOME 2)
      end),

    test "more addition"
      (fn _ => let
        val question = "What is 53 plus 2?"
      in
        answer question |> Expect.equalTo (SOME 55)
      end),

    test "addition with negative numbers"
      (fn _ => let
        val question = "What is -1 plus -10?"
      in
        answer question |> Expect.equalTo (SOME ~11)
      end),

    test "large addition"
      (fn _ => let
        val question = "What is 123 plus 45678?"
      in
        answer question |> Expect.equalTo (SOME 45801)
      end),

    test "subtraction"
      (fn _ => let
        val question = "What is 4 minus -12?"
      in
        answer question |> Expect.equalTo (SOME 16)
      end),

    test "multiplication"
      (fn _ => let
        val question = "What is -3 multiplied by 25?"
      in
        answer question |> Expect.equalTo (SOME ~75)
      end),

    test "division"
      (fn _ => let
        val question = "What is 33 divided by -3?"
      in
        answer question |> Expect.equalTo (SOME ~11)
      end),

    test "multiple additions"
      (fn _ => let
        val question = "What is 1 plus 1 plus 1?"
      in
        answer question |> Expect.equalTo (SOME 3)
      end),

    test "addition and subtraction"
      (fn _ => let
        val question = "What is 1 plus 5 minus -2?"
      in
        answer question |> Expect.equalTo (SOME 8)
      end),

    test "multiple subtraction"
      (fn _ => let
        val question = "What is 20 minus 4 minus 13?"
      in
        answer question |> Expect.equalTo (SOME 3)
      end),

    test "subtraction then addition"
      (fn _ => let
        val question = "What is 17 minus 6 plus 3?"
      in
        answer question |> Expect.equalTo (SOME 14)
      end),

    test "multiple multiplication"
      (fn _ => let
        val question = "What is 2 multiplied by -2 multiplied by 3?"
      in
        answer question |> Expect.equalTo (SOME ~12)
      end),

    test "addition and multiplication"
      (fn _ => let
        val question = "What is -3 plus 7 multiplied by -2?"
      in
        answer question |> Expect.equalTo (SOME ~8)
      end),

    test "multiple division"
      (fn _ => let
        val question = "What is -12 divided by 2 divided by -3?"
      in
        answer question |> Expect.equalTo (SOME 2)
      end),

    test "unknown operation"
      (fn _ => let
        val question = "What is 52 cubed?"
      in
        answer question |> Expect.equalTo NONE
      end),

    test "Non math question"
      (fn _ => let
        val question = "Who is the President of the United States?"
      in
        answer question |> Expect.equalTo NONE
      end),

    test "reject problem missing an operand"
      (fn _ => let
        val question = "What is 1 plus?"
      in
        answer question |> Expect.equalTo NONE
      end),

    test "reject problem with no operands or operators"
      (fn _ => let
        val question = "What is?"
      in
        answer question |> Expect.equalTo NONE
      end),

    test "reject two operations in a row"
      (fn _ => let
        val question = "What is 1 plus plus 2?"
      in
        answer question |> Expect.equalTo NONE
      end),

    test "reject two numbers in a row"
      (fn _ => let
        val question = "What is 1 plus 2 1?"
      in
        answer question |> Expect.equalTo NONE
      end),

    test "reject postfix notation"
      (fn _ => let
        val question = "What is 1 2 plus?"
      in
        answer question |> Expect.equalTo NONE
      end),

    test "reject prefix notation"
      (fn _ => let
        val question = "What is plus 1 2?"
      in
        answer question |> Expect.equalTo NONE
      end)
  ]

val _ = Test.run testsuite
