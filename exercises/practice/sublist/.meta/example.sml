datatype relation =
    Equal
  | Superlist
  | Sublist
  | Unequal

local
  fun isPrefix (listOne: int list, listTwo: int list): bool =
    case (listOne, listTwo) of
        (nil, _) => true
      | (_, nil) => false
      | (firstOne :: restOne, firstTwo :: restTwo) => firstOne = firstTwo andalso isPrefix (restOne, restTwo)

  fun isSublist (listOne: int list, listTwo: int list): bool =
    isPrefix (listOne, listTwo) orelse (listTwo <> nil andalso isSublist (listOne, tl listTwo))
in
  fun sublist (listOne: int list, listTwo: int list): relation =
    if listOne = listTwo then Equal
    else if isSublist(listOne, listTwo) then Sublist
    else if isSublist(listTwo, listOne) then Superlist
    else Unequal
end
