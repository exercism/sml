(* version 1.0.0 *)

use "testlib.sml";
use "example.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "allergies" [
    describe "allergicTo" [
      describe "no allergies means not allergic" [
        test "is not allergic to Peanuts"
          (fn _ => allergicTo 0 Peanuts |> Expect.equalTo false),

        test "is not allergic to Cats"
          (fn _ => allergicTo 0 Cats |> Expect.equalTo false),

        test "is not allergic to Strawberries"
          (fn _ => allergicTo 0 Strawberries |> Expect.equalTo false)
      ],

      test "is allergic to eggs"
        (fn _ => allergicTo 1 Eggs |> Expect.equalTo true),

      describe "allergic to eggs in addition to other stuff" [
        test "is allergic to Eggs"
          (fn _ => allergicTo 5 Eggs |> Expect.equalTo true),

        test "is allergic to Shellfish"
          (fn _ => allergicTo 5 Shellfish |> Expect.equalTo true),

        test "is allergic to Strawberries"
          (fn _ => allergicTo 5 Strawberries |> Expect.equalTo false)
      ]
    ],

    describe "list" [
      test "no allergies at all"
        (fn _ => list (0) |> Expect.equalTo []),

      test "allergic to just eggs"
        (fn _ => list (1) |> Expect.equalTo [Eggs]),

      test "allergic to just peanuts"
        (fn _ => list (2) |> Expect.equalTo [Peanuts]),

      test "allergic to just strawberries"
        (fn _ => list (8) |> Expect.equalTo [Strawberries]),

      test "allergic to eggs and peanuts"
        (fn _ => list (3) |> Expect.equalTo [Eggs, Peanuts]),

      test "allergic to more than eggs but not peanuts"
        (fn _ => list (5) |> Expect.equalTo [Eggs, Shellfish]),

      test "allergic to lots of stuff"
        (fn _ => list (248) |> Expect.equalTo [Strawberries, Tomatoes, Chocolate, Pollen, Cats]),

      test "allergic to everything"
        (fn _ => list (255) |> Expect.equalTo [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]),

      test "ignore non allergen score parts"
        (fn _ => list (509) |> Expect.equalTo [Eggs, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats])
    ]
  ]

val _ = Test.run testsuite