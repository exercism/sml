(* version 1.2.0 *)

use "atbash-cipher.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "atbash-cipher" [
    describe "encode" [
      test "encode yes"
        (fn _ => encode ("yes") |> Expect.equalTo "bvh"),

      test "encode no"
        (fn _ => encode ("no") |> Expect.equalTo "ml"),

      test "encode OMG"
        (fn _ => encode ("OMG") |> Expect.equalTo "lnt"),

      test "encode spaces"
        (fn _ => encode ("O M G") |> Expect.equalTo "lnt"),

      test "encode mindblowingly"
        (fn _ => encode ("mindblowingly") |> Expect.equalTo "nrmwy oldrm tob"),

      test "encode numbers"
        (fn _ => encode ("Testing,1 2 3, testing.") |> Expect.equalTo "gvhgr mt123 gvhgr mt"),

      test "encode deep thought"
        (fn _ => encode ("Truth is fiction.") |> Expect.equalTo "gifgs rhurx grlm"),

      test "encode all the letters"
        (fn _ => encode ("The quick brown fox jumps over the lazy dog.") |> Expect.equalTo "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
    ],

    describe "decode" [
      test "decode exercism"
        (fn _ => decode ("vcvix rhn") |> Expect.equalTo "exercism"),

      test "decode a sentence"
        (fn _ => decode ("zmlyh gzxov rhlug vmzhg vkkrm thglm v") |> Expect.equalTo "anobstacleisoftenasteppingstone"),

      test "decode numbers"
        (fn _ => decode ("gvhgr mt123 gvhgr mt") |> Expect.equalTo "testing123testing"),

      test "decode all the letters"
        (fn _ => decode ("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt") |> Expect.equalTo "thequickbrownfoxjumpsoverthelazydog"),

      test "decode with too many spaces"
        (fn _ => decode "vc vix    r hn" |> Expect.equalTo "exercism"),

      test "decode with no spaces"
        (fn _ => decode "zmlyhgzxovrhlugvmzhgvkkrmthglmv" |> Expect.equalTo "anobstacleisoftenasteppingstone")
    ]
  ]

val _ = Test.run testsuite
