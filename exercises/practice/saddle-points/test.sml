(* version 1.0.0 *)

use "testlib.sml";
use "saddle-points.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "saddle-points" [
    test "Can identify single saddle point"
      (fn _ => let
        val matrix = [[9, 8, 7], [5, 3, 2], [6, 6, 7]]
        val expected = [{row = 2, column = 1}]
      in
        saddlePoints matrix |> Expect.equalTo expected
      end),

    test "Can identify that empty matrix has no saddle points"
      (fn _ => let
        val matrix = [[]]
        val expected = []
      in
        saddlePoints matrix |> Expect.equalTo expected
      end),

    test "Can identify lack of saddle points when there are none"
      (fn _ => let
        val matrix = [[1, 2, 3], [3, 1, 2], [2, 3, 1]]
        val expected = []
      in
        saddlePoints matrix |> Expect.equalTo expected
      end),

    test "Can identify multiple saddle points in a column"
      (fn _ => let
        val matrix = [[4, 5, 4], [3, 5, 5], [1, 5, 4]]
        val expected = [{row = 1, column = 2}, {row = 2, column = 2}, {row = 3, column = 2}]
      in
        saddlePoints matrix |> Expect.equalTo expected
      end),

    test "Can identify multiple saddle points in a row"
      (fn _ => let
        val matrix = [[6, 7, 8], [5, 5, 5], [7, 5, 6]]
        val expected = [{row = 2, column = 1}, {row = 2, column = 2}, {row = 2, column = 3}]
      in
        saddlePoints matrix |> Expect.equalTo expected
      end),

    test "Can identify saddle point in bottom right corner"
      (fn _ => let
        val matrix = [[8, 7, 9], [6, 7, 6], [3, 2, 5]]
        val expected = [{row = 3, column = 3}]
      in
        saddlePoints matrix |> Expect.equalTo expected
      end),

    test "Can identify saddle points in a non square matrix"
      (fn _ => let
        val matrix = [[3, 1, 3], [3, 2, 4]]
        val expected = [{row = 1, column = 1}, {row = 1, column = 3}]
      in
        saddlePoints matrix |> Expect.equalTo expected
      end),

    test "Can identify that saddle points in a single column matrix are those with the minimum value"
      (fn _ => let
        val matrix = [[2], [1], [4], [1]]
        val expected = [{row = 2, column = 1}, {row = 4, column = 1}]
      in
        saddlePoints matrix |> Expect.equalTo expected
      end),

    test "Can identify that saddle points in a single row matrix are those with the maximum value"
      (fn _ => let
        val matrix = [[2, 5, 3, 5]]
        val expected = [{row = 1, column = 2}, {row = 1, column = 4}]
      in
        saddlePoints matrix |> Expect.equalTo expected
      end)
  ]

val _ = Test.run testsuite
