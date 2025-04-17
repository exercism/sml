local
  infix |>            (* left-associative *)
  fun (x |> f) = f x

  val product = List.foldl op* 1
  val max     = List.foldl Int.max ~1
  fun spans _ []    = []
    | spans span ns =
        if span > length ns then []
        else (List.take (ns, span)) :: spans span (tl ns)
in
  fun largestProduct (digits: string, span: int): int =
    if      span > size digits then raise Fail "span must not exceed string length"
    else if span < 0           then raise Fail "span must not be negative"
    else if span = 0           then 1
    else explode digits
         |> List.map (valOf o Int.fromString o str)
         |> spans span
         |> List.map product
         |> max
         handle Option => raise Fail "digits input must only contain digits"
end
