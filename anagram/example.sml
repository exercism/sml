(* Merge two ordered lists using the order lt.
   Pre: the given lists xs and ys must already be ordered per lt.
   Runs in O(n) time, where n = |xs| + |ys|. 
*)
fun merge lt (xs, ys) =
    let fun loop(out, [], []) = List.rev out
          | loop(out, x::xs, []) = loop (x::out, xs, [])
          | loop(out, [], y::ys) = loop (y::out, [], ys)
          | loop(out, left as x::xs, right as y::ys) =
            if lt (x, y) then loop (x::out, xs, right)
            else loop (y::out, left, ys)
    in
        loop([], xs, ys)
    end

(* mergesort = fn : ('a * 'a -> bool) -> 'a list -> 'a list
   given an ordering operation and a list of elements that can be ordered
   returns them in that ordering 
 
   ex: mergesort (op <) [5,4,3,2,1] 
       => [1, 2, 3, 4, 5] : int list
*)        
fun mergesort lt xs =
    let val merge' = merge lt
        (* splits a list into two semi-equal halves in Linear time *)
        fun split ns =
            let fun loop([], xs, ys) = (xs, ys)
                  | loop(x::y::zs, xs, ys) = loop(zs, x::xs, y::ys)
                  | loop(x::[], xs, ys) = loop([], x::xs, ys)
            in
                loop(List.rev(ns), [], [])
            end
        fun ms []  = []
          | ms [x] = [x]
          | ms xs = let
              val (l, r) = split xs
          in
              merge'(ms l, ms r)
          end
    in
        ms xs
    end

(* anagram = fn: string -> string list -> string list 
   given a starting word and a list of candidate words 
   determine which candidate words are anagrams of the starting word
*) 
fun anagram word candidates =
    let val ms'        = mergesort (op <)
        val sortedWord = ms' (explode word)
        fun isAnagram word candidate =
            let val sortedCandidate = ms' (explode candidate)
            in
                sortedWord = sortedCandidate
            end
    in
        List.filter (isAnagram word) candidates
    end
