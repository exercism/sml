use "accumulate.sml";

val test_cases = [
    ( [],      (fn x => x),     []       ),
    ( [1,2,3], (fn x => x*x),   [1,4,9]  ),
    ( [1,2,3], (fn x => x*x*x), [1,8,27] ),
    ( [1,2,3], (fn x => x+1),   [2,3,4]  ),
    ( [1,2,3], (fn x => x-1),   [0,1,2]  )
];

fun run_tests [] = []
  | run_tests ((input,function,expected)::ts) =
       (accumulate input function = expected) :: run_tests ts

val allTestsPass = List.foldl (fn (x,y) => x andalso y) true (run_tests test_cases);
