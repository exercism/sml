(* version 1.0.0 *)

use "testlib.sml";
use "kindergarten-garden.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "kindergarten-garden" [
    describe "partial garden" [
      test "garden with single student"
        (fn _ => let
          val diagram = "RC\nGG"
          val student = "Alice"
          val expected = ["radishes", "clover", "grass", "grass"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "different garden with single student"
        (fn _ => let
          val diagram = "VC\nRC"
          val student = "Alice"
          val expected = ["violets", "clover", "radishes", "clover"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "garden with two students"
        (fn _ => let
          val diagram = "VVCG\nVVRC"
          val student = "Bob"
          val expected = ["clover", "grass", "radishes", "clover"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      describe "multiple students for the same garden with three students" [
        test "second student's garden"
          (fn _ => let
            val diagram = "VVCCGG\nVVCCGG"
            val student = "Bob"
            val expected = ["clover", "clover", "clover", "clover"]
          in
            plants diagram student |> Expect.equalTo expected
          end),

        test "third student's garden"
          (fn _ => let
            val diagram = "VVCCGG\nVVCCGG"
            val student = "Charlie"
            val expected = ["grass", "grass", "grass", "grass"]
          in
            plants diagram student |> Expect.equalTo expected
          end)
      ]
    ],

    describe "full garden" [
      test "for Alice, first student's garden"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Alice"
          val expected = ["violets", "radishes", "violets", "radishes"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Bob, second student's garden"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Bob"
          val expected = ["clover", "grass", "clover", "clover"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Charlie"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Charlie"
          val expected = ["violets", "violets", "clover", "grass"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for David"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "David"
          val expected = ["radishes", "violets", "clover", "radishes"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Eve"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Eve"
          val expected = ["clover", "grass", "radishes", "grass"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Fred"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Fred"
          val expected = ["grass", "clover", "violets", "clover"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Ginny"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Ginny"
          val expected = ["clover", "grass", "grass", "clover"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Harriet"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Harriet"
          val expected = ["violets", "radishes", "radishes", "violets"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Ileana"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Ileana"
          val expected = ["grass", "clover", "violets", "clover"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Joseph"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Joseph"
          val expected = ["violets", "clover", "violets", "grass"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Kincaid, second to last student's garden"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Kincaid"
          val expected = ["grass", "clover", "clover", "grass"]
        in
          plants diagram student |> Expect.equalTo expected
        end),

      test "for Larry, last student's garden"
        (fn _ => let
          val diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
          val student = "Larry"
          val expected = ["grass", "violets", "clover", "violets"]
        in
          plants diagram student |> Expect.equalTo expected
        end)
    ]
  ]

val _ = Test.run testsuite
