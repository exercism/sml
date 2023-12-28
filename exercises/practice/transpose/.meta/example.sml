fun transpose (lines: string list): string list =
  let
    fun spaces (n: int): string =
      if n = 0 then ""
      else " " ^ spaces (n -1)

    fun generateLine (index: int): string =
      let
        fun recurse (gap: int) (remaining: string list): string =
          case remaining of
              nil => ""
            | first :: rest =>
                if index >= size first then recurse (gap + 1) rest
                else (spaces gap) ^ (String.substring(first, index, 1)) ^ (recurse 0 rest)
      in
        recurse 0 lines
      end

    fun generateLines (index: int): string list =
      let
        val line = generateLine index
      in
        if line = "" then nil
        else line :: generateLines (index + 1)
      end
  in
    generateLines 0
end

