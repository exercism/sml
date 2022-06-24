fun reverse (value: string): string =
  let
    fun shovel ([], rs) = rs
      | shovel (x :: xs, rs) = shovel (xs, x :: rs)

    fun list_reverse xs = shovel (xs, [])
  in
    String.implode (list_reverse (String.explode value))
  end;
