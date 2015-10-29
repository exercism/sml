use "example.sml";

val test_cases = [
    (("GAGCCTACTAACGGGAT","CATCGTAATGACGGCCT"),7),
    (("CAT","DOG"), 3),
    (("DEPOSIT","DOPIEST"),4)
];

val error_test_cases = [
    (("",       "A"), NonEqualLengthStringsFound),
    (("A",       ""), NonEqualLengthStringsFound),
    (("ABCD", "ABC"), NonEqualLengthStringsFound)
];

fun run_tests [] = []
  | run_tests (((s1,s2),expected)::ts) =
       (hamming (s1,s2) = expected) :: run_tests ts

fun run_error_tests [] = []
  | run_error_tests (((s1,s2),expected)::ts) =
       (hamming (s1,s2) handle expected => 1) :: run_error_tests ts

val allNormalTestsPass =
    List.foldl (fn (x,y) => x andalso y) true (run_tests test_cases)
val allErrorTestsPass =
    (List.foldl (fn (x,y) => x + y) 0 (run_error_tests error_test_cases)) = length error_test_cases
val allTestsPass = allNormalTestsPass andalso allErrorTestsPass
    
