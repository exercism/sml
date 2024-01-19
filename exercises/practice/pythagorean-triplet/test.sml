(* version 1.0.0 *)

use "testlib.sml";
use "pythagorean-triplet.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "pythagorean-triplet" [
    test "triplets whose sum is 12"
      (fn _ => tripletsWithSum 12 |> Expect.equalTo [(3, 4, 5)]),

    test "triplets whose sum is 108"
      (fn _ => tripletsWithSum 108 |> Expect.equalTo [(27, 36, 45)]),

    test "triplets whose sum is 1000"
      (fn _ => tripletsWithSum 1000 |> Expect.equalTo [(200, 375, 425)]),

    test "no matching triplets for 1001"
      (fn _ => tripletsWithSum 1001 |> Expect.equalTo []),

    test "returns all matching triplets"
      (fn _ => tripletsWithSum 90 |> Expect.equalTo [(9, 40, 41), (15, 36, 39)]),

    test "several matching triplets"
      (fn _ => tripletsWithSum 840 |> Expect.equalTo [(40, 399, 401), (56, 390, 394), (105, 360, 375), (120, 350, 370), (140, 336, 364), (168, 315, 357), (210, 280, 350), (240, 252, 348)]),

    test "triplets for large number"
      (fn _ => tripletsWithSum 30000 |> Expect.equalTo [(1200, 14375, 14425), (1875, 14000, 14125), (5000, 12000, 13000), (6000, 11250, 12750), (7500, 10000, 12500)])
  ]

val _ = Test.run testsuite
