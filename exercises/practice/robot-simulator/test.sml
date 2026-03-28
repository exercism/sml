(* version 1.0.0 *)

use "testlib.sml";
use "robot-simulator.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "robot-simulator" [
    describe "Rotating clockwise" [
      test "changes north to east"
        (fn _ => let
          val original = {position = (0, 0), dir = North}
          val expected = {position = (0, 0), dir = East}
        in
          move (original, "R") |> Expect.equalTo expected
        end),

      test "changes east to south"
        (fn _ => let
          val original = {position = (0, 0), dir = East}
          val expected = {position = (0, 0), dir = South}
        in
          move (original, "R") |> Expect.equalTo expected
        end),

      test "changes south to west"
        (fn _ => let
          val original = {position = (0, 0), dir = South}
          val expected = {position = (0, 0), dir = West}
        in
          move (original, "R") |> Expect.equalTo expected
        end),

      test "changes west to north"
        (fn _ => let
          val original = {position = (0, 0), dir = West}
          val expected = {position = (0, 0), dir = North}
        in
          move (original, "R") |> Expect.equalTo expected
        end)
    ],

    describe "Rotating counter-clockwise" [
      test "changes north to west"
        (fn _ => let
          val original = {position = (0, 0), dir = North}
          val expected = {position = (0, 0), dir = West}
        in
          move (original, "L") |> Expect.equalTo expected
        end),

      test "changes west to south"
        (fn _ => let
          val original = {position = (0, 0), dir = West}
          val expected = {position = (0, 0), dir = South}
        in
          move (original, "L") |> Expect.equalTo expected
        end),

      test "changes south to east"
        (fn _ => let
          val original = {position = (0, 0), dir = South}
          val expected = {position = (0, 0), dir = East}
        in
          move (original, "L") |> Expect.equalTo expected
        end),

      test "changes east to north"
        (fn _ => let
          val original = {position = (0, 0), dir = East}
          val expected = {position = (0, 0), dir = North}
        in
          move (original, "L") |> Expect.equalTo expected
        end)
    ],

    describe "Moving forward one" [
      test "facing north increments Y"
        (fn _ => let
          val original = {position = (0, 0), dir = North}
          val expected = {position = (0, 1), dir = North}
        in
          move (original, "A") |> Expect.equalTo expected
        end),

      test "facing south decrements Y"
        (fn _ => let
          val original = {position = (0, 0), dir = South}
          val expected = {position = (0, ~1), dir = South}
        in
          move (original, "A") |> Expect.equalTo expected
        end),

      test "facing east increments X"
        (fn _ => let
          val original = {position = (0, 0), dir = East}
          val expected = {position = (1, 0), dir = East}
        in
          move (original, "A") |> Expect.equalTo expected
        end),

      test "facing west decrements X"
        (fn _ => let
          val original = {position = (0, 0), dir = West}
          val expected = {position = (~1, 0), dir = West}
        in
          move (original, "A") |> Expect.equalTo expected
        end)
    ],

    describe "Follow series of instructions" [
      test "moving east and north from README"
        (fn _ => let
          val original = {position = (7, 3), dir = North}
          val expected = {position = (9, 4), dir = West}
        in
          move (original, "RAALAL") |> Expect.equalTo expected
        end),

      test "moving west and north"
        (fn _ => let
          val original = {position = (0, 0), dir = North}
          val expected = {position = (~4, 1), dir = West}
        in
          move (original, "LAAARALA") |> Expect.equalTo expected
        end),

      test "moving west and south"
        (fn _ => let
          val original = {position = (2, ~7), dir = East}
          val expected = {position = (~3, ~8), dir = South}
        in
          move (original, "RRAAAAALA") |> Expect.equalTo expected
        end),

      test "moving east and north"
        (fn _ => let
          val original = {position = (8, 4), dir = South}
          val expected = {position = (11, 5), dir = North}
        in
          move (original, "LAAARRRALLLL") |> Expect.equalTo expected
        end)
    ]
  ]

val _ = Test.run testsuite
