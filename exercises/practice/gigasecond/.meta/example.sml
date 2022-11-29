exception ParseDateError of string


(** Parses a Date.date from a prefix of a string. The prefix should
have format "%Y-%m-%dT%H:%M:%S" orelse "%Y-%m-%d". In the latter case
the rest should not start with 'T'. Otherwise it throws a
ParseDateError. **)
fun parse_date (s: string) =
    let
      fun char_reader (s: string) = SOME (String.sub (s, 0), String.extract (s, 1, NONE))
                                    handle Subscript => NONE
      val int_reader = Int.scan StringCvt.DEC char_reader

      fun skip_char (c: char) (s: string) =
          case char_reader s of
              SOME (c', s') => if c = c' then s'
                               else raise ParseDateError ("Expected '" ^ Char.toString c
                                                          ^ "' got '" ^ Char.toString c' ^ "'")
            | NONE => raise ParseDateError "Expected character got nothing"
      fun parse_int (s: string) =
          case int_reader s of
              SOME (i, s') => (i, s')
            | NONE => raise ParseDateError "Expected integer"

      fun toMonth (m: int) =
          case m of
              1 => Date.Jan
            | 2 => Date.Feb
            | 3 => Date.Mar
            | 4 => Date.Apr
            | 5 => Date.May
            | 6 => Date.Jun
            | 7 => Date.Jul
            | 8 => Date.Aug
            | 9 => Date.Sep
            | 10 => Date.Oct
            | 11 => Date.Nov
            | 12 => Date.Dec
            | _ => raise ParseDateError "Expected month to be between 1 and 12"

      val (year, s1) = parse_int s
      val s2 = skip_char #"-" s1
      val (month, s3) = parse_int s2
      val s4 = skip_char #"-" s3
      val (day, s5) = parse_int s4

      exception NoHMS
      val { hour, minute, second } =
          let
            val s6 = skip_char #"T" s5 handle ParseDateError _ => raise NoHMS
            val (hour, s7) = parse_int s6
            val s8 = skip_char #":" s7
            val (minute, s9) = parse_int s8
            val s10 = skip_char #":" s9
            val (second, _) = parse_int s10 (* ignore the rest *)
          in
            { hour = hour, minute = minute, second = second }
          end
          handle NoHMS => { hour = 0, minute = 0, second = 0 }
    in
      Date.date {
        year = year, month = toMonth month, day = day,
        hour = hour, minute = minute, second = second,
        offset = SOME Time.zeroTime (* universal time *)
      }
    end


fun add (moment: string): string =
    let
      val moment_date = parse_date moment
      val offset = Time.fromSeconds 1000000000 (* 1e9 seconds *)
      val future_time = Time.+ (Date.toTime moment_date, offset)
      val future_date = Date.fromTimeUniv future_time
    in
      Date.fmt "%Y-%m-%dT%H:%M:%S" future_date
    end
