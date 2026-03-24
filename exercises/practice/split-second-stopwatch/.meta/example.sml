datatype state = Ready | Running | Stopped

type stopwatch = {mode: state, elapsed: int, history: int list}

fun parseTime (str: string): int =
  let
    val h = valOf (Int.fromString (String.substring (str, 0, 2)))
    val m = valOf (Int.fromString (String.substring (str, 3, 2)))
    val s = valOf (Int.fromString (String.substring (str, 6, 2)))
  in
    h * 3600 + m * 60 + s
  end

fun formatTime (t: int): string =
  let
    val h = t div 3600
    val m = (t mod 3600) div 60
    val s = t mod 60
    fun pad n = if n < 10 then "0" ^ Int.toString n else Int.toString n
  in
    (pad h) ^ ":" ^ (pad m) ^ ":" ^ (pad s)
  end

fun newStopwatch (): stopwatch =
  {mode = Ready, elapsed = 0, history = []}

fun start (sw: stopwatch): stopwatch =
  case #mode sw of
    Running => raise Fail "cannot start an already running stopwatch"
  | _ => {mode = Running, elapsed = #elapsed sw, history = #history sw}

fun stop (sw: stopwatch): stopwatch =
  case #mode sw of
    Running => {mode = Stopped, elapsed = #elapsed sw, history = #history sw}
  | _ => raise Fail "cannot stop a stopwatch that is not running"

fun lap (sw: stopwatch): stopwatch =
  case #mode sw of
    Running => {mode = Running, elapsed = 0, history = (#elapsed sw) :: (#history sw)}
  | _ => raise Fail "cannot lap a stopwatch that is not running"

fun reset (sw: stopwatch): stopwatch =
  case #mode sw of
    Stopped => newStopwatch ()
  | _ => raise Fail "cannot reset a stopwatch that is not stopped"

fun advanceTime (sw: stopwatch, dt: string): stopwatch =
  let val secs = parseTime dt
  in case #mode sw of
    Running => {mode = Running, elapsed = (#elapsed sw) + secs, history = #history sw}
  | _ => sw
  end

fun getState (sw: stopwatch): state = #mode sw

fun currentLap (sw: stopwatch): string = formatTime (#elapsed sw)

fun total (sw: stopwatch): string =
  formatTime (foldl op+ (#elapsed sw) (#history sw))

fun previousLaps (sw: stopwatch): string list = rev (map formatTime (#history sw))
