datatype tree = Empty | Node of string * tree * tree

fun treeFromTraversals (preorder: string list, inorder: string list): tree =
  let
    fun contains needle haystack = List.exists (fn x => x = needle) haystack;

    fun hasDup [] = false
      | hasDup (x :: xs) = contains x xs orelse hasDup xs

    fun validate () =
      if hasDup preorder
         orelse hasDup inorder
      then raise Fail "traversals must contain unique items"
      else if length preorder <> length inorder
      then raise Fail "traversals must have the same length"
      else if List.exists (fn x => not (contains x preorder)) inorder
      then raise Fail "traversals must have the same elements"
      else ()

    val preIdx = ref 0
    val inIdx = ref 0

    fun build stopBefore =
      if !inIdx = length inorder
         orelse List.nth (inorder, !inIdx) = stopBefore
      then Empty
      else
        let
          val v = List.nth (preorder, !preIdx)
        in
          preIdx := !preIdx + 1;
          let
            val left = build v
          in
            inIdx := !inIdx + 1;
            let
              val right = build stopBefore
            in
              Node (v, left, right)
            end
          end
        end
  in
    validate ();
    if null preorder
    then Empty
    else build ""
  end
