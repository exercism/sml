(* version 1.0.0 *)

use "testlib.sml";
use "nucleotide-count.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "nucleotide-count" [
    test "empty strand"
      (fn _ => nucleotideCounts "" |> Expect.equalTo {a = 0, c = 0, g = 0, t = 0}),

    test "can count one nucleotide in single-character input"
      (fn _ => nucleotideCounts "G" |> Expect.equalTo {a = 0, c = 0, g = 1, t = 0}),

    test "strand with repeated nucleotide"
      (fn _ => nucleotideCounts "GGGGGGG" |> Expect.equalTo {a = 0, c = 0, g = 7, t = 0}),

    test "strand with multiple nucleotides"
      (fn _ => nucleotideCounts "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC" |> Expect.equalTo {a = 20, c = 12, g = 17, t = 21}),

    test "strand with invalid nucleotides"
      (fn _ => (fn _ => nucleotideCounts "AGXXACT") |> Expect.error (Fail "Invalid nucleotide in strand"))
  ]

val _ = Test.run testsuite
