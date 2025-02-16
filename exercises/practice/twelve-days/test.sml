(* version 1.0.0 *)

use "testlib.sml";
use "twelve-days.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "twelve-days" [
    describe "verse" [
      test "first day a partridge in a pear tree"
        (fn _ => let
          val expected =
            "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
        in
          recite (1, 1) |> Expect.equalTo expected
        end),

      test "second day two turtle doves"
        (fn _ => let
          val expected =
            "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (2, 2) |> Expect.equalTo expected
        end),

      test "third day three french hens"
        (fn _ => let
          val expected =
            "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (3, 3) |> Expect.equalTo expected
        end),

      test "fourth day four calling birds"
        (fn _ => let
          val expected =
            "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (4, 4) |> Expect.equalTo expected
        end),

      test "fifth day five gold rings"
        (fn _ => let
          val expected =
            "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (5, 5) |> Expect.equalTo expected
        end),

      test "sixth day six geese-a-laying"
        (fn _ => let
          val expected =
            "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (6, 6) |> Expect.equalTo expected
        end),

      test "seventh day seven swans-a-swimming"
        (fn _ => let
          val expected =
            "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (7, 7) |> Expect.equalTo expected
        end),

      test "eighth day eight maids-a-milking"
        (fn _ => let
          val expected =
            "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (8, 8) |> Expect.equalTo expected
        end),

      test "ninth day nine ladies dancing"
        (fn _ => let
          val expected =
            "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (9, 9) |> Expect.equalTo expected
        end),

      test "tenth day ten lords-a-leaping"
        (fn _ => let
          val expected =
            "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (10, 10) |> Expect.equalTo expected
        end),

      test "eleventh day eleven pipers piping"
        (fn _ => let
          val expected =
            "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (11, 11) |> Expect.equalTo expected
        end),

      test "twelfth day twelve drummers drumming"
        (fn _ => let
          val expected =
            "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (12, 12) |> Expect.equalTo expected
        end)
    ],

    describe "lyrics" [
      test "recites first three verses of the song"
        (fn _ => let
          val expected =
            "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.\n\
            \On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (1, 3) |> Expect.equalTo expected
        end),

      test "recites three verses from the middle of the song"
        (fn _ => let
          val expected =
            "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (4, 6) |> Expect.equalTo expected
        end),

      test "recites the whole song"
        (fn _ => let
          val expected =
            "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.\n\
            \On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n\
            \On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
        in
          recite (1, 12) |> Expect.equalTo expected
        end)
    ]
  ]

val _ = Test.run testsuite
