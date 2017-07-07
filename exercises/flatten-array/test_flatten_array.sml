use "flatten-array.sml";

val test_cases = [
  {
    description = "[1, [2, [], 3, [4, 5]]] flattens to [1,2,3,4,5]",
    input = List [
        Elem 1,
        List [
          Elem 2,
          List [],
          Elem 3,
          List [Elem 4, Elem 5]
        ]
    ],
    expected = [1, 2, 3, 4, 5]
  },
  {
    description = "[1,2,3,4,5] flattens to [1,2,3,4,5]",
    input = List [
        Elem 1,
        Elem 2,
        Elem 3,
        Elem 4,
        Elem 5
    ],
    expected = [1, 2, 3, 4, 5]
  },
  {
    description = "[] flattens to []",
    input = List [],
    expected = []
  }
];

fun run_tests _ [] = []
  | run_tests f (x :: xs) =
      let
        fun aux { description, input, expected } =
          let
            val output = f input
            val is_correct = output = expected
            val expl = description ^ ": " ^
              (if is_correct then "PASSED" else "FAILED") ^ "\n"
          in
            (print (expl); is_correct)
          end
      in
        (aux x) :: run_tests f xs
      end

val testResults = run_tests flatten test_cases;
val passedTests = List.filter (fn x => x) testResults;
val failedTests = List.filter (fn x => not x) testResults;

if (List.length testResults) = (List.length passedTests)
then (print "ALL TESTS PASSED")
else (print (Int.toString (List.length failedTests) ^ " TEST(S) FAILED"));
