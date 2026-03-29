(* version 1.0.0 *)

use "testlib.sml";
use "game-of-life.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "game-of-life" [
    test "empty matrix"
      (fn _ => let
        val matrix = []

        val expect = []
      in
        tick matrix |> Expect.equalTo expect
      end),

    test "live cells with zero live neighbors die"
      (fn _ => let
        val matrix = [[0, 0, 0],
                      [0, 1, 0],
                      [0, 0, 0]]

        val expect = [[0, 0, 0],
                      [0, 0, 0],
                      [0, 0, 0]]
      in
        tick matrix |> Expect.equalTo expect
      end),

    test "live cells with only one live neighbor die"
      (fn _ => let
        val matrix = [[0, 0, 0],
                      [0, 1, 0],
                      [0, 1, 0]]

        val expect = [[0, 0, 0],
                      [0, 0, 0],
                      [0, 0, 0]]
      in
        tick matrix |> Expect.equalTo expect
      end),

    test "live cells with two live neighbors stay alive"
      (fn _ => let
        val matrix = [[1, 0, 1],
                      [1, 0, 1],
                      [1, 0, 1]]

        val expect = [[0, 0, 0],
                      [1, 0, 1],
                      [0, 0, 0]]
      in
        tick matrix |> Expect.equalTo expect
      end),

    test "live cells with three live neighbors stay alive"
      (fn _ => let
        val matrix = [[0, 1, 0],
                      [1, 0, 0],
                      [1, 1, 0]]

        val expect = [[0, 0, 0],
                      [1, 0, 0],
                      [1, 1, 0]]
      in
        tick matrix |> Expect.equalTo expect
      end),

    test "dead cells with three live neighbors become alive"
      (fn _ => let
        val matrix = [[1, 1, 0],
                      [0, 0, 0],
                      [1, 0, 0]]

        val expect = [[0, 0, 0],
                      [1, 1, 0],
                      [0, 0, 0]]
      in
        tick matrix |> Expect.equalTo expect
      end),

    test "live cells with four or more neighbors die"
      (fn _ => let
        val matrix = [[1, 1, 1],
                      [1, 1, 1],
                      [1, 1, 1]]

        val expect = [[1, 0, 1],
                      [0, 0, 0],
                      [1, 0, 1]]
      in
        tick matrix |> Expect.equalTo expect
      end),

    test "bigger matrix"
      (fn _ => let
        val matrix = [[1, 1, 0, 1, 1, 0, 0, 0],
                      [1, 0, 1, 1, 0, 0, 0, 0],
                      [1, 1, 1, 0, 0, 1, 1, 1],
                      [0, 0, 0, 0, 0, 1, 1, 0],
                      [1, 0, 0, 0, 1, 1, 0, 0],
                      [1, 1, 0, 0, 0, 1, 1, 1],
                      [0, 0, 1, 0, 1, 0, 0, 1],
                      [1, 0, 0, 0, 0, 0, 1, 1]]

        val expect = [[1, 1, 0, 1, 1, 0, 0, 0],
                      [0, 0, 0, 0, 0, 1, 1, 0],
                      [1, 0, 1, 1, 1, 1, 0, 1],
                      [1, 0, 0, 0, 0, 0, 0, 1],
                      [1, 1, 0, 0, 1, 0, 0, 1],
                      [1, 1, 0, 1, 0, 0, 0, 1],
                      [1, 0, 0, 0, 0, 0, 0, 0],
                      [0, 0, 0, 0, 0, 0, 1, 1]]
      in
        tick matrix |> Expect.equalTo expect
      end)
  ]

val _ = Test.run testsuite
