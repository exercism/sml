datatype 'a nestedList =
	  Elem of 'a
	| List of 'a nestedList list

fun flatten (Elem x)  = [x]
  | flatten (List xs) = List.concat (map flatten xs)
