(* version 1.0.0 *)

use "testlib.sml";
use "piecing-it-together.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "piecing-it-together" [
    test "1000 pieces puzzle with 1.6 aspect ratio"
      (fn _ => let
        val puzzle = {pieces = SOME (1000), border = NONE, inside = NONE, rows = NONE, columns = NONE, aspectRatio = SOME ((8, 5)), format = NONE}
      in
        jigsawData puzzle |> Expect.equalTo {pieces = 1000, border = 126, inside = 874, rows = 25, columns = 40, aspectRatio = (8, 5), format = Landscape}
      end),

    test "square puzzle with 32 rows"
      (fn _ => let
        val puzzle = {pieces = NONE, border = NONE, inside = NONE, rows = SOME (32), columns = NONE, aspectRatio = NONE, format = SOME (Square)}
      in
        jigsawData puzzle |> Expect.equalTo {pieces = 1024, border = 124, inside = 900, rows = 32, columns = 32, aspectRatio = (1, 1), format = Square}
      end),

    test "400 pieces square puzzle with only inside pieces and aspect ratio"
      (fn _ => let
        val puzzle = {pieces = NONE, border = NONE, inside = SOME (324), rows = NONE, columns = NONE, aspectRatio = SOME ((1, 1)), format = NONE}
      in
        jigsawData puzzle |> Expect.equalTo {pieces = 400, border = 76, inside = 324, rows = 20, columns = 20, aspectRatio = (1, 1), format = Square}
      end),

    test "1500 pieces landscape puzzle with 30 rows and 1.6 aspect ratio"
      (fn _ => let
        val puzzle = {pieces = NONE, border = NONE, inside = NONE, rows = SOME (30), columns = NONE, aspectRatio = SOME ((5, 3)), format = NONE}
      in
        jigsawData puzzle |> Expect.equalTo {pieces = 1500, border = 156, inside = 1344, rows = 30, columns = 50, aspectRatio = (5, 3), format = Landscape}
      end),

    test "300 pieces portrait puzzle with 70 border pieces"
      (fn _ => let
        val puzzle = {pieces = SOME (300), border = SOME (70), inside = NONE, rows = NONE, columns = NONE, aspectRatio = NONE, format = SOME (Portrait)}
      in
        jigsawData puzzle |> Expect.equalTo {pieces = 300, border = 70, inside = 230, rows = 25, columns = 12, aspectRatio = (12, 25), format = Portrait}
      end),

    test "puzzle with insufficient data"
      (fn _ => let
        val puzzle = {pieces = SOME (1500), border = NONE, inside = NONE, rows = NONE, columns = NONE, aspectRatio = NONE, format = SOME (Landscape)}
      in
        (fn _ => jigsawData puzzle) |> Expect.error (Fail "Insufficient data")
      end),

    test "puzzle with contradictory data"
      (fn _ => let
        val puzzle = {pieces = NONE, border = NONE, inside = NONE, rows = SOME (100), columns = SOME (1000), aspectRatio = NONE, format = SOME (Square)}
      in
        (fn _ => jigsawData puzzle) |> Expect.error (Fail "Contradictory data")
      end)
  ]

val _ = Test.run testsuite
