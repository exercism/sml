type point = {row: int, column: int};

fun saddlePoints ([] : int list list): point list = []
  | saddlePoints ([] :: _): point list = []
  | saddlePoints (matrix: int list list): point list =
  let
        fun rowMax (row: int list): int = foldl Int.max (hd row) (tl row)
        val rowMaximums = Vector.fromList (map rowMax matrix)

        fun transpose ([] :: _) = []
          | transpose rows = map hd rows :: transpose (map tl rows)
        fun colMin (col: int list): int = foldl Int.min (hd col) (tl col)
        val columnMinimums = Vector.fromList (map colMin (transpose matrix))

        fun checkCol rowIdx (element, (colIdx, acc)) =
          (colIdx + 1,
           if element = Vector.sub (rowMaximums, rowIdx)
              andalso element = Vector.sub (columnMinimums, colIdx)
           then {row = rowIdx + 1, column = colIdx + 1} :: acc
           else acc)

        fun check (row, rowIdx, acc) =
          #2 (foldl (checkCol rowIdx) (0, acc) row)

        fun checkRow (row, (rowIdx, acc)) =
          (rowIdx + 1, check (row, rowIdx, acc))
    in
      rev (#2 (foldl checkRow (0, []) matrix))
    end
