use "anagram.sml";

val test_cases = [
  {
    description = "The empty string is not an anagram of anything",
    input = "",
    candidates = ["enlists", "google", "inlets", "banana"],
    expected = []
  },
  {
    description = "A starting word with no candidates returns an empty array",
    input = "listen",
    candidates = [],
    expected = []
  },
  {
    description = "'listen' is an anagram of 'inlets'",
    input = "listen",
    candidates = ["enlists", "google", "inlets", "banana"],
    expected = ["inlets"]
  },
  {
    description = "'hatreds' is an anagram of 'dearths', 'hardest', and 'threads'",
    input = "hatreds",
    candidates = ["dearths","hardest","salmon","devilish", "threads"],
    expected = ["dearths","hardest","threads"]
  }
];

fun run_tests _ [] = []
  | run_tests f (x :: xs) =
      let
        fun aux { description, input, candidates, expected } =
          let
            val output = f input candidates
            val is_correct = output = expected
            val expl = description ^ ": " ^
              (if is_correct then "PASSED" else "FAILED") ^ "\n"
          in
            (print (expl); is_correct)
          end
      in
        (aux x) :: run_tests f xs
      end

val testResults = run_tests anagram test_cases;
val passedTests = List.filter (fn x => x) testResults;
val failedTests = List.filter (fn x => not x) testResults;

if (List.length testResults) = (List.length passedTests)
then (print "ALL TESTS PASSED")
else (print (Int.toString (List.length failedTests) ^ " TEST(S) FAILED"));


