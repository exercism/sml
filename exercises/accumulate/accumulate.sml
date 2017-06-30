(* accumulate
   given a list and a transformation function,
   apply the transformation function to each list element
   and return the results.

   Caveats: an empty list cannot be transformed
            do not use List.map from the standard basis
*)
fun accumulate (f: 'a -> 'b) (xs: 'a list): 'b list =
  raise Fail "'accumulate' has not been implemented"
