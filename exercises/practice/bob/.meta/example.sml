val response =
  let
    open Char
    open List
    
    fun isQuestion chars = last (filter (not o isSpace) chars) = #"?"

    fun isYell chars = exists isAlpha chars andalso (map toUpper chars) = chars

    val isNothing = all isSpace

    fun response' chars =
      if isNothing chars
      then "Fine. Be that way!"
      else if isYell chars
           then if isQuestion chars
                then "Calm down, I know what I'm doing!"
                else "Whoa, chill out!"
           else if isQuestion chars
                then "Sure."
                else "Whatever."
  in
    response' o String.explode 
  end
