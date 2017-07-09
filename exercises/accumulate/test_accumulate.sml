use "accumulate.sml";

val test_cases = [
    {
      description = "Applying a function the empty-list ([]) does nothing",
      input       = [],
      function    = fn x => x,
      expected    = []
    },
    {
      description = "Applying a square function to [1,2,3] produces [1,4,9]",
      input       = [1, 2, 3],
      function    = fn x => x*x,
      expected    = [1, 4, 9]
    },
    {
      description = "Applying a cube function to[1,2,3] produces [1,8,27]",
      input       = [1, 2, 3],
      function    = fn x => x*x*x,
      expected    = [1, 8, 27]
    },
    {
      description = "Applying an increment function to [1,2,3] produces [2,3,4]",
      input       = [1, 2, 3],
      function    = fn x => x+1,
      expected    = [2, 3, 4]
    },
    {
      description = "Applying an decrement function to [1,2,3] produces [0,1,2]",
      input       = [1, 2, 3],
      function    = fn x => x-1,
      expected    = [0, 1, 2]
    }
];

fun run_tests _ [] = []
  | run_tests f (x :: xs) =
      let
        fun aux { description, input, function, expected } =
          let
            val output = f function input
            val is_correct = output = expected
            val expl = description ^ ": " ^
              (if is_correct then "PASSED" else "FAILED") ^ "\n"
          in
            (print (expl); is_correct)
          end
      in
        (aux x) :: run_tests f xs
      end

val testResults = run_tests accumulate test_cases;
val passedTests = List.filter (fn x => x) testResults;
val failedTests = List.filter (fn x => not x) testResults;

if (List.length testResults) = (List.length passedTests)
then (print "ALL TESTS PASSED")
else (print (Int.toString (List.length failedTests) ^ " TEST(S) FAILED"));
