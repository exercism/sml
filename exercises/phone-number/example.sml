fun clean text =
  let
    fun valid (#"0" :: _) = false
      | valid (#"1" :: _) = false
      | valid digits      = List.nth (digits, 3) > #"1"
        
    fun check digits =
      case length digits of
        10 => if valid digits
              then SOME (implode digits)
              else NONE
      | 11 => if hd digits = #"1"
              then check (tl digits)
              else NONE
      | _  => NONE
  in
    check (List.filter Char.isDigit (explode text))
  end
