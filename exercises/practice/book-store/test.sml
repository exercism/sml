use "testlib.sml";
use "book-store.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "book-store" [
    test "Only a single book"
      (fn _ => total [1] |> Expect.equalTo 800),

    test "Two of the same book"
      (fn _ => total [2, 2] |> Expect.equalTo 1600),

    test "Empty basket"
      (fn _ => total [] |> Expect.equalTo 0),

    test "Two different books"
      (fn _ => total [1, 2] |> Expect.equalTo 1520),

    test "Three different books"
      (fn _ => total [1, 2, 3] |> Expect.equalTo 2160),

    test "Four different books"
      (fn _ => total [1, 2, 3, 4] |> Expect.equalTo 2560),

    test "Five different books"
      (fn _ => total [1, 2, 3, 4, 5] |> Expect.equalTo 3000),

    test "Two groups of four is cheaper than group of five plus group of three"
      (fn _ => total [1, 1, 2, 2, 3, 3, 4, 5] |> Expect.equalTo 5120),

    test "Two groups of four is cheaper than groups of five and three"
      (fn _ => total [1, 1, 2, 3, 4, 4, 5, 5] |> Expect.equalTo 5120),

    test "Group of four plus group of two is cheaper than two groups of three"
      (fn _ => total [1, 1, 2, 2, 3, 4] |> Expect.equalTo 4080),

    test "Two each of first four books and one copy each of rest"
      (fn _ => total [1, 1, 2, 2, 3, 3, 4, 4, 5] |> Expect.equalTo 5560),

    test "Two copies of each book"
      (fn _ => total [1, 1, 2, 2, 3, 3, 4, 4, 5, 5] |> Expect.equalTo 6000),

    test "Three copies of first book and two each of remaining"
      (fn _ => total [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1] |> Expect.equalTo 6800),

    test "Three each of first two books and two each of remaining books"
      (fn _ => total [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2] |> Expect.equalTo 7520),

    test "Four groups of four are cheaper than two groups each of five and three"
      (fn _ => total [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5] |> Expect.equalTo 10240),

    test "Check that groups of four are created properly even when there are more groups of three than groups of five"
      (fn _ => total [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5] |> Expect.equalTo 14560),

    test "One group of one and four is cheaper than one group of two and three"
      (fn _ => total [1, 1, 2, 3, 4] |> Expect.equalTo 3360),

    test "One group of one and two plus three groups of four is cheaper than one group of each size"
      (fn _ => total [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5] |> Expect.equalTo 10000)
  ]

val _ = Test.run testsuite