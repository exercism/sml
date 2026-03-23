datatype tree = Empty | Node of string * tree * tree

fun treeFromTraversals (preorder: string list, inorder: string list): tree =
  raise Fail "'treeFromTraversals' is not implemented"
