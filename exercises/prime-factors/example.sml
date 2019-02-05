fun primeFactors n =
  let
    fun aux prime n =
      if prime * prime > n
      then [n]
      else if n mod prime = 0
           then prime :: aux prime (n div prime)
           else if prime = 2
                then aux (prime + 1) n
                else aux (prime + 2) n
  in
    if n < 2
    then []
    else aux 2 n
  end
