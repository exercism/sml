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
  type buffer = {
                   data : int Array.array,
                   size : int,
                   count : int ref,
                   readPtr : int ref,
                   writePtr : int ref
                }

  exception BufferFull
  exception BufferEmpty

  fun create size = {
      data = Array.array (size, 0),
      size = size,
      count = ref 0,
      readPtr = ref 0,
      writePtr = ref 0
    }

  fun read buff =
    if !(#count buff) = 0
    then raise BufferEmpty
    else let val value = Array.sub (#data buff, !(#readPtr buff))
         in  #readPtr buff := (!(#readPtr buff) + 1) mod #size buff;
             #count buff   := !(#count buff) - 1;
             value
         end

  fun write buff value =
    if !(#count buff) = #size buff
    then raise BufferFull
    else ( Array.update (#data buff, !(#writePtr buff), value);
           #writePtr buff := (!(#writePtr buff) + 1) mod #size buff;
           #count buff    := !(#count buff) + 1 )

  fun clear buff =
    ( #writePtr buff := !(#readPtr buff);
      #count buff    := 0 )

  fun overwrite buff value =
    let val _ = if !(#count buff) = #size buff
                then read buff
                else 0
    in  write buff value
    end
end

