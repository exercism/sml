(* version 1.0.0 *)

use "testlib.sml";
use "yacht.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "yacht" [
    test "Yacht"
      (fn _ => score ([5, 5, 5, 5, 5], "yacht") |> Expect.equalTo 50),

    test "Not Yacht"
      (fn _ => score ([1, 3, 3, 2, 5], "yacht") |> Expect.equalTo 0),

    test "Ones"
      (fn _ => score ([1, 1, 1, 3, 5], "ones") |> Expect.equalTo 3),

    test "Ones, out of order"
      (fn _ => score ([3, 1, 1, 5, 1], "ones") |> Expect.equalTo 3),

    test "No ones"
      (fn _ => score ([4, 3, 6, 5, 5], "ones") |> Expect.equalTo 0),

    test "Twos"
      (fn _ => score ([2, 3, 4, 5, 6], "twos") |> Expect.equalTo 2),

    test "Fours"
      (fn _ => score ([1, 4, 1, 4, 1], "fours") |> Expect.equalTo 8),

    test "Yacht counted as threes"
      (fn _ => score ([3, 3, 3, 3, 3], "threes") |> Expect.equalTo 15),

    test "Yacht of 3s counted as fives"
      (fn _ => score ([3, 3, 3, 3, 3], "fives") |> Expect.equalTo 0),

    test "Fives"
      (fn _ => score ([1, 5, 3, 5, 3], "fives") |> Expect.equalTo 10),

    test "Sixes"
      (fn _ => score ([2, 3, 4, 5, 6], "sixes") |> Expect.equalTo 6),

    test "Full house two small, three big"
      (fn _ => score ([2, 2, 4, 4, 4], "full house") |> Expect.equalTo 16),

    test "Full house three small, two big"
      (fn _ => score ([5, 3, 3, 5, 3], "full house") |> Expect.equalTo 19),

    test "Two pair is not a full house"
      (fn _ => score ([2, 2, 4, 4, 5], "full house") |> Expect.equalTo 0),

    test "Four of a kind is not a full house"
      (fn _ => score ([1, 4, 4, 4, 4], "full house") |> Expect.equalTo 0),

    test "Yacht is not a full house"
      (fn _ => score ([2, 2, 2, 2, 2], "full house") |> Expect.equalTo 0),

    test "Four of a Kind"
      (fn _ => score ([6, 6, 4, 6, 6], "four of a kind") |> Expect.equalTo 24),

    test "Yacht can be scored as Four of a Kind"
      (fn _ => score ([3, 3, 3, 3, 3], "four of a kind") |> Expect.equalTo 12),

    test "Full house is not Four of a Kind"
      (fn _ => score ([3, 3, 3, 5, 5], "four of a kind") |> Expect.equalTo 0),

    test "Little Straight"
      (fn _ => score ([3, 5, 4, 1, 2], "little straight") |> Expect.equalTo 30),

    test "Little Straight as Big Straight"
      (fn _ => score ([1, 2, 3, 4, 5], "big straight") |> Expect.equalTo 0),

    test "Four in order but not a little straight"
      (fn _ => score ([1, 1, 2, 3, 4], "little straight") |> Expect.equalTo 0),

    test "No pairs but not a little straight"
      (fn _ => score ([1, 2, 3, 4, 6], "little straight") |> Expect.equalTo 0),

    test "Minimum is 1, maximum is 5, but not a little straight"
      (fn _ => score ([1, 1, 3, 4, 5], "little straight") |> Expect.equalTo 0),

    test "Big Straight"
      (fn _ => score ([4, 6, 2, 5, 3], "big straight") |> Expect.equalTo 30),

    test "Big Straight as little straight"
      (fn _ => score ([6, 5, 4, 3, 2], "little straight") |> Expect.equalTo 0),

    test "No pairs but not a big straight"
      (fn _ => score ([6, 5, 4, 3, 1], "big straight") |> Expect.equalTo 0),

    test "Choice"
      (fn _ => score ([3, 3, 5, 6, 6], "choice") |> Expect.equalTo 23),

    test "Yacht as choice"
      (fn _ => score ([2, 2, 2, 2, 2], "choice") |> Expect.equalTo 10)
  ]

val _ = Test.run testsuite
