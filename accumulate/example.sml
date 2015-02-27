(* accumulate 
   given a list and a transformation function, 
   apply the transformation function to each list element
   and return the results.
   
   Caveats: an empty list cannot be transformed
            do not use List.map from the standard basis
*)
fun accumulate [] _      = []
  | accumulate (x::xs) f = f x  :: accumulate xs f
