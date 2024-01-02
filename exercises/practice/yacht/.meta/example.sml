datatype category =
    Ones
  | Twos
  | Threes
  | Fours
  | Fives
  | Sixes
  | FullHouse
  | FourOfAKind
  | LittleStraight
  | BigStraight
  | Choice
  | Yacht

local
  fun insert (value: int) (l: int list) =
    case l of
        nil => value :: nil
      | first :: rest =>
          if value <= first then value :: l
          else first :: (insert value rest)

  fun sort (dice: int list): int list =
    case dice of
        nil => nil
      | first :: rest => insert first (sort rest)

  fun total (dice: int list): int =
    let
      fun recurse (acc: int) (dice: int list): int =
        case dice of
            nil => acc
          | first :: rest => recurse (acc + first) rest
    in
      recurse 0 dice
    end

  fun numbers (number: int) (dice: int list): int =
    let
      fun recurse (acc: int) (dice: int list): int =
        case dice of
            nil => acc
          | first :: rest =>
              if first = number then recurse (acc + number) rest
              else recurse acc rest
    in
      recurse 0 dice
    end

  fun ones (dice: int list): int =
    numbers 1 dice

  fun twos (dice: int list): int =
    numbers 2 dice

  fun threes (dice: int list): int =
    numbers 3 dice

  fun fours (dice: int list): int =
    numbers 4 dice

  fun fives (dice: int list): int =
    numbers 5 dice

  fun sixes (dice: int list): int =
    numbers 6 dice

  fun fullHouse (dice: int list): int =
    if List.nth (dice, 0) = List.nth (dice, 4) then 0
    else if List.nth (dice, 0) = List.nth (dice, 2) andalso List.nth (dice, 3) = List.nth (dice, 4) then total dice
    else if List.nth (dice, 0) = List.nth (dice, 1) andalso List.nth (dice, 2) = List.nth (dice, 4) then total dice
    else 0

  fun fourOfAKind (dice: int list): int =
    if List.nth (dice, 0) = List.nth (dice, 3) orelse List.nth (dice, 1) = List.nth (dice, 4) then 4 * List.nth (dice, 2)
    else 0

  fun littleStraight (dice: int list): int =
    if dice = [1, 2, 3, 4, 5] then 30
    else 0

  fun bigStraight (dice: int list): int =
    if dice = [2, 3, 4, 5, 6] then 30
    else 0

  fun choice (dice: int list): int =
    total dice

  fun yacht (dice: int list): int =
    if List.nth (dice, 0) = List.nth (dice, 4) then 50
    else 0

  fun score' (dice: int list, category): int =
    case category of
        Ones => ones dice
      | Twos => twos dice
      | Threes => threes dice
      | Fours => fours dice
      | Fives => fives dice
      | Sixes => sixes dice
      | FullHouse => fullHouse dice
      | FourOfAKind => fourOfAKind dice
      | LittleStraight => littleStraight dice
      | BigStraight => bigStraight dice
      | Choice => choice dice
      | Yacht => yacht dice
      | _ => raise Fail "invalid category"
in
  fun score (dice: int list, category): int =
    score' (sort dice, category)
end
