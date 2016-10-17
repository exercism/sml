use "octal.sml";

val test_cases = [
  ("233", 155),
  ("0",   0),
  ("7",   7),
  ("007", 7)
];

val error_test_cases = [
  ("23a",      InvalidOctal),
  ("abc",      InvalidOctal),
  ("12345678", InvalidOctal),
  ("213:[]",   InvalidOctal),
  ("",         InvalidOctal)
];

fun run_tests [] = []
  | run_tests ((input, expected) :: ts) =
       (octalToDecimal input = expected) :: run_tests ts

fun run_error_tests [] = []
  | run_error_tests ((input, expected) :: ts) =
       (octalToDecimal input handle expected => 1) :: run_error_tests ts

val allNormalTestsPass =
  List.foldl (fn (x, y) => x andalso y) true (run_tests test_cases)

val allErrorTestsPass =
  (List.foldl (fn (x, y) => x + y) 0 (run_error_tests error_test_cases)) = length error_test_cases

val allTestsPass = allNormalTestsPass andalso allErrorTestsPass
