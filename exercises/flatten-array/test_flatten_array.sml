use "example.sml";
val test_cases = [
    ((Node [Leaf 1, Node [Leaf 2, Node [], Leaf 3, Node [Leaf 4, Leaf 5]]]), [1,2,3,4,5])
];

fun run_tests [] = []
  | run_tests ((input,expected)::ts) =
       (flatten input = expected) :: run_tests ts

val allTestsPass = List.foldl (fn (x,y) => x andalso y) true (run_tests test_cases);
