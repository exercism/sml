fun toRna dna =
  let
    fun translate #"G" = SOME #"C"
      | translate #"C" = SOME #"G"
      | translate #"T" = SOME #"A"
      | translate #"A" = SOME #"U"
      | translate _    = NONE

    fun reducer (_, NONE)     = NONE
      | reducer (x, SOME acc) = 
          let
            val t = translate x
          in
            case t of
              NONE => NONE
            | SOME c => SOME (c :: acc)
          end
  in
    Option.map implode (foldr reducer (SOME []) (explode dna))
  end
