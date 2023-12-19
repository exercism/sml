(* version 1.0.0 *)

use "testlib.sml";
use "darts.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "darts" [
    test "Missed target"
      (fn _ => score (~9.0, 9.0) |> Expect.equalTo 0),

    test "On the outer circle"
      (fn _ => score (0.0, 10.0) |> Expect.equalTo 1),

    test "On the middle circle"
      (fn _ => score (~5.0, 0.0) |> Expect.equalTo 5),

    test "On the inner circle"
      (fn _ => score (0.0, ~1.0) |> Expect.equalTo 10),

    test "Exactly on center"
      (fn _ => score (0.0, 0.0) |> Expect.equalTo 10),

    test "Near the center"
      (fn _ => score (~0.1, ~0.1) |> Expect.equalTo 10),

    test "Just within the inner circle"
      (fn _ => score (0.7, 0.7) |> Expect.equalTo 10),

    test "Just outside the inner circle"
      (fn _ => score (0.8, ~0.8) |> Expect.equalTo 5),

    test "Just within the middle circle"
      (fn _ => score (~3.5, 3.5) |> Expect.equalTo 5),

    test "Just outside the middle circle"
      (fn _ => score (~3.6, ~3.6) |> Expect.equalTo 1),

    test "Just within the outer circle"
      (fn _ => score (~7.0, 7.0) |> Expect.equalTo 1),

    test "Just outside the outer circle"
      (fn _ => score (7.1, ~7.1) |> Expect.equalTo 0),

    test "Asymmetric position between the inner and middle circles"
      (fn _ => score (0.5, ~4.0) |> Expect.equalTo 5)
  ]

val _ = Test.run testsuite
