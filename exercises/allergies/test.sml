use "allergies.sml";

val test_cases = {
  list = [
    {
      description = "Code = 0 returns no allergies",
      input = 0,
      expected = []
    },
    {
      description = "Code = 1 returns allergen list of [Eggs]",
      input = 1,
      expected = [Eggs]
    },
    {
      description = "Code = 2 returns allergen list of [Peanuts]",
      input = 2,
      expected = [Peanuts]
    },
    {
      description = "Code = 4 returns allergen list of [Shellfish]",
      input = 4,
      expected = [Shellfish]
    },
    {
      description = "Code = 8 returns allergen list of [Strawberries]",
      input = 8,
      expected = [Strawberries]
    },
    {
      description = "Code = 16 returns allergen list of [Tomatoes]",
      input = 16,
      expected = [Tomatoes]
    },
    {
      description = "Code = 32 returns allergen list of [Chocolate]",
      input = 32,
      expected = [Chocolate]
    },
    {
      description = "Code = 64 returns allergen list of [Pollen]",
      input = 64,
      expected = [Pollen]
    },
    {
      description = "Code = 128 returns allergen list of [Cats]",
      input = 128,
      expected = [Cats]
    },
    {
      description = "Code = 256 returns an empty allergen list",
      input = 256,
      expected = []
    },
    (* compound tests *)
    {
      description = "Code = 3 returns allergen list of [Eggs, Peanuts]",
      input = 3,
      expected = [Eggs, Peanuts]
    },
    {
      description = "Code = 20 returns allergen list of [Shellfish, Tomatoes]",
      input = 20,
      expected = [Shellfish, Tomatoes]
    },
    {
      description = "Code = 192 returns allergen list of [Pollen, Cats]",
      input = 192,
      expected = [Pollen, Cats]
    },
    {
      description = "Code = 255 returns all allergens",
      input = 255,
      expected = [Eggs, Peanuts, Shellfish, Strawberries,Tomatoes, Chocolate, Pollen, Cats]
    }
  ],
  allergic_to = [
    {
      description = "Code = 1 is allergic to Eggs",
      input = 1,
      allergen = Eggs,
      expected = true
    },
    {
      description = "Code = 1 is not allergic to Pollen",
      input = 1,
      allergen = Pollen,
      expected = false
    },
    {
      description = "Code = 2 is allergic to Peanuts",
      input = 2,
      allergen = Peanuts,
      expected = true
    },
    {
      description = "Code = 255 is allergic to Cats",
      input = 255,
      allergen = Cats,
      expected = true
    }
  ]
};

fun run_tests _ [] = []
  | run_tests f (x :: xs) =
      let
        fun aux { description, is_correct } =
          let
            val expl = description ^ ": " ^
              (if is_correct then "PASSED" else "FAILED") ^ "\n"
          in
            (print (expl); is_correct)
          end
      in
        (aux x) :: run_tests f xs
      end

fun evaluateList f { description, input, expected } =
  { description = description, is_correct = (f input) = expected }

fun evaluateAllergicTo f { description, input, allergen, expected } =
  { description = description, is_correct = (f input allergen) = expected }

val testResults = run_tests list (List.map (evaluateList list) (#list test_cases))
  @ run_tests list (List.map (evaluateAllergicTo allergic_to) (#allergic_to test_cases));
val passedTests = List.filter (fn x => x) testResults;
val failedTests = List.filter (fn x => not x) testResults;

if (List.length testResults) = (List.length passedTests)
then (print "ALL TESTS PASSED")
else (print (Int.toString (List.length failedTests) ^ " TEST(S) FAILED"));