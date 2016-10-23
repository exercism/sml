use "example.sml";

val test_cases = [
    (1, 2),
    (2, 3),
    (9, 23),
    (100, 541)
];

fun run_tests [] = []
  | run_tests ((n, expected)::ts) =
       (nthPrime n = expected) :: run_tests ts
                                                         
val allTestsPass = List.foldl (fn (x,y) => x andalso y) true (run_tests test_cases);
