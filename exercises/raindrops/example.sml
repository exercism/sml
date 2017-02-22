fun raindrops (n: int): string =
  let
    fun f m s = if n mod m = 0 then s else ""
    val sound = String.concat [f 3 "Pling", f 5 "Plang", f 7 "Plong"]
  in
    if sound = ""
    then Int.toString n
    else sound
  end
