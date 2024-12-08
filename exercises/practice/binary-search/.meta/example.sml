fun find (array: int list, value: int): int option =
  let fun find' left right =
        if left > right then NONE
        else let val mid = (left + right) div 2
                 val item = List.nth (array, mid)
             in  if item = value then SOME mid
                 else if item < value then find' (mid + 1) right
                 else find' left (mid - 1)
            end
  in  find' 0 (length array - 1)
  end
