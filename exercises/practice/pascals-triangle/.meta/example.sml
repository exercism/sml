fun next row = ListPair.map (fn (a, b) => a + b) (0 :: row, row @ [0])

fun rows_impl 0 rows = rows
  | rows_impl c [] = rows_impl (c - 1) [[1]]
  | rows_impl c (r :: rows) = rows_impl (c - 1) ((next r) :: r :: rows)

fun rows (count: int): int list list = List.rev (rows_impl count [])
