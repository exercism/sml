fun decimal n = let
    val digits = List.map (fn c => (ord c) - 48) (explode n)
    val len = List.length digits

    fun validate []      = true
      | validate (d::ds) = if d <> 0 andalso d <> 1 then false
                           else validate ds
    fun even n = (n mod 2) = 0
    fun int_pow a b = Real.toInt IEEEReal.TO_NEAREST (Math.pow (Real.fromInt(a), Real.fromInt(b)))
    fun f' []      mult acc = acc
      | f' (x::xs) mult acc = f' xs (mult - 1) (acc + (x * (int_pow 2 mult)))
in
    if len = 0 orelse not(validate digits) then NONE
    else SOME (f' digits (len - 1) 0)
end

