fun concat (lists: int list list): int list =
  raise Fail "'concat' is not implemented"

fun reverse (list: int list): int list =
  raise Fail "'reverse' is not implemented"

fun filter (function: int -> bool, list: int list): int list =
  raise Fail "'filter' is not implemented"

fun map (function: int -> int, list: int list): int list =
  raise Fail "'map' is not implemented"

fun append (list1: int list, list2: int list): int list =
  raise Fail "'append' is not implemented"

fun length (ns: int list): int =
  raise Fail "'length' is not implemented"

fun foldl (function: int * int -> int, initial: int, list: int list): int =
  raise Fail "'foldl' is not implemented"

fun foldr (function: int * int -> int, initial: int, list: int list): int =
  raise Fail "'foldr' is not implemented"
