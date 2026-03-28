datatype direction = North | East | South | West

type robot = {position: int * int, dir: direction}

fun move (start: robot, instructions: string): robot =
  raise Fail "'move' is not implemented"
