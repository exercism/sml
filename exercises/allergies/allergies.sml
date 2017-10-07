datatype allergen = Eggs
                | Peanuts
                | Shellfish
                | Strawberries
                | Tomatoes
                | Chocolate
                | Pollen
                | Cats

fun allergicTo (score: int) (a: allergen) : bool =
  raise Fail "'allergicTo' is not implemented"

fun list (score: int): allergen list =
  raise Fail "'list' is not implemented"