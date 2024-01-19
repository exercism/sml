datatype relation =
    Equal
  | Superlist
  | Sublist
  | Unequal

fun sublist (listOne: int list, listTwo: int list): relation =
  raise Fail "'sublist' is not implemented"
