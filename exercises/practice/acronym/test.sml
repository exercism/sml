use "testlib.sml";
use "acronym.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "acronym" [
    test "basic"
      (fn _ => abbreviate "Portable Network Graphics" |> Expect.equalTo "PNG"),

    test "lowercase words"
      (fn _ => abbreviate "Ruby on Rails" |> Expect.equalTo "ROR"),

    test "punctuation"
      (fn _ => abbreviate "First In, First Out" |> Expect.equalTo "FIFO"),

    test "all caps word"
      (fn _ => abbreviate "GNU Image Manipulation Program" |> Expect.equalTo "GIMP"),

    test "punctuation without whitespace"
      (fn _ => abbreviate "Complementary metal-oxide semiconductor" |> Expect.equalTo "CMOS"),

    test "very long abbreviation"
      (fn _ => abbreviate "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me" |> Expect.equalTo "ROTFLSHTMDCOALM"),

    test "consecutive delimiters"
      (fn _ => abbreviate "Something - I made up from thin air" |> Expect.equalTo "SIMUFTA"),

    test "apostrophes"
      (fn _ => abbreviate "Halley's Comet" |> Expect.equalTo "HC"),

    test "underscore emphasis"
      (fn _ => abbreviate "The Road _Not_ Taken" |> Expect.equalTo "TRNT")
  ]

val _ = Test.run testsuite