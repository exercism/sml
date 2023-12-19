(* version 1.0.0 *)

use "testlib.sml";
use "strain.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "strain" [
    test "keep on empty list returns empty list"
      (fn _ => let
        val l = []
      in
        keep (fn x => true) l |> Expect.equalTo []
      end),

    test "keeps everything"
      (fn _ => let
        val l = [1, 3, 5]
      in
        keep (fn x => true) l |> Expect.equalTo [1, 3, 5]
      end),

    test "keeps nothing"
      (fn _ => let
        val l = [1, 3, 5]
      in
        keep (fn x => false) l |> Expect.equalTo []
      end),

    test "keeps first and last"
      (fn _ => let
        val l = [1, 2, 3]
      in
        keep (fn x => x mod 2 = 1) l |> Expect.equalTo [1, 3]
      end),

    test "keeps neither first nor last"
      (fn _ => let
        val l = [1, 2, 3]
      in
        keep (fn x => x mod 2 = 0) l |> Expect.equalTo [2]
      end),

    test "keeps strings"
      (fn _ => let
        val l = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
      in
        keep (String.isPrefix "z") l |> Expect.equalTo ["zebra", "zombies", "zealot"]
      end),

    test "keeps lists"
      (fn _ => let
        val l = [[1, 2, 3], [5, 5, 5], [5, 1, 2], [2, 1, 2], [1, 5, 2], [2, 2, 1], [1, 2, 5]]
      in
        keep (List.exists (fn x => x = 5)) l |> Expect.equalTo [[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]]
      end),

    test "discard on empty list returns empty list"
      (fn _ => let
        val l = []
      in
        discard (fn x => true) l |> Expect.equalTo []
      end),

    test "discards everything"
      (fn _ => let
        val l = [1, 3, 5]
      in
        discard (fn x => true) l |> Expect.equalTo []
      end),

    test "discards nothing"
      (fn _ => let
        val l = [1, 3, 5]
      in
        discard (fn x => false) l |> Expect.equalTo [1, 3, 5]
      end),

    test "discards first and last"
      (fn _ => let
        val l = [1, 2, 3]
      in
        discard (fn x => x mod 2 = 1) l |> Expect.equalTo [2]
      end),

    test "discards neither first nor last"
      (fn _ => let
        val l = [1, 2, 3]
      in
        discard (fn x => x mod 2 = 0) l |> Expect.equalTo [1, 3]
      end),

    test "discards strings"
      (fn _ => let
        val l = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
      in
        discard (String.isPrefix "z") l |> Expect.equalTo ["apple", "banana", "cherimoya"]
      end),

    test "discards lists"
      (fn _ => let
        val l = [[1, 2, 3], [5, 5, 5], [5, 1, 2], [2, 1, 2], [1, 5, 2], [2, 2, 1], [1, 2, 5]]
      in
        discard (List.exists (fn x => x = 5)) l |> Expect.equalTo [[1, 2, 3], [2, 1, 2], [2, 2, 1]]
      end)
  ]

val _ = Test.run testsuite
