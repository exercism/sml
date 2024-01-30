local
  fun repeat 0 (ch: char): char list = nil
    | repeat (n: int) (ch: char): char list = ch :: repeat (n - 1) ch

  fun uncompress (n: int) (nil: char list) = nil
    | uncompress (n: int) (hd :: tl): char list =
        if Char.isDigit hd then uncompress (n * 10 + ord hd - ord #"0") tl
        else if n = 0 then hd :: uncompress 0 tl
        else repeat n hd @ uncompress 0 tl
in
  val decode: string -> string =
    implode o uncompress 0 o explode
end

local
  fun encodeRun (n: int, ch: char): char list =
    if n = 1 then [ch]
    else explode (Int.toString n) @ [ch]

  fun compress (n: int, ch: char) (nil: char list) =
        encodeRun (n, ch)
    | compress (n: int, ch: char) (hd :: tl): char list =
        if ch = hd then compress (n + 1, ch) tl
        else encodeRun (n, ch) @ compress (1, hd) tl
in
  fun encode (phrase: string): string =
    if size phrase = 0 then phrase
    else (implode o compress (0, String.sub(phrase, 0)) o explode) phrase
end
