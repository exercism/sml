fun winner (board: string vector): string =
  let
    val rows = Vector.length board
    val cols = (String.size (Vector.sub (board, 0)) + 1) div 2

    fun cellAt (r, c) =
      let
        val line = Vector.sub (board, r)
      in
        String.sub (line, r + c * 2)
      end

    (* Indices 0..rows*cols-1 are cells. Two extra virtual nodes for edges. *)
    fun index (r, c) = r * cols + c
    val edgeA = rows * cols
    val edgeB = rows * cols + 1
    val n = rows * cols + 2

    fun checkPlayer (ch, isEdgeA, isEdgeB) =
      let
        (* Disjoint set (union-find). *)
        val parent = Array.tabulate (n, fn i => i)
        val rank = Array.array (n, 0)

        fun find a =
          let
            val p = Array.sub (parent, a)
          in
            if p = a then a
            else
              let
                val root = find p
              in
                Array.update (parent, a, root);
                root
              end
          end

        fun union (a, b) =
          let
            val ra = find a
            val rb = find b
          in
            if ra = rb then ()
            else
              let
                val rka = Array.sub (rank, ra)
                val rkb = Array.sub (rank, rb)
              in
                if rka < rkb then Array.update (parent, ra, rb)
                else if rka > rkb then Array.update (parent, rb, ra)
                else (Array.update (parent, rb, ra);
                      Array.update (rank, ra, rka + 1))
              end
          end

        fun processCell (r, c) =
          if cellAt (r, c) <> ch then ()
          else
            let
              val i = index (r, c)
              fun tryNeighbor (dr, dc) =
                let
                  val nr = r + dr
                  val nc = c + dc
                in
                  if nr >= 0 andalso (* dr <= 0 *)
                     nc >= 0 andalso nc < cols andalso
                     cellAt (nr, nc) = ch
                  then union (i, index (nr, nc))
                  else ()
                end

              val deltas = [(~1, 0), (~1, 1), (0, ~1)]
            in
              if isEdgeA (r, c) then union (i, edgeA)
              else ();

              if isEdgeB (r, c) then union (i, edgeB)
              else ();

              List.app tryNeighbor deltas
            end

        fun loopR r =
          let
            fun loopC c =
              if c >= cols then ()
              else (processCell (r, c); loopC (c + 1))
          in
            if r >= rows then ()
            else (loopC 0; loopR (r + 1))
          end
      in
        loopR 0;
        find edgeA = find edgeB
      end

    val xWins = checkPlayer (#"X",
                  fn (_, c) => c = 0,
                  fn (_, c) => c = cols - 1)
    val oWins = checkPlayer (#"O",
                  fn (r, _) => r = 0,
                  fn (r, _) => r = rows - 1)
  in
    if xWins then "X"
    else if oWins then "O"
    else ""
  end
