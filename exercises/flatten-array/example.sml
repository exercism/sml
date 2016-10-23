datatype 'a nestedList =
	  Leaf of 'a			     (* leaf *)
	| Node of 'a nestedList list (* node *)

fun flatten (Leaf x)  = [x]
  | flatten (Node xs) = List.concat (map flatten xs)
