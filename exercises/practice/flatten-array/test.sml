(* version 1.2.0 *)

use "testlib.sml";
use "flatten-array.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "flatten-array" [
    test "empty"
      (fn _ => let
        val nested = List []
      in
        flatten nested |> Expect.equalTo []
      end),

    test "no nesting"
      (fn _ => let
        val nested = List [Elem 0, Elem 1, Elem 2]
      in
        flatten nested |> Expect.equalTo [0, 1, 2]
      end),

    test "flattens a nested array"
      (fn _ => let
        val nested = List [List [List []]]
      in
        flatten nested |> Expect.equalTo []
      end),

    test "flattens array with just integers present"
      (fn _ => let
        val nested = List [Elem 1,
                           List [Elem 2, Elem 3, Elem 4, Elem 5, Elem 6, Elem 7],
                           Elem 8]
      in
        flatten nested |> Expect.equalTo [1, 2, 3, 4, 5, 6, 7, 8]
      end),

    test "5 level nesting"
      (fn _ => let
        val nested = List [Elem 0,
                           Elem 2,
                           List [List [Elem 2, Elem 3],
                                 Elem 8,
                                 Elem 100,
                                 Elem 4,
                                 List [List [List [Elem 50]]]],
                           Elem (~2)]
      in
        flatten nested |> Expect.equalTo [0, 2, 2, 3, 8, 100, 4, 50, ~2]
      end),

    test "6 level nesting"
      (fn _ => let
        val nested = List [Elem 1,
                           List [Elem 2,
                                 List [List [Elem 3]],
                                 List [Elem 4, List [List [Elem 5]]],
                                 Elem 6,
                                 Elem 7],
                           Elem 8]
      in
        flatten nested |> Expect.equalTo [1, 2, 3, 4, 5, 6, 7, 8]
      end),

    test "Empty values are omitted from the final result"
      (fn _ => let
        val nested = List [Elem 1, Elem 2, Empty]
      in
        flatten nested |> Expect.equalTo [1, 2]
      end),

    test "consecutive Empty values at the front of the list are omitted from the final result"
      (fn _ => let
        val nested = List [Empty, Empty, Elem 3]
      in
        flatten nested |> Expect.equalTo [3]
      end),

    test "consecutive Empty values in the middle of the list are omitted from the final result"
      (fn _ => let
        val nested = List [Elem 1, Empty, Empty, Elem 4]
      in
        flatten nested |> Expect.equalTo [1, 4]
      end),

    test "6 level nest list with Empty values"
      (fn _ => let
        val nested = List [Elem 0,
                           Elem 2,
                           List [List [Elem 2, Elem 3],
                                 Elem 8,
                                 List [List [Elem 100]],
                                 Empty,
                                 List [List [Empty]]],
                           Elem (~2)]
      in
        flatten nested |> Expect.equalTo [0, 2, 2, 3, 8, 100, ~2]
      end),

    test "all values in nested list are Empty"
      (fn _ => let
         val nested = List [Empty,
                            List [List [List [Empty]]],
                            Empty,
                            Empty,
                            List [List [Empty, Empty], Empty],
                            Empty]
       in
         flatten nested |> Expect.equalTo []
       end)
  ]

val _ = Test.run testsuite
