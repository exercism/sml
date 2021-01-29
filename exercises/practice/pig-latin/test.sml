(* version 1.1.0 *)

use "testlib.sml";
use "pig-latin.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "pig-latin" [
    describe "ay is added to words that start with vowels" [
      test "word beginning with a"
        (fn _ => translate ("apple") |> Expect.equalTo "appleay"),

      test "word beginning with e"
        (fn _ => translate ("ear") |> Expect.equalTo "earay"),

      test "word beginning with i"
        (fn _ => translate ("igloo") |> Expect.equalTo "iglooay"),

      test "word beginning with o"
        (fn _ => translate ("object") |> Expect.equalTo "objectay"),

      test "word beginning with u"
        (fn _ => translate ("under") |> Expect.equalTo "underay"),

      test "word beginning with a vowel and followed by a qu"
        (fn _ => translate ("equal") |> Expect.equalTo "equalay")
    ],

    describe "first letter and ay are moved to the end of words that start with consonants" [
      test "word beginning with p"
        (fn _ => translate ("pig") |> Expect.equalTo "igpay"),

      test "word beginning with k"
        (fn _ => translate ("koala") |> Expect.equalTo "oalakay"),

      test "word beginning with x"
        (fn _ => translate ("xenon") |> Expect.equalTo "enonxay"),

      test "word beginning with q without a following u"
        (fn _ => translate ("qat") |> Expect.equalTo "atqay")
    ],

    describe "some letter clusters are treated like a single consonant" [
      test "word beginning with ch"
        (fn _ => translate ("chair") |> Expect.equalTo "airchay"),

      test "word beginning with qu"
        (fn _ => translate ("queen") |> Expect.equalTo "eenquay"),

      test "word beginning with qu and a preceding consonant"
        (fn _ => translate ("square") |> Expect.equalTo "aresquay"),

      test "word beginning with th"
        (fn _ => translate ("therapy") |> Expect.equalTo "erapythay"),

      test "word beginning with thr"
        (fn _ => translate ("thrush") |> Expect.equalTo "ushthray"),

      test "word beginning with sch"
        (fn _ => translate ("school") |> Expect.equalTo "oolschay")
    ],

    describe "some letter clusters are treated like a single vowel" [
      test "word beginning with yt"
        (fn _ => translate ("yttria") |> Expect.equalTo "yttriaay"),

      test "word beginning with xr"
        (fn _ => translate ("xray") |> Expect.equalTo "xrayay")
    ],

    describe "position of y in a word determines if it is a consonant or a vowel" [
      test "y is treated like a consonant at the beginning of a word"
        (fn _ => translate ("yellow") |> Expect.equalTo "ellowyay"),

      test "y is treated like a vowel at the end of a consonant cluster"
        (fn _ => translate ("rhythm") |> Expect.equalTo "ythmrhay"),

      test "y as second letter in two letter word"
        (fn _ => translate ("my") |> Expect.equalTo "ymay")
    ],

    describe "phrases are translated" [
      test "a whole phrase"
        (fn _ => translate ("quick fast run") |> Expect.equalTo "ickquay astfay unray")
    ]
  ]

val _ = Test.run testsuite