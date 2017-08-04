use "hamming.sml";

val test_cases = [
  {
    description = "'GAGCCTACTAACGGGAT' is 7 away from 'CATCGTAATGACGGCCT'",
    input = ("GAGCCTACTAACGGGAT","CATCGTAATGACGGCCT"),
    expected = 7
  },
  {
    description = "'CAT' is 3 away from 'DOG'",
    input = ("CAT","DOG"),
    expected = 3
  },
  {
    description = "'DEPOSIT' is 4 away from 'DOPIEST'",
    input = ("DEPOSIT","DOPIEST"),
    expected = 4
  }
];

val error_test_cases = [
  {
    description = "throws error on unequal length strings",
    input = ("", "A"),
    expected = NonEqualLengthStringsFound
  },
  {
    description = "throws error on unequal length strings",
    input = ("A", ""),
    expected = NonEqualLengthStringsFound
  },
  {
    description = "throws error on unequal length strings",
    input = ("ABCD", "ABC"),
    expected = NonEqualLengthStringsFound
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

val testResults = run_tests hamming (List.map (evaluateGoodTestCase hamming) test_cases)
  @ run_tests hamming (List.map (evaluateErrorTestCase hamming) error_test_cases);
val passedTests = List.filter (fn x => x) testResults;
val failedTests = List.filter (fn x => not x) testResults;

if (List.length testResults) = (List.length passedTests)
then (print "ALL TESTS PASSED")
else (print (Int.toString (List.length failedTests) ^ " TEST(S) FAILED"));