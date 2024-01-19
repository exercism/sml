local
  fun stripFirstCharacter (s: string): string =
    substring (s, 1, size s - 1)

  fun stripLastCharacter (s: string): string =
    substring (s, 0, size s - 1)

  fun parseNumber (s: string): int option =
    if String.isPrefix "-" s then
      case parseNumber (stripFirstCharacter s) of
          NONE => NONE
        | SOME n => SOME (~n)
    else
      case Int.fromString s of
          NONE => NONE
        | SOME n =>
            if Int.toString n = s then SOME n
            else NONE

  fun consumeOperator (left: int) (words: string list): int option =
    case words of
        nil => SOME left
      | "plus" :: rest => consumeNumber left (op +) rest
      | "minus" :: rest => consumeNumber left (op -) rest
      | "multiplied" :: "by" :: rest => consumeNumber left (op *) rest
      | "divided" :: "by" :: rest => consumeNumber left (op div) rest
      | _ => NONE

  and consumeNumber (left: int) (operator: (int * int) -> int) (words: string list): int option =
    case words of
        nil => NONE
      | right :: rest =>
          case parseNumber right of
              NONE => NONE
            | SOME n => consumeOperator (operator (left, n)) rest

  fun consumeWhatIs (words: string list): int option =
    case words of
        "What" :: "is" :: rest => consumeNumber 0 (op +) rest
      | _ => NONE

  val splitWords: string -> string list =
    String.tokens (fn (c: char) => c = #" ")
in
  fun answer (question: string): int option =
    if String.isSuffix "?" question then (consumeWhatIs o splitWords o stripLastCharacter) question
    else NONE
end
