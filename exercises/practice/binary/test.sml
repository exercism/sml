(* version 1.0.0 *)

use "testlib.sml";
use "example.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "binary" [
    test "binary 0 is decimal 0"
      (fn _ => decimal ("0") |> Expect.equalTo (SOME 0)),

    test "binary 1 is decimal 1"
      (fn _ => decimal ("1") |> Expect.equalTo (SOME 1)),

    test "binary 10 is decimal 2"
      (fn _ => decimal ("10") |> Expect.equalTo (SOME 2)),

    test "binary 11 is decimal 3"
      (fn _ => decimal ("11") |> Expect.equalTo (SOME 3)),

    test "binary 100 is decimal 4"
      (fn _ => decimal ("100") |> Expect.equalTo (SOME 4)),

    test "binary 1001 is decimal 9"
      (fn _ => decimal ("1001") |> Expect.equalTo (SOME 9)),

    test "binary 11010 is decimal 26"
      (fn _ => decimal ("11010") |> Expect.equalTo (SOME 26)),

    test "binary 10001101000 is decimal 1128"
      (fn _ => decimal ("10001101000") |> Expect.equalTo (SOME 1128)),

    test "binary ignores leading zeros"
      (fn _ => decimal ("000011111") |> Expect.equalTo (SOME 31)),

    test "2 is not a valid binary digit"
      (fn _ => decimal ("2") |> Expect.equalTo NONE),

    test "a number containing a non-binary digit is invalid"
      (fn _ => decimal ("01201") |> Expect.equalTo NONE),

    test "a number with trailing non-binary characters is invalid"
      (fn _ => decimal ("10nope") |> Expect.equalTo NONE),

    test "a number with leading non-binary characters is invalid"
      (fn _ => decimal ("nope10") |> Expect.equalTo NONE),

    test "a number with internal non-binary characters is invalid"
      (fn _ => decimal ("10nope10") |> Expect.equalTo NONE),

    test "a number and a word whitespace spearated is invalid"
      (fn _ => decimal ("001 nope") |> Expect.equalTo NONE)
  ]

val _ = Test.run testsuite