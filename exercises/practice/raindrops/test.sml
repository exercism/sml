(* version 1.0.0 *)

use "testlib.sml";
use "raindrops.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "raindrops" [
    test "the sound for 1 is 1"
      (fn _ => convert (1) |> Expect.equalTo "1"),

    test "the sound for 3 is Pling"
      (fn _ => convert (3) |> Expect.equalTo "Pling"),

    test "the sound for 5 is Plang"
      (fn _ => convert (5) |> Expect.equalTo "Plang"),

    test "the sound for 7 is Plong"
      (fn _ => convert (7) |> Expect.equalTo "Plong"),

    test "the sound for 6 is Pling as it has a factor 3"
      (fn _ => convert (6) |> Expect.equalTo "Pling"),

    test "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base"
      (fn _ => convert (8) |> Expect.equalTo "8"),

    test "the sound for 9 is Pling as it has a factor 3"
      (fn _ => convert (9) |> Expect.equalTo "Pling"),

    test "the sound for 10 is Plang as it has a factor 5"
      (fn _ => convert (10) |> Expect.equalTo "Plang"),

    test "the sound for 14 is Plong as it has a factor of 7"
      (fn _ => convert (14) |> Expect.equalTo "Plong"),

    test "the sound for 15 is PlingPlang as it has factors 3 and 5"
      (fn _ => convert (15) |> Expect.equalTo "PlingPlang"),

    test "the sound for 21 is PlingPlong as it has factors 3 and 7"
      (fn _ => convert (21) |> Expect.equalTo "PlingPlong"),

    test "the sound for 25 is Plang as it has a factor 5"
      (fn _ => convert (25) |> Expect.equalTo "Plang"),

    test "the sound for 27 is Pling as it has a factor 3"
      (fn _ => convert (27) |> Expect.equalTo "Pling"),

    test "the sound for 35 is PlangPlong as it has factors 5 and 7"
      (fn _ => convert (35) |> Expect.equalTo "PlangPlong"),

    test "the sound for 49 is Plong as it has a factor 7"
      (fn _ => convert (49) |> Expect.equalTo "Plong"),

    test "the sound for 52 is 52"
      (fn _ => convert (52) |> Expect.equalTo "52"),

    test "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7"
      (fn _ => convert (105) |> Expect.equalTo "PlingPlangPlong"),

    test "the sound for 3125 is Plang as it has a factor 5"
      (fn _ => convert (3125) |> Expect.equalTo "Plang")
  ]

val _ = Test.run testsuite