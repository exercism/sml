use "nth-prime.sml";

val test_cases = [
  {
    description = "The first prime is 2",
    input = 1,
    expected = 2
  },
  {
    description = "The second prime is 3",
    input = 2,
    expected = 3
  },
  {
    description = "The ninth prime is 23",
    input = 9,
    expected = 23
  },
  {
    description = "The one-hundredth prime is 541",
    input = 1,
    expected = 2
  },
  {
    description = "The three-thousand and first prime is 27457",
    input = 3001,
    expected = 27457
  }
];

val error_test_cases = [
  {
    description = "The 0th prime is not defined",
    input = 0,
    expected = Domain
  },
  {
    description = "The -1st prime is not defined",
    input = ~1,
    expected = Domain
  }
];

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

fun evaluateGoodTestCase f { description, input, expected } =
  { description = description, is_correct = (f input) = expected }

fun evaluateErrorTestCase f { description, input, expected } =
  { description = description, is_correct = (f input handle expected => 1) = 1 }

val testResults = run_tests nthPrime (List.map (evaluateGoodTestCase nthPrime) test_cases)
  @ run_tests nthPrime (List.map (evaluateErrorTestCase nthPrime) error_test_cases);
val passedTests = List.filter (fn x => x) testResults;
val failedTests = List.filter (fn x => not x) testResults;

if (List.length testResults) = (List.length passedTests)
then (print "ALL TESTS PASSED")
else (print (Int.toString (List.length failedTests) ^ " TEST(S) FAILED"));
