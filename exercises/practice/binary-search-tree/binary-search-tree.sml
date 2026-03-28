datatype tree = Empty | Node of int * tree * tree

fun insert (tree: tree, value: int): tree =
  raise Fail "'insert' is not implemented"

fun fromList (values: int list): tree =
  raise Fail "'fromList' is not implemented"

fun sortedData (tree: tree): int list =
  raise Fail "'sortedData' is not implemented"
