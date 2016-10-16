use "example.sml";

val test_cases = [
    ( ""      ,  ["enlists", "google", "inlets", "banana"], []         ),
    ( "listen",                                         [], []         ),
    ( "listen",  ["enlists", "google", "inlets", "banana"], ["inlets"] ),
    ( "hatreds", ["dearths","hardest","salmon","devilish", "threads"], ["dearths","hardest","threads"] )
];

fun run_tests [] = []
  | run_tests ((word,candidateList,expected)::ts) =
       (anagram word candidateList = expected) :: run_tests ts
                                                         
val allTestsPass = List.foldl (fn (x,y) => x andalso y) true (run_tests test_cases)                                                 

    
