datatype relation =
    Equal
  | Superlist
  | Sublist
  | Unequal

local
  fun isSublist (listOne: int list, listTwo: int list): bool =
    if length listTwo < length listOne then false
    else if listOne = List.take (listTwo, length listOne) then true
    else isSublist (listOne, tl listTwo)
in
  fun sublist (listOne: int list, listTwo: int list): relation =
    if listOne = listTwo then Equal
    else if isSublist(listOne, listTwo) then Sublist
    else if isSublist(listTwo, listOne) then Superlist
    else Unequal
end
