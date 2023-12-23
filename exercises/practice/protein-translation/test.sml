(* version 1.0.0 *)

use "testlib.sml";
use "protein-translation.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "protein-translation" [
    test "Empty RNA sequence results in no proteins"
      (fn _ => proteins "" |> Expect.equalTo []),

    test "Methionine RNA sequence"
      (fn _ => proteins "AUG" |> Expect.equalTo ["Methionine"]),

    test "Phenylalanine RNA sequence 1"
      (fn _ => proteins "UUU" |> Expect.equalTo ["Phenylalanine"]),

    test "Phenylalanine RNA sequence 2"
      (fn _ => proteins "UUC" |> Expect.equalTo ["Phenylalanine"]),

    test "Leucine RNA sequence 1"
      (fn _ => proteins "UUA" |> Expect.equalTo ["Leucine"]),

    test "Leucine RNA sequence 2"
      (fn _ => proteins "UUG" |> Expect.equalTo ["Leucine"]),

    test "Serine RNA sequence 1"
      (fn _ => proteins "UCU" |> Expect.equalTo ["Serine"]),

    test "Serine RNA sequence 2"
      (fn _ => proteins "UCC" |> Expect.equalTo ["Serine"]),

    test "Serine RNA sequence 3"
      (fn _ => proteins "UCA" |> Expect.equalTo ["Serine"]),

    test "Serine RNA sequence 4"
      (fn _ => proteins "UCG" |> Expect.equalTo ["Serine"]),

    test "Tyrosine RNA sequence 1"
      (fn _ => proteins "UAU" |> Expect.equalTo ["Tyrosine"]),

    test "Tyrosine RNA sequence 2"
      (fn _ => proteins "UAC" |> Expect.equalTo ["Tyrosine"]),

    test "Cysteine RNA sequence 1"
      (fn _ => proteins "UGU" |> Expect.equalTo ["Cysteine"]),

    test "Cysteine RNA sequence 2"
      (fn _ => proteins "UGC" |> Expect.equalTo ["Cysteine"]),

    test "Tryptophan RNA sequence"
      (fn _ => proteins "UGG" |> Expect.equalTo ["Tryptophan"]),

    test "STOP codon RNA sequence 1"
      (fn _ => proteins "UAA" |> Expect.equalTo []),

    test "STOP codon RNA sequence 2"
      (fn _ => proteins "UAG" |> Expect.equalTo []),

    test "STOP codon RNA sequence 3"
      (fn _ => proteins "UGA" |> Expect.equalTo []),

    test "Sequence of two protein codons translates into proteins"
      (fn _ => proteins "UUUUUU" |> Expect.equalTo ["Phenylalanine", "Phenylalanine"]),

    test "Sequence of two different protein codons translates into proteins"
      (fn _ => proteins "UUAUUG" |> Expect.equalTo ["Leucine", "Leucine"]),

    test "Translate RNA strand into correct protein list"
      (fn _ => proteins "AUGUUUUGG" |> Expect.equalTo ["Methionine", "Phenylalanine", "Tryptophan"]),

    test "Translation stops if STOP codon at beginning of sequence"
      (fn _ => proteins "UAGUGG" |> Expect.equalTo []),

    test "Translation stops if STOP codon at end of two-codon sequence"
      (fn _ => proteins "UGGUAG" |> Expect.equalTo ["Tryptophan"]),

    test "Translation stops if STOP codon at end of three-codon sequence"
      (fn _ => proteins "AUGUUUUAA" |> Expect.equalTo ["Methionine", "Phenylalanine"]),

    test "Translation stops if STOP codon in middle of three-codon sequence"
      (fn _ => proteins "UGGUAGUGG" |> Expect.equalTo ["Tryptophan"]),

    test "Translation stops if STOP codon in middle of six-codon sequence"
      (fn _ => proteins "UGGUGUUAUUAAUGGUUU" |> Expect.equalTo ["Tryptophan", "Cysteine", "Tyrosine"]),

    test "Non-existing codon can't translate"
      (fn _ => (fn _ => proteins "AAA") |> Expect.error (Fail "Invalid codon")),

    test "Unknown amino acids, not part of a codon, can't translate"
      (fn _ => (fn _ => proteins "XYZ") |> Expect.error (Fail "Invalid codon")),

    test "Incomplete RNA sequence can't translate"
      (fn _ => (fn _ => proteins "AUGU") |> Expect.error (Fail "Invalid codon")),

    test "Incomplete RNA sequence can translate if valid until a STOP codon"
      (fn _ => proteins "UUCUUCUAAUGGU" |> Expect.equalTo ["Phenylalanine", "Phenylalanine"])
  ]

val _ = Test.run testsuite
