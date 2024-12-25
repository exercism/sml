use "testlib.sml";
use "say.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "say" [
    test "zero"
      (fn _ => say 0 |> Expect.equalTo "zero"),

    test "one"
      (fn _ => say 1 |> Expect.equalTo "one"),

    test "fourteen"
      (fn _ => say 14 |> Expect.equalTo "fourteen"),

    test "twenty"
      (fn _ => say 20 |> Expect.equalTo "twenty"),

    test "twenty-two"
      (fn _ => say 22 |> Expect.equalTo "twenty-two"),

    test "thirty"
      (fn _ => say 30 |> Expect.equalTo "thirty"),

    test "ninety-nine"
      (fn _ => say 99 |> Expect.equalTo "ninety-nine"),

    test "one hundred"
      (fn _ => say 100 |> Expect.equalTo "one hundred"),

    test "one hundred twenty-three"
      (fn _ => say 123 |> Expect.equalTo "one hundred twenty-three"),

    test "two hundred"
      (fn _ => say 200 |> Expect.equalTo "two hundred"),

    test "nine hundred ninety-nine"
      (fn _ => say 999 |> Expect.equalTo "nine hundred ninety-nine"),

    test "one thousand"
      (fn _ => say 1000 |> Expect.equalTo "one thousand"),

    test "one thousand two hundred thirty-four"
      (fn _ => say 1234 |> Expect.equalTo "one thousand two hundred thirty-four"),

    test "one million"
      (fn _ => say 1000000 |> Expect.equalTo "one million"),

    test "one million two thousand three hundred forty-five"
      (fn _ => say 1002345 |> Expect.equalTo "one million two thousand three hundred forty-five"),

    test "one billion"
      (fn _ => say 1000000000 |> Expect.equalTo "one billion"),

    test "a big number"
      (fn _ => say 987654321123 |> Expect.equalTo "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three"),

    test "numbers below zero are out of range"
      (fn _ => (fn _ => say ~1) |> Expect.error (Fail "input out of range")),

    test "numbers above 999,999,999,999 are out of range"
      (fn _ => (fn _ => say 1000000000000) |> Expect.error (Fail "input out of range"))
  ]

val _ = Test.run testsuite