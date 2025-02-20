fun recite (startVerse: int, endVerse: int): string =
  let
    val animals = [ "", "fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse" ]

    val animal = List.nth (animals, startVerse)

    val exclamations = [
      "",
      "I don't know why she swallowed the fly. Perhaps she'll die.",
      "It wriggled and jiggled and tickled inside her.\n",
      "How absurd to swallow a bird!\n",
      "Imagine that, to swallow a cat!\n",
      "What a hog, to swallow a dog!\n",
      "Just opened her throat and swallowed a goat!\n",
      "I don't know how she swallowed a cow!\n",
      "She's dead, of course!"
    ]

    val exclamation = List.nth (exclamations, startVerse)

    fun loop (index: int): string =
      let
        val current = List.nth (animals, index)

        val previous = List.nth (animals, index - 1) ^ (if index = 3 then " that wriggled and jiggled and tickled inside her" else "")

        val suffix = if index = 2 then List.nth (exclamations, 1) else loop (index - 1)
      in
        "She swallowed the " ^ current ^ " to catch the " ^ previous ^ ".\n" ^ suffix
      end

    val reasons = (if startVerse = 1 orelse startVerse = 8 then "" else loop(startVerse))

    val suffix = if startVerse = endVerse then "" else "\n\n" ^ recite (startVerse + 1, endVerse)
  in
    "I know an old lady who swallowed a " ^ animal ^ ".\n" ^ exclamation ^ reasons ^ suffix
  end
