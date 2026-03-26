type school = (string * int) list

fun newSchool (): school = []

fun add (school: school, name: string, g: int): bool * school =
  if List.exists (fn (n, _) => n = name) school
  then (false, school)
  else (true, (name, g) :: school)

fun sortBy cmp lst =
  let
    fun merge ([], ys) = ys
      | merge (xs, []) = xs
      | merge (x :: xs, y :: ys) =
          if cmp (x, y) then x :: merge (xs, y :: ys)
          else y :: merge (x :: xs, ys)
    fun split [] = ([], [])
      | split [x] = ([x], [])
      | split (x :: y :: rest) =
          let val (l, r) = split rest
          in (x :: l, y :: r) end
    fun sort [] = []
      | sort [x] = [x]
      | sort xs =
          let val (l, r) = split xs
          in merge (sort l, sort r) end
  in
    sort lst
  end

fun roster (school: school): string list =
  let
    val sorted = sortBy
      (fn ((n1, g1), (n2, g2)) =>
        g1 < g2 orelse (g1 = g2 andalso n1 < n2))
      school
  in
    map #1 sorted
  end

fun grade (school: school, desiredGrade: int): string list =
  let
    val filtered = List.filter (fn (_, g) => g = desiredGrade) school
    val sorted = sortBy (fn ((n1, _), (n2, _)) => n1 < n2) filtered
  in
    map #1 sorted
  end
