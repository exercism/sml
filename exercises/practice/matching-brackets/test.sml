(* version 1.4.0 *)

use "testlib.sml";
use "matching-brackets.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "isBalanced" [
    test "paired square brackets"
      (fn _ => isBalanced "[]" |> Expect.truthy),
    test "empty string"
      (fn _ => isBalanced "" |> Expect.truthy),
    test "unpaired brackets"
      (fn _ => isBalanced "[[" |> Expect.falsy),
    test "wrong ordered brackets"
      (fn _ => isBalanced "}{" |> Expect.falsy),
    test "wrong closing bracket"
      (fn _ => isBalanced "{]" |> Expect.falsy),
    test "paired with whitespace"
      (fn _ => isBalanced "{ }" |> Expect.truthy),
    test "partially paired brackets"
      (fn _ => isBalanced "{[])" |> Expect.falsy),
    test "simple nested brackets"
      (fn _ => isBalanced "{[]}" |> Expect.truthy),
    test "several paired brackets"
      (fn _ => isBalanced "{}[]" |> Expect.truthy),
    test "paired and nested brackets"
      (fn _ => isBalanced "([{}({}[])])" |> Expect.truthy),
    test "unopened closing brackets"
      (fn _ => isBalanced "{[)][]}" |> Expect.falsy),
    test "unpaired and nested brackets"
      (fn _ => isBalanced "([{])" |> Expect.falsy),
    test "paired and wrong nested brackets"
      (fn _ => isBalanced "[({]})" |> Expect.falsy),
    test "paired and incomplete brackets"
      (fn _ => isBalanced "{}[" |> Expect.falsy),
    test "math expression"
      (fn _ => isBalanced "(((185 + 223.85) * 15) - 543)/2" |> Expect.truthy),
    test "complex latex expression"
      (fn _ => isBalanced "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)" |> Expect.truthy)
  ]

val _ = Test.run testsuite
