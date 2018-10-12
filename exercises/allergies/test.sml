(* version 1.0.0 *)

use "testlib.sml";
use "allergies.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "allergies" [
    describe "allergicTo" [
      describe "no allergies means not allergic" [
        test "is not allergic to Peanuts"
          (fn _ => allergicTo 0 Peanuts |> Expect.falsy),

        test "is not allergic to Cats"
          (fn _ => allergicTo 0 Cats |> Expect.falsy),

        test "is not allergic to Strawberries"
          (fn _ => allergicTo 0 Strawberries |> Expect.falsy)
      ],

      test "is allergic to eggs"
        (fn _ => allergicTo 1 Eggs |> Expect.truthy),

      describe "allergic to eggs in addition to other stuff" [
        test "is allergic to Eggs"
          (fn _ => allergicTo 5 Eggs |> Expect.truthy),

        test "is allergic to Shellfish"
          (fn _ => allergicTo 5 Shellfish |> Expect.truthy),

        test "is allergic to Strawberries"
          (fn _ => allergicTo 5 Strawberries |> Expect.falsy)
      ]
    ],

    describe "allergies" [
      test "no allergies at all"
        (fn _ => allergies (0) |> Expect.equalTo []),

      test "allergic to just eggs"
        (fn _ => allergies (1) |> Expect.equalTo [Eggs]),

      test "allergic to just peanuts"
        (fn _ => allergies (2) |> Expect.equalTo [Peanuts]),

      test "allergic to just strawberries"
        (fn _ => allergies (8) |> Expect.equalTo [Strawberries]),

      test "allergic to eggs and peanuts"
        (fn _ => allergies (3) |> Expect.equalTo [Eggs, Peanuts]),

      test "allergic to more than eggs but not peanuts"
        (fn _ => allergies (5) |> Expect.equalTo [Eggs, Shellfish]),

      test "allergic to lots of stuff"
        (fn _ => allergies (248) |> Expect.equalTo [Strawberries, Tomatoes, Chocolate, Pollen, Cats]),

      test "allergic to everything"
        (fn _ => allergies (255) |> Expect.equalTo [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]),

      test "ignore non allergen score parts"
        (fn _ => allergies (509) |> Expect.equalTo [Eggs, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats])
    ]
  ]

val _ = Test.run testsuite
