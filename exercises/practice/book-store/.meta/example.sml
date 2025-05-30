local
  fun insert (value: int) (l: int list) =
    case l of
        nil => value :: nil
      | first :: rest =>
          if value <= first then value :: l
          else first :: (insert value rest)

  fun sort (l: int list): int list =
    case l of
        nil => nil
      | first :: rest => insert first (sort rest)

  fun toList (table: int array) =
    Array.foldr (op ::) [] table

  (* Two groups of four are cheaper than a group of five plus a group of three. *)
  fun price (one: int, two: int, three: int, four: int, five: int) =
    if three > 0 andalso five >= three then price (one, two, 0, four + 2 * three, five - three)
    else if five > 0 andalso three > five then price (one, two, three - five, four + 2 * five, 0)
    else 5 * five * 600 + 4 * four * 640 + 3 * three * 720 + 2 * two * 760 + 1 * one * 800

  fun difference (l: int list) = case l of
      _ :: first :: second :: third :: fourth :: fifth :: [] => price (fifth - fourth, fourth - third, third - second, second - first, first)
    | _ => 0

  fun recurse (table: int array, basket: int list): int =
    case basket of
        nil => difference (sort (toList (table)))
      | first :: rest => ( Array.update (table, first, 1 + Array.sub (table, first)) ; recurse (table, rest) )
in
  fun total (basket: int list): int =
    recurse (Array.array (6, 0), basket)
end
