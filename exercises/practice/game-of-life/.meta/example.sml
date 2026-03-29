fun tick (first :: rest) =
    let
      val zeros = map (fn _ => 0) first

      fun nextCell (n, alive) =
        if n = 3 orelse (n = 2 andalso alive) then 1
        else 0

      fun peek (x :: _) = x
        | peek [] = 0

      fun row (above, current, below) =
        let
          fun cols (pa :: a :: ra, pc :: c :: rc, pb :: b :: rb) =
                nextCell (pa + a + peek ra + pc + peek rc + pb + b + peek rb, c = 1)
                :: cols (a :: ra, c :: rc, b :: rb)
            | cols _ = []
        in
          cols (0 :: above, 0 :: current, 0 :: below)
        end

      fun rows (prev, cur, next :: rest) =
            row (prev, cur, next) :: rows (cur, next, rest)
        | rows (prev, cur, []) = [row (prev, cur, zeros)]
    in
      rows (zeros, first, rest)
    end
  | tick [] = []
