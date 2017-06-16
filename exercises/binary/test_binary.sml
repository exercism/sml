use "binary.sml";

val test_cases = [
  {
    description = "binary 0 is decimal 0",
    input = "0",
    expected = 0
  },
  {
    description = "binary 01 is decimal 1",
    input = "01",
    expected = 1
  },
  {
    description = "binary 10 is decimal 2",
    input = "10",
    expected = 2
  },
  {
    description = "binary 11 is decimal 3",
    input = "11",
    expected = 3
  },
  {
    description = "binary 100 is decimal 4",
    input = "100",
    expected = 4
  },
  {
    description = "binary 1111 is decimal 15",
    input = "1111",
    expected = 15
  },
  {
    description = "binary 10000000 is decimal 128",
    input = "10000000",
    expected = 128
  },
  {
    description = "binary 11111111 is decimal 255",
    input = "11111111",
    expected = 255
  }
];

val error_test_cases = [
  {
    description = "empty string returns an EmptyBinaryStringFound exception",
    input = "",
    expected = EmptyBinaryStringFound
  },
  {
    description = "2 throws a NonBinaryDigitFound exception",
    input = "200",
    expected = NonBinaryDigitFound
  },
  {
    description = "hexadecimal string returns an NonBinaryDigitFound exception",
    input = "a62b",
    expected = NonBinaryDigitFound
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

val testResults = run_tests binaryToDecimal (List.map (evaluateGoodTestCase binaryToDecimal) test_cases)
  @ run_tests binaryToDecimal (List.map (evaluateErrorTestCase binaryToDecimal) error_test_cases);
val passedTests = List.filter (fn x => x) testResults;
val failedTests = List.filter (fn x => not x) testResults;

if (List.length testResults) = (List.length passedTests)
then (print "ALL TESTS PASSED")
else (print (Int.toString (List.length failedTests) ^ " TEST(S) FAILED"));
