fun green (bottles: int): string =
  let
    val numbers = [ "No", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten" ]

    val number = List.nth (numbers, bottles)

    val plural = if bottles = 1 then "" else "s"
  in
    number ^ " green bottle" ^ plural
  end

fun verse (currentBottles: int): string =
  let
    val first = green(currentBottles) ^ " hanging on the wall,\n"

    val third = "And if one green bottle should accidentally fall,\n"

    val fourth = "There'll be " ^ String.map Char.toLower (green(currentBottles - 1)) ^ " hanging on the wall."
  in
    first ^ first ^ third ^ fourth
  end

fun recite (startBottles: int, takeDown: int): string =
  let
    val suffix = if takeDown = 1 then "" else "\n\n" ^ recite (startBottles - 1, takeDown - 1)
  in
    verse(startBottles) ^ suffix
  end
