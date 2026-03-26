datatype format = Portrait | Square | Landscape

type partialInfo = {
  pieces: int option,
  border: int option,
  inside: int option,
  rows: int option,
  columns: int option,
  aspectRatio: (int * int) option,
  format: format option
}

type fullInfo = {
  pieces: int,
  border: int,
  inside: int,
  rows: int,
  columns: int,
  aspectRatio: int * int,
  format: format
}

fun jigsawData (puzzle: partialInfo): fullInfo =
  raise Fail "'jigsawData' is not implemented"
