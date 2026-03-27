datatype format = Portrait | Square | Landscape

type partialInfo = {
  pieces: int option,
  border: int option,
  inside: int option,
  rows: int option,
  columns: int option,
  aspectRatio: (int * int) option,
  format: format option
}

type fullInfo = {
  pieces: int,
  border: int,
  inside: int,
  rows: int,
  columns: int,
  aspectRatio: int * int,
  format: format
}

fun jigsawData (puzzle: partialInfo): fullInfo =
  let
    fun gcd (a, 0) = a
      | gcd (a, b) = gcd (b, a mod b)

    fun ratio (c, r) =
      let val g = gcd (c, r)
      in (c div g, r div g) end

    fun fmt (c, r) =
      if c < r then Portrait
      else if c > r then Landscape
      else Square

    fun complete (c, r) : fullInfo =
      {pieces = r * c,
       border = 2 * (r + c) - 4,
       inside = (r - 2) * (c - 2),
       rows = r,
       columns = c,
       aspectRatio = ratio (c, r),
       format = fmt (c, r)}

    fun matches (candidate: fullInfo) =
      (case #pieces puzzle of
         SOME v => #pieces candidate = v
       | NONE => true)
      andalso (case #border puzzle of
         SOME v => #border candidate = v
       | NONE => true)
      andalso (case #inside puzzle of
         SOME v => #inside candidate = v
       | NONE => true)
      andalso (case #aspectRatio puzzle of
         SOME v => #aspectRatio candidate = v
       | NONE => true)
      andalso (case #format puzzle of
         SOME v => #format candidate = v
       | NONE => true)

    val limit = 400
    val solution = ref NONE

    fun tryCandidate c r =
      let val candidate = complete (c, r)
      in
        if matches candidate then
          (case !solution of
             SOME _ => raise Fail "Insufficient data"
           | NONE => solution := SOME candidate)
        else ()
      end

    fun forEachR f =
      case #rows puzzle of
        SOME r => f r
      | NONE =>
          let fun loop r = if r > limit then ()
                           else (f r; loop (r + 1))
          in loop 2 end

    fun forEachC f =
      case #columns puzzle of
        SOME c => forEachR (f c)
      | NONE =>
          let fun loop c = if c > limit then ()
                           else (forEachR (f c); loop (c + 1))
          in loop 2 end

    fun search () = forEachC tryCandidate
  in
    search ();
    case !solution of
      SOME result => result
    | NONE => raise Fail "Contradictory data"
  end
