use "testlib.sml";
use "pop-count.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "pop-count" [
    test "0 eggs"
      (fn _ => eggCount 0 |> Expect.equalTo 0),

    test "1 egg"
      (fn _ => eggCount 16 |> Expect.equalTo 1),

    test "4 eggs"
      (fn _ => eggCount 89 |> Expect.equalTo 4),

    test "13 eggs"
      (fn _ => eggCount 2000000000 |> Expect.equalTo 13)
  ]

val _ = Test.run testsuite