fun concat []                 = []
  | concat [[]]               = []
  | concat ([] :: xss)        = concat xss
  | concat ((x :: xs) :: xss) = x :: concat (xs :: xss)

fun reverse xs =
  let
    fun reverse' acc []        = acc
      | reverse' acc (x :: xs) = reverse' (x :: acc) xs
  in
    reverse' [] xs
  end

fun filter (predicate, []) = []
  | filter (predicate, (x :: xs)) =
      if predicate x
      then x :: filter (predicate, xs)
      else filter (predicate, xs)

fun map (f, [])      = []
  | map (f, x :: xs) = f x :: map (f, xs)

fun append (xs, [])      = xs
  | append ([], ys)      = ys
  | append (x :: xs, ys) = x :: append(xs, ys)

fun length []        = 0
  | length (x :: xs) = 1 + length xs

fun foldl (_, acc, [])        = acc
  | foldl (f, acc, (x :: xs)) = foldl (f, (f (acc, x)), xs)

fun foldr (f, acc, [])      = acc
  | foldr (f, acc, (x::xs)) = f (x, (foldr (f, acc, xs)))
