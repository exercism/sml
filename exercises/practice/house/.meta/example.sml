fun recite (startVerse: int, endVerse: int): string =
  let
    val offsets = [ 0, 389, 368, 351, 331, 310, 267, 232, 190, 145, 99, 62, 8 ]

    val offset = List.nth (offsets, startVerse)

    val lyrics = "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."

    val lyric = String.substring (lyrics, offset, String.size lyrics - offset)

    val suffix = if startVerse = endVerse then "" else "\n" ^ recite (startVerse + 1, endVerse)
  in
    "This is " ^ lyric ^ suffix
  end
