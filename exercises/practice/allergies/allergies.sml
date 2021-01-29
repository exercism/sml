datatype allergen = Eggs
                  | Peanuts
                  | Shellfish
                  | Strawberries
                  | Tomatoes
                  | Chocolate
                  | Pollen
                  | Cats

fun allergicTo (score: int) (a: allergen): bool =
  raise Fail "'allergicTo' is not implemented"

fun allergies (score: int): allergen list =
  raise Fail "'allergies' is not implemented"
