datatype direction = North | East | South | West

type robot = {position: int * int, dir: direction}

fun step (ch, {position = (x, y), dir}) =
  case (dir, ch) of
    (_, #"R") => {position = (x, y), dir =
      case dir of North => East | East => South | South => West | West => North}
  | (_, #"L") => {position = (x, y), dir =
      case dir of North => West | West => South | South => East | East => North}
  | (North, #"A") => {position = (x, y + 1), dir = dir}
  | (East,  #"A") => {position = (x + 1, y), dir = dir}
  | (South, #"A") => {position = (x, y - 1), dir = dir}
  | (West,  #"A") => {position = (x - 1, y), dir = dir}
  | _ => raise Fail "invalid instruction"

fun move (start: robot, instructions: string): robot =
  CharVector.foldl step start instructions
