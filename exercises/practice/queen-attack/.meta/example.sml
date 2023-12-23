fun create (row: int, column: int) =
  if row < 0 then raise Fail "row not positive"
  else if row > 7 then raise Fail "row not on board"
  else if column < 0 then raise Fail "column not positive"
  else if column > 7 then raise Fail "column not on board"
  else (row, column)

fun canAttack whiteQueen blackQueen: bool =
  let
    val (r1, c1) = whiteQueen
    val (r2, c2) = blackQueen
    val dr = r2 - r1
    val dc = c2 - c1
  in
    dr = 0 orelse dc = 0 orelse dr = dc orelse dr + dc = 0
  end
