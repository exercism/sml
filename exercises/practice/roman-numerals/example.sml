fun roman number =
  let
    val pairs = [
        (1000, "M"),
        (900 , "CM"),
        (500 , "D"),
        (400 , "CD"),
        (100 , "C"),
        (90  , "XC"),
        (50  , "L"),
        (40  , "XL"),
        (10  , "X"),
        (9   , "IX"),
        (5   , "V"),
        (4   , "IV"),
        (1   , "I") 
    ]

    fun loop 0 _  = []
      | loop _ [] = []
      | loop n (ps as ((num, rep) :: ps')) =
          if n < num
          then loop n ps'
          else rep :: loop (n - num) ps
  in
    concat (loop number pairs)
  end
