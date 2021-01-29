(* version 1.0.0 *)

use "testlib.sml";
use "roman-numerals.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "roman-numerals" [
    test "1 is a single I"
      (fn _ => roman (1) |> Expect.equalTo "I"),

    test "2 is two I's"
      (fn _ => roman (2) |> Expect.equalTo "II"),

    test "3 is three I's"
      (fn _ => roman (3) |> Expect.equalTo "III"),

    test "4, being 5 - 1, is IV"
      (fn _ => roman (4) |> Expect.equalTo "IV"),

    test "5 is a single V"
      (fn _ => roman (5) |> Expect.equalTo "V"),

    test "6, being 5 + 1, is VI"
      (fn _ => roman (6) |> Expect.equalTo "VI"),

    test "9, being 10 - 1, is IX"
      (fn _ => roman (9) |> Expect.equalTo "IX"),

    test "20 is two X's"
      (fn _ => roman (27) |> Expect.equalTo "XXVII"),

    test "48 is not 50 - 2 but rather 40 + 8"
      (fn _ => roman (48) |> Expect.equalTo "XLVIII"),

    test "50 is a single L"
      (fn _ => roman (59) |> Expect.equalTo "LIX"),

    test "90, being 100 - 10, is XC"
      (fn _ => roman (93) |> Expect.equalTo "XCIII"),

    test "100 is a single C"
      (fn _ => roman (141) |> Expect.equalTo "CXLI"),

    test "60, being 50 + 10, is LX"
      (fn _ => roman (163) |> Expect.equalTo "CLXIII"),

    test "400, being 500 - 100, is CD"
      (fn _ => roman (402) |> Expect.equalTo "CDII"),

    test "500 is a single D"
      (fn _ => roman (575) |> Expect.equalTo "DLXXV"),

    test "900, being 1000 - 100, is CM"
      (fn _ => roman (911) |> Expect.equalTo "CMXI"),

    test "1000 is a single M"
      (fn _ => roman (1024) |> Expect.equalTo "MXXIV"),

    test "3000 is three M's"
      (fn _ => roman (3000) |> Expect.equalTo "MMM")
  ]

val _ = Test.run testsuite