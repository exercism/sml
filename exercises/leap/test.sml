(* version 1.0.0 *)

use "testlib.sml";
use "leap.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "leap" [
    test "year not divisible by 4: common year"
      (fn _ => leapYear (2015) |> Expect.falsy),

    test "year divisible by 4, not divisible by 100: leap year"
      (fn _ => leapYear (2016) |> Expect.truthy),

    test "year divisible by 100, not divisible by 400: common year"
      (fn _ => leapYear (2100) |> Expect.falsy),

    test "year divisible by 400: leap year"
      (fn _ => leapYear (2000) |> Expect.truthy)
  ]

val _ = Test.run testsuite