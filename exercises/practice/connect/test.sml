(* version 1.0.0 *)

use "testlib.sml";
use "connect.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "connect" [
    test "an empty board has no winner"
      (fn _ => let
        val board = Vector.fromList [". . . . .",
                                     " . . . . .",
                                     "  . . . . .",
                                     "   . . . . .",
                                     "    . . . . ."]
      in
        winner board |> Expect.equalTo ""
      end),

    test "X can win on a 1x1 board"
      (fn _ => let
        val board = Vector.fromList ["X"]
      in
        winner board |> Expect.equalTo "X"
      end),

    test "O can win on a 1x1 board"
      (fn _ => let
        val board = Vector.fromList ["O"]
      in
        winner board |> Expect.equalTo "O"
      end),

    test "only edges does not make a winner"
      (fn _ => let
        val board = Vector.fromList ["O O O X",
                                     " X . . X",
                                     "  X . . X",
                                     "   X O O O"]
      in
        winner board |> Expect.equalTo ""
      end),

    test "illegal diagonal does not make a winner"
      (fn _ => let
        val board = Vector.fromList ["X O . .",
                                     " O X X X",
                                     "  O X O .",
                                     "   . O X .",
                                     "    X X O O"]
      in
        winner board |> Expect.equalTo ""
      end),

    test "nobody wins crossing adjacent angles"
      (fn _ => let
        val board = Vector.fromList ["X . . .",
                                     " . X O .",
                                     "  O . X O",
                                     "   . O . X",
                                     "    . . O ."]
      in
        winner board |> Expect.equalTo ""
      end),

    test "X wins crossing from left to right"
      (fn _ => let
        val board = Vector.fromList [". O . .",
                                     " O X X X",
                                     "  O X O .",
                                     "   X X O X",
                                     "    . O X ."]
      in
        winner board |> Expect.equalTo "X"
      end),

    test "X wins with left-hand dead end fork"
      (fn _ => let
        val board = Vector.fromList [". . X .",
                                     " X X . .",
                                     "  . X X X",
                                     "   O O O O"]
      in
        winner board |> Expect.equalTo "X"
      end),

    test "X wins with right-hand dead end fork"
      (fn _ => let
        val board = Vector.fromList [". . X X",
                                     " X X . .",
                                     "  . X X .",
                                     "   O O O O"]
      in
        winner board |> Expect.equalTo "X"
      end),

    test "O wins crossing from top to bottom"
      (fn _ => let
        val board = Vector.fromList [". O . .",
                                     " O X X X",
                                     "  O O O .",
                                     "   X X O X",
                                     "    . O X ."]
      in
        winner board |> Expect.equalTo "O"
      end),

    test "X wins using a convoluted path"
      (fn _ => let
        val board = Vector.fromList [". X X . .",
                                     " X . X . X",
                                     "  . X . X .",
                                     "   . X X . .",
                                     "    O O O O O"]
      in
        winner board |> Expect.equalTo "X"
      end),

    test "X wins using a spiral path"
      (fn _ => let
        val board = Vector.fromList ["O X X X X X X X X",
                                     " O X O O O O O O O",
                                     "  O X O X X X X X O",
                                     "   O X O X O O O X O",
                                     "    O X O X X X O X O",
                                     "     O X O O O X O X O",
                                     "      O X X X X X O X O",
                                     "       O O O O O O O X O",
                                     "        X X X X X X X X O"]
      in
        winner board |> Expect.equalTo "X"
      end)
  ]

val _ = Test.run testsuite
