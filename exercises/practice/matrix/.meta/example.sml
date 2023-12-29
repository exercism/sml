local
  fun lines (s: string): string list =
    String.tokens (fn (c: char) => c = #"\n") s

  fun cells (s: string): string list =
    String.tokens (fn (c: char) => c = #" ") s
in
  fun row (s: string, index: int): int list =
    let
      fun extract (l: string list): string =
        List.nth (l, index - 1)
    in
      map (valOf o Int.fromString) ((cells o extract o lines) s)
    end

  fun column (s: string, index: int): int list =
    let
      fun extract (l: string list): string =
        List.nth (l, index - 1)
    in
      map (valOf o Int.fromString o extract o cells) (lines s)
    end
end
