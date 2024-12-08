structure CircularBuffer :> sig
  type buffer

  exception BufferFull
  exception BufferEmpty

  val create : int -> buffer
  val read : buffer -> int
  val write : buffer -> int -> unit
  val clear : buffer -> unit
  val overwrite : buffer -> int -> unit
end = struct

  type buffer = unit (* TODO define the data structure *)

  exception BufferFull
  exception BufferEmpty

  fun create size =
    raise Fail "'create' is not implemented"

  fun read buff =
    raise Fail "'read' is not implemented"

  fun write buff value =
    raise Fail "'write' is not implemented"

  fun clear buff =
    raise Fail "'clear' is not implemented"

  fun overwrite buff value =
    raise Fail "'overwrite' is not implemented"
end
