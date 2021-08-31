datatype allergen = Eggs
                  | Peanuts
                  | Shellfish
                  | Strawberries
                  | Tomatoes
                  | Chocolate
                  | Pollen
                  | Cats

(* valueOf = fn: allergen -> int
   Given an allergen returns which power of 2 it represents
   e.g. Eggs    => 0 means that Eggs    = 2^0 = 1
        Peanuts => 1 means that Peanuts = 2^1 = 2
        ...
*)
fun valueOf a =
    case a of
        Eggs         => 0
      | Peanuts      => 1
      | Shellfish    => 2
      | Strawberries => 3
      | Tomatoes     => 4
      | Chocolate    => 5
      | Pollen       => 6
      | Cats         => 7

(* allergic_to = fn : int -> allergen -> bool
   Given a score (integer) and an allergen returns true if the person
   represented by the score is allergic to the specified allergen
*)
fun allergicTo score a =
    let fun testAllergy score n =
            let val codeWord = Word.fromInt(score)
                val nWord    = Word.fromInt(n)
                val oneWord  = Word.fromInt(1)
            in  (* ((code >> n) & 1) == 1 *)
                oneWord = Word.andb(
                    Word.>>(codeWord, nWord),
                    oneWord
                )
            end
    in
        testAllergy score (valueOf a)
    end

(* allergies = fn: int -> allergen list
   Given a score that represents a person's allergies
   return a list of all allergens that they are allergic to
*)
fun allergies score =
    List.filter (allergicTo score) [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]
