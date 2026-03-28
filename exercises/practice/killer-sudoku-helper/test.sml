(* version 1.0.0 *)

use "testlib.sml";
use "killer-sudoku-helper.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "killer-sudoku-helper" [
    describe "Trivial 1-digit cages" [
      test "1"
        (fn _ => combinations {sum=1, size=1, exclude=[]} |> Expect.equalTo [[1]]),

      test "2"
        (fn _ => combinations {sum=2, size=1, exclude=[]} |> Expect.equalTo [[2]]),

      test "3"
        (fn _ => combinations {sum=3, size=1, exclude=[]} |> Expect.equalTo [[3]]),

      test "4"
        (fn _ => combinations {sum=4, size=1, exclude=[]} |> Expect.equalTo [[4]]),

      test "5"
        (fn _ => combinations {sum=5, size=1, exclude=[]} |> Expect.equalTo [[5]]),

      test "6"
        (fn _ => combinations {sum=6, size=1, exclude=[]} |> Expect.equalTo [[6]]),

      test "7"
        (fn _ => combinations {sum=7, size=1, exclude=[]} |> Expect.equalTo [[7]]),

      test "8"
        (fn _ => combinations {sum=8, size=1, exclude=[]} |> Expect.equalTo [[8]]),

      test "9"
        (fn _ => combinations {sum=9, size=1, exclude=[]} |> Expect.equalTo [[9]])
    ],

    test "Cage with sum 45 contains all digits 1:9"
      (fn _ => combinations {sum=45, size=9, exclude=[]} |> Expect.equalTo [[1, 2, 3, 4, 5, 6, 7, 8, 9]]),

    test "Cage with only 1 possible combination"
      (fn _ => combinations {sum=7, size=3, exclude=[]} |> Expect.equalTo [[1, 2, 4]]),

    test "Cage with several combinations"
      (fn _ => combinations {sum=10, size=2, exclude=[]} |> Expect.equalTo [[1, 9], [2, 8], [3, 7], [4, 6]]),

    test "Cage with several combinations that is restricted"
      (fn _ => combinations {sum=10, size=2, exclude=[1, 4]} |> Expect.equalTo [[2, 8], [3, 7]])
  ]

val _ = Test.run testsuite
