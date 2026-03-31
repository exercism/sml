fun solve (puzzle: string): string =
  let
    (* Tokenize: words and "=" retained; "+" and spaces are separators *)
    val tokens = String.tokens (fn c => c = #" " orelse c = #"+") puzzle

    val nColumns = foldl (fn (t, m) => Int.max (String.size t, m)) 0 tokens

    fun isWord token = Char.isAlpha (String.sub (token, 0))

    (* Letter info: weight vector has per-column coefficients, rank is rightmost column *)
    type info = {letter: char, leading: int, weight: int vector, rank: int}

    (* Build info for a given letter by scanning all tokens *)
    fun letterInfo (ch: char): info option =
      let
        (* Is ch the leading letter of a non-trivial word? *)
        val leading =
          if List.exists (fn t =>
            isWord t andalso String.size t > 1 andalso String.sub (t, 0) = ch) tokens
          then 1 else 0

        (* Per-column weight coefficients *)
        fun weightAt col =
          let
            fun processToken (token, (sign, sum)) =
              if not (isWord token) then (~sign, sum)
              else
                let val len = String.size token
                in
                  if col < len andalso String.sub (token, len - 1 - col) = ch
                  then (sign, sum + sign)
                  else (sign, sum)
                end
          in #2 (foldl processToken (1, 0) tokens) end

        val weight = Vector.tabulate (nColumns, weightAt)

        (* Rightmost column where ch appears *)
        val rank = Vector.foldli (fn (i, w, r) =>
          if w <> 0 then Int.min (i, r) else r) nColumns weight
      in
        if rank = nColumns then NONE
        else SOME {
          letter = ch,
          leading = leading,
          weight = weight,
          rank = rank
        }
      end

    (* Assemble letter infos for A-Z, sorted by rank *)
    fun sortByRank infos =
      let
        fun insert (x: info, []) = [x]
          | insert (x, (y: info) :: ys) =
              if #rank x <= #rank y then x :: y :: ys
              else y :: insert (x, ys)
      in foldl (fn (e, acc) => insert (e, acc)) [] infos end

    val letters: info list =
      sortByRank (List.mapPartial letterInfo
        (List.tabulate (26, fn i => chr (Char.ord #"A" + i))))

    (* Mapping: associates each letter with its assigned digit *)
    type mapping = (char * int) list

    fun lookup (_, []: mapping) = 0
      | lookup (ch, (c, digit) :: rest) = if c = ch then digit else lookup (ch, rest)

    fun isClaimed (claimed, d) =
      Word.andb (claimed, Word.<< (0w1, Word.fromInt d)) <> 0w0

    fun claim (claimed, d) =
      Word.orb (claimed, Word.<< (0w1, Word.fromInt d))

    (* Sum of weight[col] * digit for all letters *)
    fun columnSum (col, mapping) =
      foldl (fn ({letter, weight, ...}: info, sum) =>
        if col < Vector.length weight
        then sum + Vector.sub (weight, col) * lookup (letter, mapping)
        else sum) 0 letters

    (* Check column and advance, or finish *)
    fun advanceColumn (remaining, col, claimed, carry, mapping) =
      let val colSum = carry + columnSum (col, mapping)
      in
        if colSum mod 10 <> 0 then NONE
        else if col + 1 < nColumns then
          search (remaining, col + 1, claimed, colSum div 10, mapping)
        else if colSum = 0 then SOME mapping
        else NONE
      end

    (* Search: assign digits to letters column by column *)
    and search (remaining, col, claimed, carry, mapping) =
      case remaining of
        [] => advanceColumn ([], col, claimed, carry, mapping)
      | (letter :: rest) =>
          if #rank letter > col then
            advanceColumn (remaining, col, claimed, carry, mapping)
          else
            let
              fun tryDigit digit =
                if digit > 9 then NONE
                else if isClaimed (claimed, digit) then tryDigit (digit + 1)
                else
                  case search (rest, col, claim (claimed, digit),
                               carry, (#letter letter, digit) :: mapping) of
                    SOME m => SOME m
                  | NONE => tryDigit (digit + 1)
            in tryDigit (#leading letter) end

    (* Convert puzzle string by substituting digits from mapping *)
    fun substitute mapping =
      String.implode (map (fn c =>
        if Char.isAlpha c then chr (Char.ord #"0" + lookup (c, mapping))
        else c) (String.explode puzzle))
  in
    case search (letters, 0, 0w0, 0, []) of
      SOME m => substitute m
    | NONE => raise Fail "no solution"
  end
