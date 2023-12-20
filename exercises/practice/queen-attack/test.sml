(* version 1.0.0 *)

use "testlib.sml";
use "queen-attack.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "queen-attack" [
    describe "Test creation of Queens with valid and invalid positions" [
      test "queen with a valid position"
        (fn _ => create (2, 2) |> Expect.equalTo (create (2, 2))),

      test "queen must have positive row"
        (fn _ => (fn _ => create (~2, 2)) |> Expect.error (Fail "row not positive")),

      test "queen must have row on board"
        (fn _ => (fn _ => create (8, 4)) |> Expect.error (Fail "row not on board")),

      test "queen must have positive column"
        (fn _ => (fn _ => create (2, ~2)) |> Expect.error (Fail "column not positive")),

      test "queen must have column on board"
        (fn _ => (fn _ => create (4, 8)) |> Expect.error (Fail "column not on board"))
    ],

    describe "Test the ability of one queen to attack another" [
      test "cannot attack"
        (fn _ => canAttack (create (2, 4)) (create (6, 6)) |> Expect.falsy),

      test "can attack on same row"
        (fn _ => canAttack (create (2, 4)) (create (2, 6)) |> Expect.truthy),

      test "can attack on same column"
        (fn _ => canAttack (create (4, 5)) (create (2, 5)) |> Expect.truthy),

      test "can attack on first diagonal"
        (fn _ => canAttack (create (2, 2)) (create (0, 4)) |> Expect.truthy),

      test "can attack on second diagonal"
        (fn _ => canAttack (create (2, 2)) (create (3, 1)) |> Expect.truthy),

      test "can attack on third diagonal"
        (fn _ => canAttack (create (2, 2)) (create (1, 1)) |> Expect.truthy),

      test "can attack on fourth diagonal"
        (fn _ => canAttack (create (1, 7)) (create (0, 6)) |> Expect.truthy),

      test "cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal"
        (fn _ => canAttack (create (4, 1)) (create (2, 5)) |> Expect.falsy)
    ]
  ]

val _ = Test.run testsuite
