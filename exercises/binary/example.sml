exception NonBinaryDigitFound
exception EmptyBinaryStringFound

(* accepts a binary string and converts it to the decimal equivalant *)
fun binaryToDecimal n = let
    val digits = List.map (fn c => (ord c) - 48) (explode n)
    val len = List.length digits
    fun validateBinaryDigits []      = true
      | validateBinaryDigits (d::ds) = if d <> 0 andalso d <> 1 then false
                                       else validateBinaryDigits ds
    fun even n = (n mod 2) = 0
    fun expt a b = let
        fun loop x 0 acc = acc
          | loop x 1 acc = x * acc
          | loop x n acc = if (even n) then loop (x * x) (n div 2) acc
                           else             loop (x * x) ((n - 1) div 2) (x * acc)
    in
        loop a b 1
    end
    fun f' []      mult acc = acc 
      | f' (x::xs) mult acc = f' xs (mult - 1) (acc + (x * (expt 2 mult)))
in
    if len = 0 then raise EmptyBinaryStringFound
    else if (validateBinaryDigits digits) then f' digits (len - 1) 0
    else raise NonBinaryDigitFound
end

