(* version 1.0.0 *)

use "testlib.sml";
use "matrix.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "matrix" [
    test "extract row from one number matrix"
      (fn _ => let
        val s = "1"
      in
        row (s, 1) |> Expect.equalTo [1]
      end),

    test "can extract row"
      (fn _ => let
        val s = "1 2\n3 4"
      in
        row (s, 2) |> Expect.equalTo [3, 4]
      end),

    test "extract row where numbers have different widths"
      (fn _ => let
        val s = "1 2\n10 20"
      in
        row (s, 2) |> Expect.equalTo [10, 20]
      end),

    test "can extract row from non-square matrix with no corresponding column"
      (fn _ => let
        val s = "1 2 3\n4 5 6\n7 8 9\n8 7 6"
      in
        row (s, 4) |> Expect.equalTo [8, 7, 6]
      end),

    test "extract column from one number matrix"
      (fn _ => let
        val s = "1"
      in
        column (s, 1) |> Expect.equalTo [1]
      end),

    test "can extract column"
      (fn _ => let
        val s = "1 2 3\n4 5 6\n7 8 9"
      in
        column (s, 3) |> Expect.equalTo [3, 6, 9]
      end),

    test "can extract column from non-square matrix with no corresponding row"
      (fn _ => let
        val s = "1 2 3 4\n5 6 7 8\n9 8 7 6"
      in
        column (s, 4) |> Expect.equalTo [4, 8, 6]
      end),

    test "extract column where numbers have different widths"
      (fn _ => let
        val s = "89 1903 3\n18 3 1\n9 4 800"
      in
        column (s, 2) |> Expect.equalTo [1903, 3, 4]
      end)
  ]

val _ = Test.run testsuite
