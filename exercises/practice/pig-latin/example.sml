fun isVowelCluster #"a" _    = true
  | isVowelCluster #"e" _    = true
  | isVowelCluster #"i" _    = true
  | isVowelCluster #"o" _    = true
  | isVowelCluster #"u" _    = true
  | isVowelCluster #"y" #"t" = true
  | isVowelCluster #"x" #"r" = true
  | isVowelCluster _    _    = false

fun isCluster #"q" #"u" = true
  | isCluster _    _    = false

fun translate' [] = ""
  | translate' [x] = Char.toString x ^ "ay"
  | translate' [#"m", #"y"] = "ymay"
  | translate' (word as (a::b::cs)) =
      if isVowelCluster a b
      then implode word ^ "ay"
      else if isCluster a b
           then translate' (cs @ [a, b])
           else translate' (b :: cs @ [a])

fun translate words = String.concatWith " " (map (translate' o explode) (String.tokens Char.isSpace words))
