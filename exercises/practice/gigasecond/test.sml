use "testlib.sml";
use "gigasecond.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "gigasecond" [
    test "date only specification of time"
      (fn _ => add "2011-04-25" |> Expect.equalTo "2043-01-01T01:46:40"),

    test "second test for date only specification of time"
      (fn _ => add "1977-06-13" |> Expect.equalTo "2009-02-19T01:46:40"),

    test "third test for date only specification of time"
      (fn _ => add "1959-07-19" |> Expect.equalTo "1991-03-27T01:46:40"),

    test "full time specified"
      (fn _ => add "2015-01-24T22:00:00" |> Expect.equalTo "2046-10-02T23:46:40"),

    test "full time with day roll-over"
      (fn _ => add "2015-01-24T23:59:59" |> Expect.equalTo "2046-10-03T01:46:39")
  ]

val _ = Test.run testsuite
