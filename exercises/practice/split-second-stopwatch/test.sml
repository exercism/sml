(* version 1.0.0 *)

use "testlib.sml";
use "split-second-stopwatch.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "split-second-stopwatch" [
    test "new stopwatch starts in ready state"
      (fn _ => let
        val sw = newStopwatch ()
      in
        getState sw |> Expect.equalTo Ready
      end),

    test "new stopwatch's current lap has no elapsed time"
      (fn _ => let
        val sw = newStopwatch ()
      in
        currentLap sw |> Expect.equalTo "00:00:00"
      end),

    test "new stopwatch's total has no elapsed time"
      (fn _ => let
        val sw = newStopwatch ()
      in
        total sw |> Expect.equalTo "00:00:00"
      end),

    test "new stopwatch does not have previous laps"
      (fn _ => let
        val sw = newStopwatch ()
      in
        previousLaps sw |> Expect.equalTo []
      end),

    test "start from ready state changes state to running"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
      in
        getState sw |> Expect.equalTo Running
      end),

    test "start does not change previous laps"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
      in
        previousLaps sw |> Expect.equalTo []
      end),

    test "start initiates time tracking for current lap"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:00:05")
      in
        currentLap sw |> Expect.equalTo "00:00:05"
      end),

    test "start initiates time tracking for total"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:00:23")
      in
        total sw |> Expect.equalTo "00:00:23"
      end),

    test "start cannot be called from running state"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
      in
        (fn _ => start sw) |> Expect.error (Fail "cannot start an already running stopwatch")
      end),

    test "stop from running state changes state to stopped"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = stop sw
      in
        getState sw |> Expect.equalTo Stopped
      end),

    test "stop pauses time tracking for current lap"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:00:05")
        val sw = stop sw
        val sw = advanceTime (sw, "00:00:08")
      in
        currentLap sw |> Expect.equalTo "00:00:05"
      end),

    test "stop pauses time tracking for total"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:00:13")
        val sw = stop sw
        val sw = advanceTime (sw, "00:00:44")
      in
        total sw |> Expect.equalTo "00:00:13"
      end),

    test "stop cannot be called from ready state"
      (fn _ => let
        val sw = newStopwatch ()
      in
        (fn _ => stop sw) |> Expect.error (Fail "cannot stop a stopwatch that is not running")
      end),

    test "stop cannot be called from stopped state"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = stop sw
      in
        (fn _ => stop sw) |> Expect.error (Fail "cannot stop a stopwatch that is not running")
      end),

    test "start from stopped state changes state to running"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = stop sw
        val sw = start sw
      in
        getState sw |> Expect.equalTo Running
      end),

    test "start from stopped state resumes time tracking for current lap"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:01:20")
        val sw = stop sw
        val sw = advanceTime (sw, "00:00:20")
        val sw = start sw
        val sw = advanceTime (sw, "00:00:08")
      in
        currentLap sw |> Expect.equalTo "00:01:28"
      end),

    test "start from stopped state resumes time tracking for total"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:00:23")
        val sw = stop sw
        val sw = advanceTime (sw, "00:00:44")
        val sw = start sw
        val sw = advanceTime (sw, "00:00:09")
      in
        total sw |> Expect.equalTo "00:00:32"
      end),

    test "lap adds current lap to previous laps"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:01:38")
        val sw = lap sw
        val sw = advanceTime (sw, "00:00:44")
        val sw = lap sw
      in
        previousLaps sw |> Expect.equalTo ["00:01:38", "00:00:44"]
      end),

    test "lap resets current lap and resumes time tracking"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:08:22")
        val sw = lap sw
        val sw = advanceTime (sw, "00:00:15")
      in
        currentLap sw |> Expect.equalTo "00:00:15"
      end),

    test "lap continues time tracking for total"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:00:22")
        val sw = lap sw
        val sw = advanceTime (sw, "00:00:33")
      in
        total sw |> Expect.equalTo "00:00:55"
      end),

    test "lap cannot be called from ready state"
      (fn _ => let
        val sw = newStopwatch ()
      in
        (fn _ => lap sw) |> Expect.error (Fail "cannot lap a stopwatch that is not running")
      end),

    test "lap cannot be called from stopped state"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = stop sw
      in
        (fn _ => lap sw) |> Expect.error (Fail "cannot lap a stopwatch that is not running")
      end),

    test "stop does not change previous laps"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:11:22")
        val sw = lap sw
        val sw = stop sw
      in
        previousLaps sw |> Expect.equalTo ["00:11:22"]
      end),

    test "reset from stopped state changes state to ready"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = stop sw
        val sw = reset sw
      in
        getState sw |> Expect.equalTo Ready
      end),

    test "reset resets current lap"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:00:10")
        val sw = stop sw
        val sw = reset sw
      in
        currentLap sw |> Expect.equalTo "00:00:00"
      end),

    test "reset clears previous laps"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "00:00:10")
        val sw = lap sw
        val sw = advanceTime (sw, "00:00:20")
        val sw = lap sw
        val sw = stop sw
        val sw = reset sw
      in
        previousLaps sw |> Expect.equalTo []
      end),

    test "reset cannot be called from ready state"
      (fn _ => let
        val sw = newStopwatch ()
      in
        (fn _ => reset sw) |> Expect.error (Fail "cannot reset a stopwatch that is not stopped")
      end),

    test "reset cannot be called from running state"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
      in
        (fn _ => reset sw) |> Expect.error (Fail "cannot reset a stopwatch that is not stopped")
      end),

    test "supports very long laps"
      (fn _ => let
        val sw = newStopwatch ()
        val sw = start sw
        val sw = advanceTime (sw, "01:23:45")
        val sw = lap sw
        val sw = advanceTime (sw, "04:01:40")
        val sw = lap sw
        val sw = advanceTime (sw, "08:43:05")
        val sw = lap sw
      in
        previousLaps sw |> Expect.equalTo ["01:23:45", "04:01:40", "08:43:05"]
      end)
  ]

val _ = Test.run testsuite
