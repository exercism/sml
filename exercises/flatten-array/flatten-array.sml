datatype 'a nestedList =
	  Elem of 'a
	| List of 'a nestedList list

fun flatten (xs: 'a nestedList): 'a list =
  raise Fail "'flatten' has not been implemented"