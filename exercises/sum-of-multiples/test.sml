(* version 1.0.0 *)

use "sum-of-multiples.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "sum-of-multiples" [
    test "multiples of 3 or 5 up to 1"
      (fn _ => sum ([3, 5], 1) |> Expect.equalTo 0),

    test "multiples of 3 or 5 up to 4"
      (fn _ => sum ([3, 5], 4) |> Expect.equalTo 3),

    test "multiples of 3 or 5 up to 10"
      (fn _ => sum ([3, 5], 10) |> Expect.equalTo 23),

    test "multiples of 3 or 5 up to 100"
      (fn _ => sum ([3, 5], 100) |> Expect.equalTo 2318),

    test "multiples of 3 or 5 up to 1000"
      (fn _ => sum ([3, 5], 1000) |> Expect.equalTo 233168),

    test "multiples of 7, 13 or 17 up to 20"
      (fn _ => sum ([7, 13, 17], 20) |> Expect.equalTo 51),

    test "multiples of 4 or 6 up to 15"
      (fn _ => sum ([4, 6], 15) |> Expect.equalTo 30),

    test "multiples of 5, 6 or 8 up to 150"
      (fn _ => sum ([5, 6, 8], 150) |> Expect.equalTo 4419),

    test "multiples of 5 or 25 up to 51"
      (fn _ => sum ([5, 25], 51) |> Expect.equalTo 275),

    test "multiples of 43 or 47 up to 10000"
      (fn _ => sum ([43, 47], 10000) |> Expect.equalTo 2203160),

    test "multiples of 1 up to 100"
      (fn _ => sum ([1], 100) |> Expect.equalTo 4950),

    test "multiples of an empty list up to 10000"
      (fn _ => sum ([], 10000) |> Expect.equalTo 0)
  ]

val _ = Test.run testsuite