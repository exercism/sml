fun plants (diagram: string) (student: string): string list =
  let
    val index = ord (String.sub (student, 0)) - ord #"A"

    val first = 2 * index
    val second = 2 * index + 1
    val third = (1 + size diagram) div 2 + 2 * index
    val fourth = (1 + size diagram) div 2 + 2 * index + 1

    fun plant (place: int): string =
      let
        val c = String.sub (diagram, place)
      in
        if c = #"G" then "grass"
        else if c = #"C" then "clover"
        else if c = #"R" then "radishes"
        else if c = #"V" then "violets"
        else raise Fail "unknown plant"
      end
  in
    [plant first, plant second, plant third, plant fourth]
  end
