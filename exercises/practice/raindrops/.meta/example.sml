fun convert n =
  let
    fun sound (i, s) = if n mod i = 0 then s else ""
    val sounds = [
      (3, "Pling"),
      (5, "Plang"),
      (7, "Plong")
    ]
  in
    case String.concat (List.map sound sounds) of
         "" => Int.toString n
       | s => s
  end
