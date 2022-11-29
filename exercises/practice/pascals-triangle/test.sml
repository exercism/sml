use "testlib.sml";
use "pascals-triangle.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "pascals-triangle" [
    test "zero rows"
      (fn _ => rows 0 |> Expect.equalTo []),

    test "single row"
      (fn _ => rows 1 |> Expect.equalTo [[1]]),

    test "two rows"
      (fn _ => rows 2 |> Expect.equalTo [[1], [1, 1]]),

    test "three rows"
      (fn _ => rows 3 |> Expect.equalTo [[1], [1, 1], [1, 2, 1]]),

    test "four rows"
      (fn _ => rows 4 |> Expect.equalTo [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]),

    test "five rows"
      (fn _ => rows 5 |> Expect.equalTo [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]),

    test "six rows"
      (fn _ => rows 6 |> Expect.equalTo [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]),

    test "ten rows"
      (fn _ => rows 10 |> Expect.equalTo [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1], [1, 6, 15, 20, 15, 6, 1], [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1], [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]])
  ]

val _ = Test.run testsuite