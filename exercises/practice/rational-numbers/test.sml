(* version 1.0.0 *)

use "testlib.sml";
use "rational-numbers.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "rational-numbers" [
    describe "Arithmetic" [
      describe "Addition" [
        test "Add two positive rational numbers"
          (fn _ => add ((1, 2), (2, 3)) |> Expect.equalTo (7, 6)),

        test "Add a positive rational number and a negative rational number"
          (fn _ => add ((1, 2), (~2, 3)) |> Expect.equalTo (~1, 6)),

        test "Add two negative rational numbers"
          (fn _ => add ((~1, 2), (~2, 3)) |> Expect.equalTo (~7, 6)),

        test "Add a rational number to its additive inverse"
          (fn _ => add ((1, 2), (~1, 2)) |> Expect.equalTo (0, 1))
      ],

      describe "Subtraction" [
        test "Subtract two positive rational numbers"
          (fn _ => sub ((1, 2), (2, 3)) |> Expect.equalTo (~1, 6)),

        test "Subtract a positive rational number and a negative rational number"
          (fn _ => sub ((1, 2), (~2, 3)) |> Expect.equalTo (7, 6)),

        test "Subtract two negative rational numbers"
          (fn _ => sub ((~1, 2), (~2, 3)) |> Expect.equalTo (1, 6)),

        test "Subtract a rational number from itself"
          (fn _ => sub ((1, 2), (1, 2)) |> Expect.equalTo (0, 1))
      ],

      describe "Multiplication" [
        test "Multiply two positive rational numbers"
          (fn _ => mul ((1, 2), (2, 3)) |> Expect.equalTo (1, 3)),

        test "Multiply a negative rational number by a positive rational number"
          (fn _ => mul ((~1, 2), (2, 3)) |> Expect.equalTo (~1, 3)),

        test "Multiply two negative rational numbers"
          (fn _ => mul ((~1, 2), (~2, 3)) |> Expect.equalTo (1, 3)),

        test "Multiply a rational number by its reciprocal"
          (fn _ => mul ((1, 2), (2, 1)) |> Expect.equalTo (1, 1)),

        test "Multiply a rational number by 1"
          (fn _ => mul ((1, 2), (1, 1)) |> Expect.equalTo (1, 2)),

        test "Multiply a rational number by 0"
          (fn _ => mul ((1, 2), (0, 1)) |> Expect.equalTo (0, 1))
      ],

      describe "Division" [
        test "Divide two positive rational numbers"
          (fn _ => divide ((1, 2), (2, 3)) |> Expect.equalTo (3, 4)),

        test "Divide a positive rational number by a negative rational number"
          (fn _ => divide ((1, 2), (~2, 3)) |> Expect.equalTo (~3, 4)),

        test "Divide two negative rational numbers"
          (fn _ => divide ((~1, 2), (~2, 3)) |> Expect.equalTo (3, 4)),

        test "Divide a rational number by 1"
          (fn _ => divide ((1, 2), (1, 1)) |> Expect.equalTo (1, 2))
      ]
    ],

    describe "Absolute value" [
      test "Absolute value of a positive rational number"
        (fn _ => abs (1, 2) |> Expect.equalTo (1, 2)),

      test "Absolute value of a positive rational number with negative numerator and denominator"
        (fn _ => abs (~1, ~2) |> Expect.equalTo (1, 2)),

      test "Absolute value of a negative rational number"
        (fn _ => abs (~1, 2) |> Expect.equalTo (1, 2)),

      test "Absolute value of a negative rational number with negative denominator"
        (fn _ => abs (1, ~2) |> Expect.equalTo (1, 2)),

      test "Absolute value of zero"
        (fn _ => abs (0, 1) |> Expect.equalTo (0, 1)),

      test "Absolute value of a rational number is reduced to lowest terms"
        (fn _ => abs (2, 4) |> Expect.equalTo (1, 2))
    ],

    describe "Exponentiation of a rational number" [
      test "Raise a positive rational number to a positive integer power"
        (fn _ => exprational ((1, 2), 3) |> Expect.equalTo (1, 8)),

      test "Raise a negative rational number to a positive integer power"
        (fn _ => exprational ((~1, 2), 3) |> Expect.equalTo (~1, 8)),

      test "Raise a positive rational number to a negative integer power"
        (fn _ => exprational ((3, 5), ~2) |> Expect.equalTo (25, 9)),

      test "Raise a negative rational number to an even negative integer power"
        (fn _ => exprational ((~3, 5), ~2) |> Expect.equalTo (25, 9)),

      test "Raise a negative rational number to an odd negative integer power"
        (fn _ => exprational ((~3, 5), ~3) |> Expect.equalTo (~125, 27)),

      test "Raise zero to an integer power"
        (fn _ => exprational ((0, 1), 5) |> Expect.equalTo (0, 1)),

      test "Raise one to an integer power"
        (fn _ => exprational ((1, 1), 4) |> Expect.equalTo (1, 1)),

      test "Raise a positive rational number to the power of zero"
        (fn _ => exprational ((1, 2), 0) |> Expect.equalTo (1, 1)),

      test "Raise a negative rational number to the power of zero"
        (fn _ => exprational ((~1, 2), 0) |> Expect.equalTo (1, 1))
    ],

    describe "Exponentiation of a real number to a rational number" [
      test "Raise a real number to a positive rational number"
        (fn _ => expreal (8, (4, 3)) |> Expect.nearTo 1e~6 16.0),

      test "Raise a real number to a negative rational number"
        (fn _ => expreal (9, (~1, 2)) |> Expect.nearTo 1e~6 0.3333333333333333),

      test "Raise a real number to a zero rational number"
        (fn _ => expreal (2, (0, 1)) |> Expect.nearTo 1e~6 1.0)
    ],

    describe "Reduction to lowest terms" [
      test "Reduce a positive rational number to lowest terms"
        (fn _ => reduce (2, 4) |> Expect.equalTo (1, 2)),

      test "Reduce places the minus sign on the numerator"
        (fn _ => reduce (3, ~4) |> Expect.equalTo (~3, 4)),

      test "Reduce a negative rational number to lowest terms"
        (fn _ => reduce (~4, 6) |> Expect.equalTo (~2, 3)),

      test "Reduce a rational number with a negative denominator to lowest terms"
        (fn _ => reduce (3, ~9) |> Expect.equalTo (~1, 3)),

      test "Reduce zero to lowest terms"
        (fn _ => reduce (0, 6) |> Expect.equalTo (0, 1)),

      test "Reduce an integer to lowest terms"
        (fn _ => reduce (~14, 7) |> Expect.equalTo (~2, 1)),

      test "Reduce one to lowest terms"
        (fn _ => reduce (13, 13) |> Expect.equalTo (1, 1))
    ]
  ]

val _ = Test.run testsuite
