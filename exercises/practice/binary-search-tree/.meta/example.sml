datatype tree = Empty | Node of int * tree * tree

fun insert (value, Empty) = Node (value, Empty, Empty)
  | insert (value, Node (data, left, right)) =
      if value <= data
      then Node (data, insert (value, left), right)
      else Node (data, left, insert (value, right))

fun fromList (values: int list): tree =
  foldl insert Empty values

fun sortedData Empty = []
  | sortedData (Node (data, left, right)) =
      sortedData left @ [data] @ sortedData right
