fun nthPrime n =
  let
    fun isPrime n =
      if n = 2
      then true
      else if n < 2 orelse n mod 2 = 0
           then false
           else
             let
               fun loop i =
                 if i * i > n
                 then true
                 else if n mod i = 0
                      then false
                      else loop (i + 2)
             in
               loop 3
             end

    fun loop i m =
      case (i = n, isPrime m) of
        (true , true)  => m
      | (false, true)  => loop (i + 1) (m + 1)
      | (_    , _   )  => loop i (m + 1)
  in
    if n < 1
    then raise Domain
    else loop 1 2
  end
