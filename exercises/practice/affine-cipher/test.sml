use "testlib.sml";
use "affine-cipher.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "affine-cipher" [
    describe "encode" [
      test "encode yes"
        (fn _ => encode ({a = 5, b = 7}, "yes") |> Expect.equalTo "xbt"),

      test "encode no"
        (fn _ => encode ({a = 15, b = 18}, "no") |> Expect.equalTo "fu"),

      test "encode OMG"
        (fn _ => encode ({a = 21, b = 3}, "OMG") |> Expect.equalTo "lvz"),

      test "encode O M G"
        (fn _ => encode ({a = 25, b = 47}, "O M G") |> Expect.equalTo "hjp"),

      test "encode mindblowingly"
        (fn _ => encode ({a = 11, b = 15}, "mindblowingly") |> Expect.equalTo "rzcwa gnxzc dgt"),

      test "encode numbers"
        (fn _ => encode ({a = 3, b = 4}, "Testing,1 2 3, testing.") |> Expect.equalTo "jqgjc rw123 jqgjc rw"),

      test "encode deep thought"
        (fn _ => encode ({a = 5, b = 17}, "Truth is fiction.") |> Expect.equalTo "iynia fdqfb ifje"),

      test "encode all the letters"
        (fn _ => encode ({a = 17, b = 33}, "The quick brown fox jumps over the lazy dog.") |> Expect.equalTo "swxtj npvyk lruol iejdc blaxk swxmh qzglf"),

      test "encode with a not coprime to m"
        (fn _ => (fn _ => encode ({a = 6, b = 17}, "This is a test.")) |> Expect.error (Fail "a and m must be coprime."))
    ],

    describe "decode" [
      test "decode exercism"
        (fn _ => decode ({a = 3, b = 7}, "tytgn fjr") |> Expect.equalTo "exercism"),

      test "decode a sentence"
        (fn _ => decode ({a = 19, b = 16}, "qdwju nqcro muwhn odqun oppmd aunwd o") |> Expect.equalTo "anobstacleisoftenasteppingstone"),

      test "decode numbers"
        (fn _ => decode ({a = 25, b = 7}, "odpoz ub123 odpoz ub") |> Expect.equalTo "testing123testing"),

      test "decode all the letters"
        (fn _ => decode ({a = 17, b = 33}, "swxtj npvyk lruol iejdc blaxk swxmh qzglf") |> Expect.equalTo "thequickbrownfoxjumpsoverthelazydog"),

      test "decode with no spaces in input"
        (fn _ => decode ({a = 17, b = 33}, "swxtjnpvyklruoliejdcblaxkswxmhqzglf") |> Expect.equalTo "thequickbrownfoxjumpsoverthelazydog"),

      test "decode with too many spaces"
        (fn _ => decode ({a = 15, b = 16}, "vszzm    cly   yd cg    qdp") |> Expect.equalTo "jollygreengiant"),

      test "decode with a not coprime to m"
        (fn _ => (fn _ => decode ({a = 13, b = 5}, "Test")) |> Expect.error (Fail "a and m must be coprime."))
    ]
  ]

val _ = Test.run testsuite