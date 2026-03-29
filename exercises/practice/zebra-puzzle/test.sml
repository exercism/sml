(* version 1.0.0 *)

use "testlib.sml";
use "zebra-puzzle.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "zebra-puzzle" [
    test "resident who drinks water"
      (fn _ => drinksWater () |> Expect.equalTo Norwegian),

    test "resident who owns zebra"
      (fn _ => ownsZebra () |> Expect.equalTo Japanese)
  ]

val _ = Test.run testsuite
