datatype 'a tree = Empty | Node of 'a * 'a tree * 'a tree

fun insert cmp (value, Empty) = Node (value, Empty, Empty)
  | insert cmp (value, Node (data, left, right)) =
      if cmp (data, value) = LESS
      then Node (data, left, insert cmp (value, right))
      else Node (data, insert cmp (value, left), right)

fun fromList (cmp: 'a * 'a -> order) (values: 'a list): 'a tree =
  foldl (insert cmp) Empty values

fun sortedData Empty = []
  | sortedData (Node (data, left, right)) =
      sortedData left @ (data :: sortedData right)
