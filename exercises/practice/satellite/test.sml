(* version 1.0.0 *)

use "testlib.sml";
use "satellite.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "satellite" [
    test "Empty tree"
      (fn _ => let
        val preorder = []
        val inorder = []
        val expected = Empty
      in
        treeFromTraversals (preorder, inorder) |> Expect.equalTo expected
      end),

    test "Tree with one item"
      (fn _ => let
        val preorder = ["a"]
        val inorder = ["a"]
        val expected = Node ("a", Empty, Empty)
      in
        treeFromTraversals (preorder, inorder) |> Expect.equalTo expected
      end),

    test "Tree with many items"
      (fn _ => let
        val preorder = ["a", "i", "x", "f", "r"]
        val inorder = ["i", "a", "f", "x", "r"]
        val expected = Node ("a",
                                 Node ("i", Empty, Empty),
                                 Node ("x",
                                           Node ("f", Empty, Empty),
                                           Node ("r", Empty, Empty)))
      in
        treeFromTraversals (preorder, inorder) |> Expect.equalTo expected
      end),

    test "Reject traversals of different length"
      (fn _ => let
        val preorder = ["a", "b"]
        val inorder = ["b", "a", "r"]
      in
        (fn _ => treeFromTraversals (preorder, inorder)) |> Expect.error (Fail "traversals must have the same length")
      end),

    test "Reject inconsistent traversals of same length"
      (fn _ => let
        val preorder = ["x", "y", "z"]
        val inorder = ["a", "b", "c"]
      in
        (fn _ => treeFromTraversals (preorder, inorder)) |> Expect.error (Fail "traversals must have the same elements")
      end),

    test "Reject traversals with repeated items"
      (fn _ => let
        val preorder = ["a", "b", "a"]
        val inorder = ["b", "a", "a"]
      in
        (fn _ => treeFromTraversals (preorder, inorder)) |> Expect.error (Fail "traversals must contain unique items")
      end),

    test "A degenerate binary tree"
      (fn _ => let
        val preorder = ["a", "b", "c", "d"]
        val inorder = ["d", "c", "b", "a"]
        val expected = Node ("a",
                                 Node ("b",
                                           Node ("c",
                                                     Node ("d", Empty, Empty),
                                                     Empty),
                                           Empty),
                                 Empty)
      in
        treeFromTraversals (preorder, inorder) |> Expect.equalTo expected
      end),

    test "Another degenerate binary tree"
      (fn _ => let
        val preorder = ["a", "b", "c", "d"]
        val inorder = ["a", "b", "c", "d"]
        val expected = Node ("a",
                                 Empty,
                                 Node ("b",
                                           Empty,
                                           Node ("c",
                                                     Empty,
                                                     Node ("d", Empty, Empty))))
      in
        treeFromTraversals (preorder, inorder) |> Expect.equalTo expected
      end),

    test "Tree with many more items"
      (fn _ => let
        val preorder = ["a", "b", "d", "g", "h", "c", "e", "f", "i"]
        val inorder = ["g", "d", "h", "b", "a", "e", "c", "i", "f"]
        val expected = Node ("a",
                                 Node ("b",
                                           Node ("d",
                                                     Node ("g", Empty, Empty),
                                                     Node ("h", Empty, Empty)),
                                           Empty),
                                 Node ("c",
                                           Node ("e", Empty, Empty),
                                           Node ("f",
                                                     Node ("i", Empty, Empty),
                                                     Empty)))
      in
        treeFromTraversals (preorder, inorder) |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
