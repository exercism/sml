infix == (* For some reason this is only necessary for *some* comparision operators *)
val op== = Real.==

fun equilateral ([a, b, c]: real list) = (a > 0.0) andalso (a == b) andalso (b == c)
  | equilateral _ = false


fun isosceles ([a, b, c]: real list) =
    let
      fun pred (x, y, z) = x == y andalso x + y > z andalso z > 0.0
    in
      pred (a, b, c) orelse pred (b, c, a) orelse pred (c, a, b)
    end
  | isosceles _ = false


fun scalene ([a, b, c]: real list) =
    let
      fun pred (x, y, z) = Real.!= (x, y) andalso x + y > z andalso z > 0.0
    in
      pred (a, b, c) andalso pred (b, c, a) andalso pred (c, a, b)
    end
  | scalene _ = false
