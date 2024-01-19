(* version 1.0.0 *)

use "testlib.sml";
use "yacht.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "yacht" [
    test "Yacht"
      (fn _ => score ([5, 5, 5, 5, 5], Yacht) |> Expect.equalTo 50),

    test "Not Yacht"
      (fn _ => score ([1, 3, 3, 2, 5], Yacht) |> Expect.equalTo 0),

    test "Ones"
      (fn _ => score ([1, 1, 1, 3, 5], Ones) |> Expect.equalTo 3),

    test "Ones, out of order"
      (fn _ => score ([3, 1, 1, 5, 1], Ones) |> Expect.equalTo 3),

    test "No ones"
      (fn _ => score ([4, 3, 6, 5, 5], Ones) |> Expect.equalTo 0),

    test "Twos"
      (fn _ => score ([2, 3, 4, 5, 6], Twos) |> Expect.equalTo 2),

    test "Fours"
      (fn _ => score ([1, 4, 1, 4, 1], Fours) |> Expect.equalTo 8),

    test "Yacht counted as threes"
      (fn _ => score ([3, 3, 3, 3, 3], Threes) |> Expect.equalTo 15),

    test "Yacht of 3s counted as fives"
      (fn _ => score ([3, 3, 3, 3, 3], Fives) |> Expect.equalTo 0),

    test "Fives"
      (fn _ => score ([1, 5, 3, 5, 3], Fives) |> Expect.equalTo 10),

    test "Sixes"
      (fn _ => score ([2, 3, 4, 5, 6], Sixes) |> Expect.equalTo 6),

    test "Full house two small, three big"
      (fn _ => score ([2, 2, 4, 4, 4], FullHouse) |> Expect.equalTo 16),

    test "Full house three small, two big"
      (fn _ => score ([5, 3, 3, 5, 3], FullHouse) |> Expect.equalTo 19),

    test "Two pair is not a full house"
      (fn _ => score ([2, 2, 4, 4, 5], FullHouse) |> Expect.equalTo 0),

    test "Four of a kind is not a full house"
      (fn _ => score ([1, 4, 4, 4, 4], FullHouse) |> Expect.equalTo 0),

    test "Yacht is not a full house"
      (fn _ => score ([2, 2, 2, 2, 2], FullHouse) |> Expect.equalTo 0),

    test "Four of a Kind"
      (fn _ => score ([6, 6, 4, 6, 6], FourOfAKind) |> Expect.equalTo 24),

    test "Yacht can be scored as Four of a Kind"
      (fn _ => score ([3, 3, 3, 3, 3], FourOfAKind) |> Expect.equalTo 12),

    test "Full house is not Four of a Kind"
      (fn _ => score ([3, 3, 3, 5, 5], FourOfAKind) |> Expect.equalTo 0),

    test "Little Straight"
      (fn _ => score ([3, 5, 4, 1, 2], LittleStraight) |> Expect.equalTo 30),

    test "Little Straight as Big Straight"
      (fn _ => score ([1, 2, 3, 4, 5], BigStraight) |> Expect.equalTo 0),

    test "Four in order but not a little straight"
      (fn _ => score ([1, 1, 2, 3, 4], LittleStraight) |> Expect.equalTo 0),

    test "No pairs but not a little straight"
      (fn _ => score ([1, 2, 3, 4, 6], LittleStraight) |> Expect.equalTo 0),

    test "Minimum is 1, maximum is 5, but not a little straight"
      (fn _ => score ([1, 1, 3, 4, 5], LittleStraight) |> Expect.equalTo 0),

    test "Big Straight"
      (fn _ => score ([4, 6, 2, 5, 3], BigStraight) |> Expect.equalTo 30),

    test "Big Straight as little straight"
      (fn _ => score ([6, 5, 4, 3, 2], LittleStraight) |> Expect.equalTo 0),

    test "No pairs but not a big straight"
      (fn _ => score ([6, 5, 4, 3, 1], BigStraight) |> Expect.equalTo 0),

    test "Choice"
      (fn _ => score ([3, 3, 5, 6, 6], Choice) |> Expect.equalTo 23),

    test "Yacht as choice"
      (fn _ => score ([2, 2, 2, 2, 2], Choice) |> Expect.equalTo 10)
  ]

val _ = Test.run testsuite
