datatype classification = Deficient | Perfect | Abundant

(* Divisors come in pairs (i,j) with i <= sqrt n. *)
(* When i = sqrt n, count this divisor once. *)
fun properDivisors 1 = []
  | properDivisors n =
    let fun loop i =
          if i * i > n
          then []
          else if n mod i <> 0
               then loop (i+1)
               else if i * i = n
                    then i :: loop (i+1)
                    else i :: n div i :: loop (i+1)
    in 1 :: loop 2 end

val sum = foldl op+ 0

fun classify n =
  if n < 1
  then NONE
  else SOME (case Int.compare (n, sum (properDivisors n)) of
                      LESS    => Abundant
                    | EQUAL   => Perfect
                    | GREATER => Deficient)
