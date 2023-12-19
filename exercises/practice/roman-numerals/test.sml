(* version 1.1.0 *)

use "testlib.sml";
use "roman-numerals.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "roman-numerals" [
    test "1 is I"
      (fn _ => roman (1) |> Expect.equalTo "I"),

    test "2 is II"
      (fn _ => roman (2) |> Expect.equalTo "II"),

    test "3 is III"
      (fn _ => roman (3) |> Expect.equalTo "III"),

    test "4 is IV"
      (fn _ => roman (4) |> Expect.equalTo "IV"),

    test "5 is V"
      (fn _ => roman (5) |> Expect.equalTo "V"),

    test "6 is VI"
      (fn _ => roman (6) |> Expect.equalTo "VI"),

    test "9 is IX"
      (fn _ => roman (9) |> Expect.equalTo "IX"),

    test "16 is XVI"
      (fn _ => roman (16) |> Expect.equalTo "XVI"),

    test "27 is XXVII"
      (fn _ => roman (27) |> Expect.equalTo "XXVII"),

    test "48 is XLVIII"
      (fn _ => roman (48) |> Expect.equalTo "XLVIII"),

    test "49 is XLIX"
      (fn _ => roman (49) |> Expect.equalTo "XLIX"),

    test "59 is LIX"
      (fn _ => roman (59) |> Expect.equalTo "LIX"),

    test "66 is LXVI"
      (fn _ => roman (66) |> Expect.equalTo "LXVI"),

    test "93 is XCIII"
      (fn _ => roman (93) |> Expect.equalTo "XCIII"),

    test "141 is CXLI"
      (fn _ => roman (141) |> Expect.equalTo "CXLI"),

    test "163 is CLXIII"
      (fn _ => roman (163) |> Expect.equalTo "CLXIII"),

    test "166 is CLXVI"
      (fn _ => roman (166) |> Expect.equalTo "CLXVI"),

    test "402 is CDII"
      (fn _ => roman (402) |> Expect.equalTo "CDII"),

    test "575 is DLXXV"
      (fn _ => roman (575) |> Expect.equalTo "DLXXV"),

    test "666 is DCLXVI"
      (fn _ => roman (666) |> Expect.equalTo "DCLXVI"),

    test "911 is CMXI"
      (fn _ => roman (911) |> Expect.equalTo "CMXI"),

    test "1024 is MXXIV"
      (fn _ => roman (1024) |> Expect.equalTo "MXXIV"),

    test "1666 is MDCLXVI"
      (fn _ => roman (1666) |> Expect.equalTo "MDCLXVI"),

    test "3000 is MMM"
      (fn _ => roman (3000) |> Expect.equalTo "MMM"),

    test "3001 is MMMI"
      (fn _ => roman (3001) |> Expect.equalTo "MMMI"),

    test "3999 is MMMCMXCIX"
      (fn _ => roman (3999) |> Expect.equalTo "MMMCMXCIX")
  ]

val _ = Test.run testsuite