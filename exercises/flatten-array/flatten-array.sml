(* Rose tree *)
datatype 'a tree = Empty | Elem of 'a | List of 'a tree list

fun flatten (xs: 'a tree): 'a list =
  raise Fail "'flatten' has not been implemented"
