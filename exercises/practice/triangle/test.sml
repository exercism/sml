use "testlib.sml";
use "triangle.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "triangle" [
    describe "equilateral triangle" [
      test "all sides are equal"
        (fn _ => equilateral [2.0, 2.0, 2.0] |> Expect.equalTo true),

      test "any side is unequal"
        (fn _ => equilateral [2.0, 3.0, 2.0] |> Expect.equalTo false),

      test "no sides are equal"
        (fn _ => equilateral [5.0, 4.0, 6.0] |> Expect.equalTo false),

      test "all zero sides is not a triangle"
        (fn _ => equilateral [0.0, 0.0, 0.0] |> Expect.equalTo false),

      test "sides may be floats"
        (fn _ => equilateral [0.5, 0.5, 0.5] |> Expect.equalTo true)
    ],

    describe "isosceles triangle" [
      test "last two sides are equal"
        (fn _ => isosceles [3.0, 4.0, 4.0] |> Expect.equalTo true),

      test "first two sides are equal"
        (fn _ => isosceles [4.0, 4.0, 3.0] |> Expect.equalTo true),

      test "first and last sides are equal"
        (fn _ => isosceles [4.0, 3.0, 4.0] |> Expect.equalTo true),

      test "equilateral triangles are also isosceles"
        (fn _ => isosceles [4.0, 4.0, 4.0] |> Expect.equalTo true),

      test "no sides are equal"
        (fn _ => isosceles [2.0, 3.0, 4.0] |> Expect.equalTo false),

      test "first triangle inequality violation"
        (fn _ => isosceles [1.0, 1.0, 3.0] |> Expect.equalTo false),

      test "second triangle inequality violation"
        (fn _ => isosceles [1.0, 3.0, 1.0] |> Expect.equalTo false),

      test "third triangle inequality violation"
        (fn _ => isosceles [3.0, 1.0, 1.0] |> Expect.equalTo false),

      test "sides may be floats"
        (fn _ => isosceles [0.5, 0.4, 0.5] |> Expect.equalTo true)
    ],

    describe "scalene triangle" [
      test "no sides are equal"
        (fn _ => scalene [5.0, 4.0, 6.0] |> Expect.equalTo true),

      test "all sides are equal"
        (fn _ => scalene [4.0, 4.0, 4.0] |> Expect.equalTo false),

      test "first and second sides are equal"
        (fn _ => scalene [4.0, 4.0, 3.0] |> Expect.equalTo false),

      test "first and third sides are equal"
        (fn _ => scalene [3.0, 4.0, 3.0] |> Expect.equalTo false),

      test "second and third sides are equal"
        (fn _ => scalene [4.0, 3.0, 3.0] |> Expect.equalTo false),

      test "may not violate triangle inequality"
        (fn _ => scalene [7.0, 3.0, 2.0] |> Expect.equalTo false),

      test "sides may be floats"
        (fn _ => scalene [0.5, 0.4, 0.6] |> Expect.equalTo true)
    ]
  ]

val _ = Test.run testsuite
