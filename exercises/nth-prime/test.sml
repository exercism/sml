(* version 1.0.0 *)

use "testlib.sml";
use "nth-prime.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "nth-prime" [
    test "first prime"
      (fn _ => nthPrime 1 |> Expect.equalTo (SOME 2)),

    test "second prime"
      (fn _ => nthPrime 2 |> Expect.equalTo (SOME 3)),

    test "sixth prime"
      (fn _ => nthPrime 6 |> Expect.equalTo (SOME 13)),

    test "big prime"
      (fn _ => nthPrime 10001 |> Expect.equalTo (SOME 104743)),

    test "there is no zeroth prime"
      (fn _ => nthPrime 0 |> Expect.equalTo NONE)
  ]

val _ = Test.run testsuite
