fun spiralMatrix (size: int): int list list =
  let
      fun spiralCoords (n, offset) =
        if n <= 0 then []
        else if n = 1 then [(offset, offset)]
        else
          List.tabulate (n - 1, fn c => (offset, offset + c))
          @ List.tabulate (n - 1, fn r => (offset + r, offset + n - 1))
          @ List.tabulate (n - 1, fn c => (offset + n - 1, offset + n - 1 - c))
          @ List.tabulate (n - 1, fn r => (offset + n - 1 - r, offset))
          @ spiralCoords (n - 2, offset + 1)

      val grid = Array.array (size * size, 0)
      val _ = List.foldl (fn ((r, c), i) =>
        (Array.update (grid, r * size + c, i); i + 1))
        1 (spiralCoords (size, 0))
    in
      List.tabulate (size, fn r =>
        List.tabulate (size, fn c => Array.sub (grid, r * size + c)))
    end
