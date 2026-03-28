datatype 'a tree = Empty | Node of 'a * 'a tree * 'a tree

fun insert (compare: 'a * 'a -> order) (value: 'a, tree: 'a tree): 'a tree =
  raise Fail "'insert' is not implemented"

fun fromList (compare: 'a * 'a -> order) (values: 'a list): 'a tree =
  raise Fail "'fromList' is not implemented"

fun sortedData (tree: 'a tree): 'a list =
  raise Fail "'sortedData' is not implemented"
