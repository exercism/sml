(* version 2.0.0 *)

use "testlib.sml";
use "hamming.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "hamming" [
    test "empty strands"
      (fn _ => distance ("", "") |> Expect.equalTo 0),

    test "identical strands"
      (fn _ => distance ("A", "A") |> Expect.equalTo 0),

    test "long identical strands"
      (fn _ => distance ("GGACTGA", "GGACTGA") |> Expect.equalTo 0),

    test "complete distance in single nucleotide strands"
      (fn _ => distance ("A", "G") |> Expect.equalTo 1),

    test "complete distance in small strands"
      (fn _ => distance ("AG", "CT") |> Expect.equalTo 2),

    test "small distance in small strands"
      (fn _ => distance ("AT", "CT") |> Expect.equalTo 1),

    test "small distance"
      (fn _ => distance ("GGACG", "GGTCG") |> Expect.equalTo 1),

    test "small distance in long strands"
      (fn _ => distance ("ACCAGGG", "ACTATGG") |> Expect.equalTo 2),

    test "non-unique character in first strand"
      (fn _ => distance ("AGA", "AGG") |> Expect.equalTo 1),

    test "non-unique character in second strand"
      (fn _ => distance ("AGG", "AGA") |> Expect.equalTo 1),

    test "same nucleotides in different positions"
      (fn _ => distance ("TAG", "GAT") |> Expect.equalTo 2),

    test "large distance"
      (fn _ => distance ("GATACA", "GCATAA") |> Expect.equalTo 4),

    test "large distance in off-by-one strand"
      (fn _ => distance ("GGACGGATTCTG", "AGGACGGATTCT") |> Expect.equalTo 9),

    test "disallow first strand longer"
      (fn _ => (fn _ => distance ("AATG", "AAA")) |> Expect.error NonEqualLengthStringsFound),

    test "disallow second strand longer"
      (fn _ => (fn _ => distance ("ATA", "AGTG")) |> Expect.error NonEqualLengthStringsFound)
  ]

val _ = Test.run testsuite
