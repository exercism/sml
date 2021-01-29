(* Rose tree *)
datatype 'a tree = Empty | Elem of 'a | List of 'a tree list

fun flatten tree =
  raise Fail "'flatten' has not been implemented"
