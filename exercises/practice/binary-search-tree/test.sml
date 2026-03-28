(* version 1.0.0 *)

use "testlib.sml";
use "binary-search-tree.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "binary-search-tree" [
    test "data is retained"
      (fn _ => let
        val expected = Node (4, Empty, Empty)
      in
        fromList Int.compare [4] |> Expect.equalTo expected
      end),

    describe "insert data at proper node" [
      test "smaller number at left node"
        (fn _ => let
          val expected = Node (4,
                                 Node (2, Empty, Empty),
                                 Empty)
        in
          fromList Int.compare [4, 2] |> Expect.equalTo expected
        end),

      test "same number at left node"
        (fn _ => let
          val expected = Node (4,
                                 Node (4, Empty, Empty),
                                 Empty)
        in
          fromList Int.compare [4, 4] |> Expect.equalTo expected
        end),

      test "greater number at right node"
        (fn _ => let
          val expected = Node (4,
                                 Empty,
                                 Node (5, Empty, Empty))
        in
          fromList Int.compare [4, 5] |> Expect.equalTo expected
        end)
    ],

    test "can create complex tree"
      (fn _ => let
        val expected = Node (4,
                               Node (2,
                                       Node (1, Empty, Empty),
                                       Node (3, Empty, Empty)),
                               Node (6,
                                       Node (5, Empty, Empty),
                                       Node (7, Empty, Empty)))
      in
        fromList Int.compare [4, 2, 6, 1, 3, 5, 7] |> Expect.equalTo expected
      end),

    describe "can sort data" [
      test "can sort single number"
        (fn _ => let
          val expected = [2]
        in
          sortedData (fromList Int.compare [2]) |> Expect.equalTo expected
        end),

      test "can sort if second number is smaller than first"
        (fn _ => let
          val expected = [1, 2]
        in
          sortedData (fromList Int.compare [2, 1]) |> Expect.equalTo expected
        end),

      test "can sort if second number is same as first"
        (fn _ => let
          val expected = [2, 2]
        in
          sortedData (fromList Int.compare [2, 2]) |> Expect.equalTo expected
        end),

      test "can sort if second number is greater than first"
        (fn _ => let
          val expected = [2, 3]
        in
          sortedData (fromList Int.compare [2, 3]) |> Expect.equalTo expected
        end),

      test "can sort complex tree"
        (fn _ => let
          val expected = [1, 2, 3, 5, 6, 7]
        in
          sortedData (fromList Int.compare [2, 1, 3, 6, 7, 5]) |> Expect.equalTo expected
        end)
    ],

    test "can build string tree"
      (fn _ => let
        val expected = Node ("elegantly",
                                         Node ("can",
                                                     Node ("all",
                                                                 Empty,
                                                                 Node ("bees", Empty, Empty)),
                                                     Node ("dance", Empty, Empty)),
                                         Empty)
      in
        fromList String.compare ["elegantly", "can", "all", "dance", "bees"] |> Expect.equalTo expected
      end),

    test "can sort strings"
      (fn _ => let
        val expected = ["ace", "brings", "chaos", "down", "every", "fleet"]
      in
        sortedData (fromList String.compare ["every", "ace", "fleet", "brings", "down", "chaos"]) |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
