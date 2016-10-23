use "example.sml";

val test_cases = [
    (   0, []             ),
    (   1, [Eggs]         ),
    (   2, [Peanuts]      ),
    (   4, [Shellfish]    ),
    (   8, [Strawberries] ),
    (  16, [Tomatoes]     ),
    (  32, [Chocolate]    ),
    (  64, [Pollen]       ),
    ( 128, [Cats]         ),
    ( 256, []             ),
    (* compound test cases *)
    (   3, [Eggs,Peanuts] ),
    (  20, [Shellfish, Tomatoes] ),
    ( 192, [Pollen, Cats]        ),
    ( 255, [Eggs, Peanuts, Shellfish, Strawberries,
            Tomatoes, Chocolate, Pollen, Cats] )
];

fun run_tests [] = []
  | run_tests ((input,expected)::ts) =
       (allergies input = expected) :: run_tests ts

val allTestsPass = List.foldl (fn (x,y) => x andalso y) true (run_tests test_cases)                                                 
