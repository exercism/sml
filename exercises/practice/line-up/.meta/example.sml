fun suffix number =
  let
    val units = number mod 10
    val tens = number div 10 mod 10
  in
    if units = 1 andalso tens <> 1 then "st"
    else if units = 2 andalso tens <> 1 then "nd"
    else if units = 3 andalso tens <> 1 then "rd"
    else "th"
  end;

fun format name number =
  String.concat [
    name,
    ", you are the ",
    (Int.toString number),
    (suffix number),
    " customer we serve today. Thank you!"
  ]
