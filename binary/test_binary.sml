use "example.sml";

val test_cases = [
    ("0",          0),
    ("01",         1),
    ("10",         2),
    ("11",         3),
    ("100",        4),
    ("1111",      15),
    ("10000000", 128)
];

val error_test_cases = [
    ("",     EmptyBinaryStringFound),
    ("200",  NonBinaryDigitFound),
    ("a62b", NonBinaryDigitFound)
];

fun run_tests [] = []
  | run_tests ((bin_string,expected)::ts) =
       (binaryToDecimal bin_string = expected) :: run_tests ts

fun run_error_tests [] = []
  | run_error_tests ((bin_string,expected: exn)::ts) =
       (binaryToDecimal bin_string handle expected => 1) :: run_error_tests ts

val allNormalTestsPass =
    List.foldl (fn (x,y) => x andalso y) true (run_tests test_cases)
val allErrorTestsPass =
    (List.foldl (fn (x,y) => x + y) 0 (run_error_tests error_test_cases)) = length error_test_cases
val allTestsPass = allNormalTestsPass andalso allErrorTestsPass
    
