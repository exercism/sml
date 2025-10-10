(* version 1.0.0 *)

use "testlib.sml";
use "line-up.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "line-up" [
    test "format smallest non-exceptional ordinal numeral 4"
      (fn _ => format "Gianna" 4 |> Expect.equalTo "Gianna, you are the 4th customer we serve today. Thank you!"),

    test "format greatest single digit non-exceptional ordinal numeral 9"
      (fn _ => format "Maarten" 9 |> Expect.equalTo "Maarten, you are the 9th customer we serve today. Thank you!"),

    test "format non-exceptional ordinal numeral 5"
      (fn _ => format "Petronila" 5 |> Expect.equalTo "Petronila, you are the 5th customer we serve today. Thank you!"),

    test "format non-exceptional ordinal numeral 6"
      (fn _ => format "Attakullakulla" 6 |> Expect.equalTo "Attakullakulla, you are the 6th customer we serve today. Thank you!"),

    test "format non-exceptional ordinal numeral 7"
      (fn _ => format "Kate" 7 |> Expect.equalTo "Kate, you are the 7th customer we serve today. Thank you!"),

    test "format non-exceptional ordinal numeral 8"
      (fn _ => format "Maximiliano" 8 |> Expect.equalTo "Maximiliano, you are the 8th customer we serve today. Thank you!"),

    test "format exceptional ordinal numeral 1"
      (fn _ => format "Mary" 1 |> Expect.equalTo "Mary, you are the 1st customer we serve today. Thank you!"),

    test "format exceptional ordinal numeral 2"
      (fn _ => format "Haruto" 2 |> Expect.equalTo "Haruto, you are the 2nd customer we serve today. Thank you!"),

    test "format exceptional ordinal numeral 3"
      (fn _ => format "Henriette" 3 |> Expect.equalTo "Henriette, you are the 3rd customer we serve today. Thank you!"),

    test "format smallest two digit non-exceptional ordinal numeral 10"
      (fn _ => format "Alvarez" 10 |> Expect.equalTo "Alvarez, you are the 10th customer we serve today. Thank you!"),

    test "format non-exceptional ordinal numeral 11"
      (fn _ => format "Jacqueline" 11 |> Expect.equalTo "Jacqueline, you are the 11th customer we serve today. Thank you!"),

    test "format non-exceptional ordinal numeral 12"
      (fn _ => format "Juan" 12 |> Expect.equalTo "Juan, you are the 12th customer we serve today. Thank you!"),

    test "format non-exceptional ordinal numeral 13"
      (fn _ => format "Patricia" 13 |> Expect.equalTo "Patricia, you are the 13th customer we serve today. Thank you!"),

    test "format exceptional ordinal numeral 21"
      (fn _ => format "Washi" 21 |> Expect.equalTo "Washi, you are the 21st customer we serve today. Thank you!"),

    test "format exceptional ordinal numeral 62"
      (fn _ => format "Nayra" 62 |> Expect.equalTo "Nayra, you are the 62nd customer we serve today. Thank you!"),

    test "format exceptional ordinal numeral 100"
      (fn _ => format "John" 100 |> Expect.equalTo "John, you are the 100th customer we serve today. Thank you!"),

    test "format exceptional ordinal numeral 101"
      (fn _ => format "Zeinab" 101 |> Expect.equalTo "Zeinab, you are the 101st customer we serve today. Thank you!"),

    test "format non-exceptional ordinal numeral 112"
      (fn _ => format "Knud" 112 |> Expect.equalTo "Knud, you are the 112th customer we serve today. Thank you!"),

    test "format exceptional ordinal numeral 123"
      (fn _ => format "Yma" 123 |> Expect.equalTo "Yma, you are the 123rd customer we serve today. Thank you!")
  ]

val _ = Test.run testsuite
