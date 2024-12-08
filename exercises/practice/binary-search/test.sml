use "testlib.sml";
use "binary-search.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "binary-search" [
    test "finds a value in an array with one element"
      (fn _ => find ([6], 6) |> Expect.equalTo (SOME 0)),

    test "finds a value in the middle of an array"
      (fn _ => find ([1, 3, 4, 6, 8, 9, 11], 6) |> Expect.equalTo (SOME 3)),

    test "finds a value at the beginning of an array"
      (fn _ => find ([1, 3, 4, 6, 8, 9, 11], 1) |> Expect.equalTo (SOME 0)),

    test "finds a value at the end of an array"
      (fn _ => find ([1, 3, 4, 6, 8, 9, 11], 11) |> Expect.equalTo (SOME 6)),

    test "finds a value in an array of odd length"
      (fn _ => find ([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634], 144) |> Expect.equalTo (SOME 9)),

    test "finds a value in an array of even length"
      (fn _ => find ([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], 21) |> Expect.equalTo (SOME 5)),

    test "identifies that a value is not included in the array"
      (fn _ => find ([1, 3, 4, 6, 8, 9, 11], 7) |> Expect.equalTo NONE),

    test "a value smaller than the array's smallest value is not found"
      (fn _ => find ([1, 3, 4, 6, 8, 9, 11], 0) |> Expect.equalTo NONE),

    test "a value larger than the array's largest value is not found"
      (fn _ => find ([1, 3, 4, 6, 8, 9, 11], 13) |> Expect.equalTo NONE),

    test "nothing is found in an empty array"
      (fn _ => find ([], 1) |> Expect.equalTo NONE),

    test "nothing is found when the left and right bounds cross"
      (fn _ => find ([1, 2], 0) |> Expect.equalTo NONE)
  ]

val _ = Test.run testsuite
