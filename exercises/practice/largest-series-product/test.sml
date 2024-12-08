use "testlib.sml";
use "largest-series-product.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "largest-series-product" [
    test "finds the largest product if span equals length"
      (fn _ => largestProduct ("29", 2) |> Expect.equalTo 18),

    test "can find the largest product of 2 with numbers in order"
      (fn _ => largestProduct ("0123456789", 2) |> Expect.equalTo 72),

    test "can find the largest product of 2"
      (fn _ => largestProduct ("576802143", 2) |> Expect.equalTo 48),

    test "can find the largest product of 3 with numbers in order"
      (fn _ => largestProduct ("0123456789", 3) |> Expect.equalTo 504),

    test "can find the largest product of 3"
      (fn _ => largestProduct ("1027839564", 3) |> Expect.equalTo 270),

    test "can find the largest product of 5 with numbers in order"
      (fn _ => largestProduct ("0123456789", 5) |> Expect.equalTo 15120),

    test "can get the largest product of a big number"
      (fn _ => largestProduct ("73167176531330624919225119674426574742355349194934", 6) |> Expect.equalTo 23520),

    test "reports zero if the only digits are zero"
      (fn _ => largestProduct ("0000", 2) |> Expect.equalTo 0),

    test "reports zero if all spans include zero"
      (fn _ => largestProduct ("99099", 3) |> Expect.equalTo 0),

    test "rejects span longer than string length"
      (fn _ => (fn _ => largestProduct ("123", 4)) |> Expect.error (Fail "span must be smaller than string length")),

    test "reports 1 for empty string and empty product (0 span)"
      (fn _ => largestProduct ("", 0) |> Expect.equalTo 1),

    test "reports 1 for nonempty string and empty product (0 span)"
      (fn _ => largestProduct ("123", 0) |> Expect.equalTo 1),

    test "rejects empty string and nonzero span"
      (fn _ => (fn _ => largestProduct ("", 1)) |> Expect.error (Fail "span must be smaller than string length")),

    test "rejects invalid character in digits"
      (fn _ => (fn _ => largestProduct ("1234a5", 2)) |> Expect.error (Fail "digits input must only contain digits")),

    test "rejects negative span"
      (fn _ => (fn _ => largestProduct ("12345", ~1)) |> Expect.error (Fail "span must not be negative"))
  ]

val _ = Test.run testsuite
