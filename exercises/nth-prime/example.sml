exception EmptyList
datatype 'a lazylist = Nil | Cons of ('a * (unit -> 'a lazylist));
fun next s = let
    fun next' Nil = raise EmptyList
      | next' (Cons(a,f)) = f()
in
    next' s
end ;

fun hd s = let
    fun hd' Nil = raise EmptyList
      | hd' (Cons(a, _)) = a
in
    hd' s
end ;

fun allPrimes n = let
    fun isPrime n = let
        fun factors n = let
            fun factors' 0 acc = acc
              | factors' c acc = if (n mod c) = 0
                                 then factors' (c-1) (c :: acc)
                                 else factors' (c-1) acc
        in
            factors' (n div 2) []
        end
    in
        (List.length (factors n)) = 1
    end

    fun nextPrime n = let
        val nextN = if (n mod 2) = 0 then n + 1 else n + 2
    in
        if isPrime nextN then nextN else nextPrime nextN
    end

in
    Cons(n, fn () => (allPrimes (nextPrime n)))
end ;

fun nthPrime n = let
    fun nthPrime' 0 s = hd s
      | nthPrime' n s = nthPrime' (n-1) (next s)
in
    if n <= 0 then raise Domain
    else nthPrime' (n-1) (allPrimes 2)
end ;
