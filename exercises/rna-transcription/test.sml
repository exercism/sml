(* version 1.0.1 *)

use "testlib.sml";
use "rna-transcription.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "rna-transcription" [
    test "RNA complement of cytosine is guanine"
      (fn _ => toRna ("C") |> Expect.equalTo (SOME "G")),

    test "RNA complement of guanine is cytosine"
      (fn _ => toRna ("G") |> Expect.equalTo (SOME "C")),

    test "RNA complement of thymine is adenine"
      (fn _ => toRna ("T") |> Expect.equalTo (SOME "A")),

    test "RNA complement of adenine is uracil"
      (fn _ => toRna ("A") |> Expect.equalTo (SOME "U")),

    test "RNA complement"
      (fn _ => toRna ("ACGTGGTCTTAA") |> Expect.equalTo (SOME "UGCACCAGAAUU")),

    test "correctly handles invalid input (RNA instead of DNA)"
      (fn _ => toRna ("U") |> Expect.equalTo NONE),

    test "correctly handles completely invalid DNA input"
      (fn _ => toRna ("XXX") |> Expect.equalTo NONE),

    test "correctly handles partially invalid DNA input"
      (fn _ => toRna ("ACGTXXXCTTAA") |> Expect.equalTo NONE)
  ]

val _ = Test.run testsuite