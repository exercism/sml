fun canChain (dominoes: (int * int) list): bool =
  let
    val n = 7 (* values 0..6 *)
    val parent = Array.tabulate (n, fn i => i)
    val size = Array.array (n, 1)
    val tally = Array.array (n, 0)

    fun increment (arr, i) = Array.update (arr, i, Array.sub (arr, i) + 1)

    fun find x =
      let
        val p = Array.sub (parent, x)
      in
        if p = x then x
        else
          let
            val gp = Array.sub (parent, p)
          in
            Array.update (parent, x, gp);
            find gp
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
            val sa = Array.sub (size, ra)
            val sb = Array.sub (size, rb)
          in
            if sa < sb then
              (Array.update (parent, ra, rb);
               Array.update (size, rb, sa + sb))
            else
              (Array.update (parent, rb, ra);
               Array.update (size, ra, sa + sb))
          end
      end

    val _ = List.app (fn (a, b) => (
      increment (tally, a);
      increment (tally, b);
      union (a, b))) dominoes

    (* Check all vertices have even tally *)
    val allEven = Array.foldl (fn (d, acc) => acc andalso d mod 2 = 0) true tally

    (* Count roots among vertices with nonzero tally *)
    val roots = Array.foldli (fn (i, d, acc) =>
      if d > 0 andalso Array.sub (parent, i) = i then acc + 1 else acc) 0 tally
  in
    allEven andalso roots <= 1
  end
