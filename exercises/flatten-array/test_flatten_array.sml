use "flatten-array.sml";

val test_cases = [
  {
    description = "[1, [2, [], 3, [4, 5]]] flattens to [1,2,3,4,5]",
    input = Node [
        Leaf 1,
        Node [
          Leaf 2,
          Node [],
          Leaf 3,
          Node [Leaf 4, Leaf 5]
        ]
    ],
    expected = [1, 2, 3, 4, 5]
  },
  {
    description = "[1,2,3,4,5] flattens to [1,2,3,4,5]",
    input = Node [
        Leaf 1,
        Leaf 2,
        Leaf 3,
        Leaf 4,
        Leaf 5
    ],
    expected = [1, 2, 3, 4, 5]
  },
  {
    description = "[] flattens to []",
    input = Node [],
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