fun commands (number: int): string list =
  let
    val wink = 0x1
    val doubleBlink = 0x2
    val closeYourEyes = 0x4
    val jump = 0x8
    val reverse = 0x10

    fun isChosen (action: int): bool =
      Word.andb (Word.fromInt number, Word.fromInt action) <> Word.fromInt 0

    fun conditionallyPrefix (action: int, command: string) (l: string list): string list =
      if isChosen action then command :: l
      else l

    val conditionallyWink: string list -> string list =
      conditionallyPrefix (wink, "wink")

    val conditionallyDoubleBlink: string list -> string list =
      conditionallyPrefix (doubleBlink, "double blink")

    val conditionallyCloseYourEyes: string list -> string list =
      conditionallyPrefix (closeYourEyes, "close your eyes")

    val conditionallyJump: string list -> string list =
      conditionallyPrefix (jump, "jump")

    fun conditionallyReverse l =
      if isChosen reverse then rev l
      else l
  in
    (conditionallyReverse o conditionallyWink o conditionallyDoubleBlink o conditionallyCloseYourEyes o conditionallyJump) []
  end
