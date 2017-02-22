use "raindrops.sml";

val test_cases = [
  {
    description = "3, 5, and 7 are not factors of 1",
    input = 1,
    expected = "1"
  },
  {
    description = "3 is a factor of 3",
    input = 3,
    expected = "Pling"
  },
  {
    description = "5 is a factor of 5",
    input = 5,
    expected = "Plang"
  },
  {
    description = "7 is a factor of 7",
    input = 7,
    expected = "Plong"
  },
  {
    description = "3 is a factor of 6",
    input = 6,
    expected = "Pling"
  },
  {
    description = "3, 5, and 7 are not factors of 8",
    input = 8,
    expected = "8"
  },
  {
    description = "3 is a factor of 9",
    input = 9,
    expected = "Pling"
  },
  {
    description = "5 is a factor of 10",
    input = 10,
    expected = "Plang"
  },
  {
    description = "7 is a factor of 14",
    input = 14,
    expected = "Plong"
  },
  {
    description = "3 and 5 are factors of 15",
    input = 15,
    expected = "PlingPlang"
  },
  {
    description = "3 and 7 are factors of 21",
    input = 21,
    expected = "PlingPlong"
  },
  {
    description = "5 is a factor of 25",
    input = 25,
    expected = "Plang"
  },
  {
    description = "3 is factor of 27",
    input = 27,
    expected = "Pling"
  },
  {
    description = "5 and 7 are factors of 35",
    input = 35,
    expected = "PlangPlong"
  },
  {
    description = "7 is a factor of 49",
    input = 49,
    expected = "Plong"
  },
  {
    description = "3, 5, and 7 are not factors of 52",
    input = 52,
    expected = "52"
  },
  {
    description = "3, 5, and 7 are factors of 105",
    input = 105,
    expected = "PlingPlangPlong"
  },
  {
    description = "5 is a factor of 3125",
    input = 3125,
    expected = "Plang"
  }
]

fun run_tests _ [] = []
  | run_tests f (x :: xs) =
      let
        fun aux { description, input, expected } =
          let
            val output = f input
            val is_correct = output = expected
            val expl = description ^ ": " ^
              (if is_correct then "PASSED" else "FAILED") ^ "\n"
          in
            (print (expl); is_correct)
          end
      in
        (aux x) :: run_tests f xs
      end

val testResults = run_tests raindrops test_cases;
val passedTests = List.filter (fn x => x) testResults;
val failedTests = List.filter (fn x => not x) testResults;

if (List.length testResults) = (List.length passedTests)
then (print "ALL TESTS PASSED")
else (print (Int.toString (List.length failedTests) ^ " TEST(S) FAILED"));
