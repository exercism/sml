datatype allergen = Eggs
                  | Peanuts
                  | Shellfish
                  | Strawberries
                  | Tomatoes
                  | Chocolate
                  | Pollen
                  | Cats

(* given a code generate a list of all allergens this code represents *)
fun list (code: int): allergen list =
  raise Fail "'list' has not been implemented"

(* given a code and an allergen return true or false
   whether the specified allergen is represented by the code *)
fun allergic_to (code: int) (a: allergen): bool =
  raise Fail "'allergic_to' has not been implemented"
