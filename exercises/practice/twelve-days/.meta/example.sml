fun recite (startVerse: int, endVerse: int): string =
  let
    val ordinals = [ "", "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth" ]

    val ordinal = List.nth (ordinals, startVerse)

    val offsets = [ 0, 235, 213, 194, 174, 157, 137, 113, 90, 69, 48, 26, 0 ]

    val offset = List.nth (offsets, startVerse)

    val gifts = "twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."

    val gift = String.substring (gifts, offset, String.size gifts - offset)

    val suffix = if startVerse = endVerse then "" else "\n" ^ recite (startVerse + 1, endVerse)
  in
    "On the " ^ ordinal ^ " day of Christmas my true love gave to me: " ^ gift ^ suffix
  end
