local
  val lines: string -> string list =
    String.tokens (fn (c: char) => c = #"\n")

  val cells: string -> string list =
    String.tokens (fn (c: char) => c = #" ")

    fun extract (index: int) (l: string list): string =
      List.nth (l, index - 1)
in
  fun row (s: string, index: int): int list =
    map (valOf o Int.fromString) ((cells o extract index o lines) s)

  fun column (s: string, index: int): int list =
    map (valOf o Int.fromString o extract index o cells) (lines s)
end
