type school = unit (* design your own type *)

fun newSchool (): school =
  raise Fail "'newSchool' is not implemented"

fun add (school: school, name: string, grade: int): bool * school =
  raise Fail "'add' is not implemented"

fun roster (school: school): string list =
  raise Fail "'roster' is not implemented"

fun grade (school: school, desiredGrade: int): string list =
  raise Fail "'grade' is not implemented"
