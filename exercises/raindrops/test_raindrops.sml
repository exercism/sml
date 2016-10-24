use "example.sml";

val test_cases = [
  {
    number = 1,
    expected = "1"
  },
  {
    number = 3,
    expected = "Pling"
  },
  {
    number = 5,
    expected = "Plang"
  },
  {
    number = 7,
    expected = "Plong"
  },
  {
    number = 6,
    expected = "Pling"
  },
  {
    number = 8,
    expected = "8"
  },
  {
    number = 9,
    expected = "Pling"
  },
  {
    number = 10,
    expected = "Plang"
  },
  {
    number = 14,
    expected = "Plong"
  },
  {
    number = 15,
    expected = "PlingPlang"
  },
  {
    number = 21,
    expected = "PlingPlong"
  },
  {
    number = 25,
    expected = "Plang"
  },
  {
    number = 27,
    expected = "Pling"
  },
  {
    number = 35,
    expected = "PlangPlong"
  },
  {
    number = 49,
    expected = "Plong"
  },
  {
    number = 52,
    expected = "52"
  },
  {
    number = 105,
    expected = "PlingPlangPlong"
  },
  {
    number = 3125,
    expected = "Plang"
  }
]

fun run_tests _ [] = []
  | run_tests f (x :: xs) =
      let
        fun aux { number, expected } =
          let
            val output = f number
            val is_correct = output = expected
            val expl =
              "convert " ^ (Int.toString number) ^ ": " ^
              (if not is_correct then "FAILED" else "PASSED") ^ "\n"
          in
            (print (expl); is_correct)
          end
      in
        (aux x) :: run_tests f xs
      end

val allTestsPass = List.all (fn x => x) (run_tests convert test_cases)   
