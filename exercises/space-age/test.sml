(* version 1.0.0 *)

use "testlib.sml";
use "space-age.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "age_on" [
    test "age on Earth"
      (fn _ => age_on Earth 1000000000 |> Expect.nearTo 0.005 31.69),
    test "age on Mercury"
      (fn _ => age_on Mercury 2134835688 |> Expect.nearTo 0.005 280.88),
    test "age on Venus"
      (fn _ => age_on Venus 189839836 |> Expect.nearTo 0.005 9.78),
    test "age on Mars"
      (fn _ => age_on Mars 2329871239 |> Expect.nearTo 0.005 39.25),
    test "age on Jupiter"
      (fn _ => age_on Jupiter 901876382 |> Expect.nearTo 0.005 2.41),
    test "age on Saturn"
      (fn _ => age_on Saturn 3000000000 |> Expect.nearTo 0.005 3.23),
    test "age on Uranus"
      (fn _ => age_on Uranus 3210123456 |> Expect.nearTo 0.005 1.21),
    test "age on Neptune"
      (fn _ => age_on Neptune 8210123456 |> Expect.nearTo 0.005 1.58)
  ]

val _ = Test.run testsuite
