(* version 1.0.0 *)

use "testlib.sml";
use "scrabble-score.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "scrabble-score" [
    test "lowercase letter"
      (fn _ => score "a" |> Expect.equalTo 1),

    test "uppercase letter"
      (fn _ => score "A" |> Expect.equalTo 1),

    test "valuable letter"
      (fn _ => score "f" |> Expect.equalTo 4),

    test "short word"
      (fn _ => score "at" |> Expect.equalTo 2),

    test "short, valuable word"
      (fn _ => score "zoo" |> Expect.equalTo 12),

    test "medium word"
      (fn _ => score "street" |> Expect.equalTo 6),

    test "medium, valuable word"
      (fn _ => score "quirky" |> Expect.equalTo 22),

    test "long, mixed-case word"
      (fn _ => score "OxyphenButazone" |> Expect.equalTo 41),

    test "english-like word"
      (fn _ => score "pinata" |> Expect.equalTo 8),

    test "empty input"
      (fn _ => score "" |> Expect.equalTo 0),

    test "entire alphabet available"
      (fn _ => score "abcdefghijklmnopqrstuvwxyz" |> Expect.equalTo 87)
  ]

val _ = Test.run testsuite
