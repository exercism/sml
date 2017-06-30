datatype 'a nestedList =
	  Leaf of 'a			           (* leaf *)
	| Node of 'a nestedList list (* node *)

fun flatten (xs: 'a nestedList): 'a list =
  raise Fail "'flatten' has not been implemented"