structure GradeSchool :> sig
  type school

  val newSchool : unit -> school
  val add : school * string * int -> bool
  val roster : school -> string list
  val grade : school * int -> string list
end = struct

  type school = unit (* design your own type *)

  fun newSchool () : school =
    raise Fail "'newSchool' is not implemented"

  fun add (school: school, name: string, grade: int) : bool =
    raise Fail "'add' is not implemented"

  fun roster (school: school) : string list =
    raise Fail "'roster' is not implemented"

  fun grade (school: school, desiredGrade: int) : string list =
    raise Fail "'grade' is not implemented"
end
