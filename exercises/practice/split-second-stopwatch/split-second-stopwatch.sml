datatype state = Ready | Running | Stopped

type stopwatch = unit (* design your own type *)

fun newStopwatch (): stopwatch =
  raise Fail "'newStopwatch' is not implemented"

fun start (sw: stopwatch): stopwatch =
  raise Fail "'start' is not implemented"

fun stop (sw: stopwatch): stopwatch =
  raise Fail "'stop' is not implemented"

fun lap (sw: stopwatch): stopwatch =
  raise Fail "'lap' is not implemented"

fun reset (sw: stopwatch): stopwatch =
  raise Fail "'reset' is not implemented"

fun advanceTime (sw: stopwatch, dt: string): stopwatch =
  raise Fail "'advanceTime' is not implemented"

fun getState (sw: stopwatch): state =
  raise Fail "'getState' is not implemented"

fun currentLap (sw: stopwatch): string =
  raise Fail "'currentLap' is not implemented"

fun total (sw: stopwatch): string =
  raise Fail "'total' is not implemented"

fun previousLaps (sw: stopwatch): string list =
  raise Fail "'previousLaps' is not implemented"
