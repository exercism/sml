local
  fun contribution (digit: char, count: int): int =
    let
      val number = ord digit - ord #"0"
    in
      if count mod 2 = 0 then number
      else if 2 * number > 9 then 2 * number - 9
      else 2 * number
    end

  fun recurse (count: int) (total: int) (l: char list): bool =
    case l of
        nil => count > 1 andalso total mod 10 = 0
      | #" " :: rest => recurse count total rest
      | first :: rest =>
          if Char.isDigit first then recurse (count + 1) (total + contribution (first, count)) rest
          else false
in
  val valid: string -> bool =
    recurse 0 0 o rev o explode
end
