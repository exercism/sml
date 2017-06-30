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
   Given a code (integer) and an allergen returns true if the person
   represented by the code is allergic to the specified allergen
*)
fun allergic_to code a =
    let fun testAllergy code n =
            let val codeWord = Word.fromInt(code)
                val nWord    = Word.fromInt(n)
                val oneWord  = Word.fromInt(1)
            in  (* ((code >> n) & 1) == 1 *)
                oneWord = Word.andb(
                    Word.>>(codeWord, nWord),
                    oneWord
                )
            end
    in
        testAllergy code (valueOf a)
    end

(* allergies = fn: int -> allergen list
   Given a code that represents a person's allergies
   return a list of all allergens that they are allergic to
*)
fun list code =
    List.filter (allergic_to code) [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]
