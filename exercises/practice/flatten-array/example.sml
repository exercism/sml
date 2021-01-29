datatype 'a tree = Empty | Elem of 'a | List of 'a tree list

fun flatten Empty     = []
  | flatten (Elem x)  = [x]
  | flatten (List xs) = List.concat (map flatten xs)
