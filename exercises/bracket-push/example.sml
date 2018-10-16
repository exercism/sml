datatype ('a, 'b) either = Left of 'a | Right of 'b

fun foldUntil f finish e0 s =
  let fun go i e =
        if i < size s
        then case f (e, String.sub (s, i)) of
                 Left done => done
               | Right e' => go (i+1) e'
        else finish e
  in go 0 e0 end

fun balance (stack, c) =
  if c = #"[" orelse c = #"{" orelse c = #"(" then Right (c::stack) else
  case (stack, c) of
      (#"["::bs, #"]") => Right bs
    | (#"{"::bs, #"}") => Right bs
    | (#"("::bs, #")") => Right bs
    | _ => if c = #"]" orelse c = #"}" orelse c = #")" then Left false else Right stack

fun isEmpty [] = true
  | isEmpty _ = false

val isBalanced =
    foldUntil balance isEmpty []
