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

fun score (dice: int list, category): int =
  raise Fail "'score' is not implemented"
