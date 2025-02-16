local
  fun recurse (previous: string, inputs: string list): string =
    case inputs of
        nil => ""
      | current :: rest => "For want of a " ^ previous ^ " the " ^ current ^ " was lost.\n" ^ (recurse (current, rest))
in
  fun recite nil = ""
    | recite (first :: rest) = (recurse (first, rest)) ^ "And all for the want of a " ^ first ^ "."
end
