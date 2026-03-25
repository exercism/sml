(* version 1.0.0 *)

use "testlib.sml";
use "series.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "series" [
    test "slices of one from one"
      (fn _ => slices ("1", 1) |> Expect.equalTo ["1"]),

    test "slices of one from two"
      (fn _ => slices ("12", 1) |> Expect.equalTo ["1", "2"]),

    test "slices of two"
      (fn _ => slices ("35", 2) |> Expect.equalTo ["35"]),

    test "slices of two overlap"
      (fn _ => slices ("9142", 2) |> Expect.equalTo ["91", "14", "42"]),

    test "slices can include duplicates"
      (fn _ => slices ("777777", 3) |> Expect.equalTo ["777", "777", "777", "777"]),

    test "slices of a long series"
      (fn _ => slices ("918493904243", 5) |> Expect.equalTo ["91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243"]),

    test "slice length is too large"
      (fn _ => (fn _ => slices ("12345", 6)) |> Expect.error (Fail "slice length cannot be greater than series length")),

    test "slice length is way too large"
      (fn _ => (fn _ => slices ("12345", 42)) |> Expect.error (Fail "slice length cannot be greater than series length")),

    test "slice length cannot be zero"
      (fn _ => (fn _ => slices ("12345", 0)) |> Expect.error (Fail "slice length cannot be zero")),

    test "slice length cannot be negative"
      (fn _ => (fn _ => slices ("123", ~1)) |> Expect.error (Fail "slice length cannot be negative")),

    test "empty series is invalid"
      (fn _ => (fn _ => slices ("", 1)) |> Expect.error (Fail "series cannot be empty"))
  ]

val _ = Test.run testsuite
