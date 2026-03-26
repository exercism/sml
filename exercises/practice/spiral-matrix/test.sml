(* version 1.0.0 *)

use "testlib.sml";
use "spiral-matrix.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "spiral-matrix" [
    test "empty spiral"
      (fn _ => spiralMatrix 0 |> Expect.equalTo []),

    test "trivial spiral"
      (fn _ => spiralMatrix 1 |> Expect.equalTo [[1]]),

    test "spiral of size 2"
      (fn _ => spiralMatrix 2 |> Expect.equalTo
                         [[1, 2],
                          [4, 3]]),

    test "spiral of size 3"
      (fn _ => spiralMatrix 3 |> Expect.equalTo
                         [[1, 2, 3],
                          [8, 9, 4],
                          [7, 6, 5]]),

    test "spiral of size 4"
      (fn _ => spiralMatrix 4 |> Expect.equalTo
                         [[1, 2, 3, 4],
                          [12, 13, 14, 5],
                          [11, 16, 15, 6],
                          [10, 9, 8, 7]]),

    test "spiral of size 5"
      (fn _ => spiralMatrix 5 |> Expect.equalTo
                         [[1, 2, 3, 4, 5],
                          [16, 17, 18, 19, 6],
                          [15, 24, 25, 20, 7],
                          [14, 23, 22, 21, 8],
                          [13, 12, 11, 10, 9]])
  ]

val _ = Test.run testsuite
