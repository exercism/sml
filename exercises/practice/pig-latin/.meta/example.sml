fun isVowelCluster _     #"a" _    = true
  | isVowelCluster _     #"e" _    = true
  | isVowelCluster _     #"i" _    = true
  | isVowelCluster _     #"o" _    = true
  | isVowelCluster _     #"u" _    = true
  | isVowelCluster false #"y" _    = true
  | isVowelCluster true  #"y" #"t" = true
  | isVowelCluster true  #"x" #"r" = true
  | isVowelCluster _     _    _    = false

fun isCluster #"q" #"u" = true
  | isCluster _    _    = false

fun translate' _ [] = ""
  | translate' _ [x] = Char.toString x ^ "ay"
  | translate' start (word as (a::b::cs)) =
      if isVowelCluster start a b
      then implode word ^ "ay"
      else if isCluster a b
           then implode (cs @ [a, b]) ^ "ay"
           else translate' false (b :: cs @ [a])

fun translate words = String.concatWith " " (map (translate' true o explode) (String.tokens Char.isSpace words))
