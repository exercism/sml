(* version 1.0.0 *)

use "testlib.sml";
use "sublist.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "sublist" [
    test "empty lists"
      (fn _ => let
        val listOne = []
        val listTwo = []
      in
        sublist (listOne, listTwo) |> Expect.equalTo Equal
      end),

    test "empty list within non empty list"
      (fn _ => let
        val listOne = []
        val listTwo = [1, 2, 3]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Sublist
      end),

    test "non empty list contains empty list"
      (fn _ => let
        val listOne = [1, 2, 3]
        val listTwo = []
      in
        sublist (listOne, listTwo) |> Expect.equalTo Superlist
      end),

    test "list equals itself"
      (fn _ => let
        val listOne = [1, 2, 3]
        val listTwo = [1, 2, 3]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Equal
      end),

    test "different lists"
      (fn _ => let
        val listOne = [1, 2, 3]
        val listTwo = [2, 3, 4]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Unequal
      end),

    test "false start"
      (fn _ => let
        val listOne = [1, 2, 5]
        val listTwo = [0, 1, 2, 3, 1, 2, 5, 6]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Sublist
      end),

    test "consecutive"
      (fn _ => let
        val listOne = [1, 1, 2]
        val listTwo = [0, 1, 1, 1, 2, 1, 2]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Sublist
      end),

    test "sublist at start"
      (fn _ => let
        val listOne = [0, 1, 2]
        val listTwo = [0, 1, 2, 3, 4, 5]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Sublist
      end),

    test "sublist in middle"
      (fn _ => let
        val listOne = [2, 3, 4]
        val listTwo = [0, 1, 2, 3, 4, 5]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Sublist
      end),

    test "sublist at end"
      (fn _ => let
        val listOne = [3, 4, 5]
        val listTwo = [0, 1, 2, 3, 4, 5]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Sublist
      end),

    test "at start of superlist"
      (fn _ => let
        val listOne = [0, 1, 2, 3, 4, 5]
        val listTwo = [0, 1, 2]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Superlist
      end),

    test "in middle of superlist"
      (fn _ => let
        val listOne = [0, 1, 2, 3, 4, 5]
        val listTwo = [2, 3]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Superlist
      end),

    test "at end of superlist"
      (fn _ => let
        val listOne = [0, 1, 2, 3, 4, 5]
        val listTwo = [3, 4, 5]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Superlist
      end),

    test "first list missing element from second list"
      (fn _ => let
        val listOne = [1, 3]
        val listTwo = [1, 2, 3]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Unequal
      end),

    test "second list missing element from first list"
      (fn _ => let
        val listOne = [1, 2, 3]
        val listTwo = [1, 3]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Unequal
      end),

    test "first list missing additional digits from second list"
      (fn _ => let
        val listOne = [1, 2]
        val listTwo = [1, 22]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Unequal
      end),

    test "order matters to a list"
      (fn _ => let
        val listOne = [1, 2, 3]
        val listTwo = [3, 2, 1]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Unequal
      end),

    test "same digits but different numbers"
      (fn _ => let
        val listOne = [1, 0, 1]
        val listTwo = [10, 1]
      in
        sublist (listOne, listTwo) |> Expect.equalTo Unequal
      end)
  ]

val _ = Test.run testsuite
