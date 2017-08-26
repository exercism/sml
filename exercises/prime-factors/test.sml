(* version 1.0.0 *)

use "prime-factors.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "prime-factors" [
    describe "returns prime factors for the given input number" [
      test "no factors"
        (fn _ => factors (1) |> Expect.equalTo []),

      test "prime number"
        (fn _ => factors (2) |> Expect.equalTo [2]),

      test "square of a prime"
        (fn _ => factors (9) |> Expect.equalTo [3, 3]),

      test "cube of a prime"
        (fn _ => factors (8) |> Expect.equalTo [2, 2, 2]),

      test "product of primes and non-primes"
        (fn _ => factors (12) |> Expect.equalTo [2, 2, 3]),

      test "product of primes"
        (fn _ => factors (901255) |> Expect.equalTo [5, 17, 23, 461]),

      test "factors include a large prime"
        (fn _ => factors (93819012551) |> Expect.equalTo [11, 9539, 894119])
    ]
  ]

val _ = Test.run testsuite