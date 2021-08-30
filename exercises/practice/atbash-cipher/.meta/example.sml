fun chunkify chunkSz s =
  let
    val sz = size s

    fun chunker 0 _   = chunker chunkSz (substring (s, 0, chunkSz))
      | chunker i acc =
          if sz = i
          then acc
          else if sz - i < chunkSz
               then acc ^ " " ^ substring (s, i, size s - i)
               else chunker (i + chunkSz) (acc ^ " " ^ substring (s, i, chunkSz))
  in
    if chunkSz > sz
    then s
    else chunker 0 ""
  end

fun cipher c =
  let
    open Char
    val n = ord #"z" + ord #"a"
    val c = toLower c
  in
    if isAlpha c
    then (toString o chr) (n - ord c)
    else if isDigit c
         then toString c
         else ""
  end

val decode = String.translate cipher
val encode = (chunkify 5) o decode
