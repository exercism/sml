(* version 1.0.0 *)

use "testlib.sml";
use "grade-school.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "grade-school" [
    test "Roster is empty when no student is added"
      (fn _ => let
        val school = GradeSchool.newSchool ()
      in
        GradeSchool.roster school |> Expect.equalTo []
      end),

    test "Add a student"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val ok0 = GradeSchool.add (school, "Aimee", 2)
      in
        [ok0] |> Expect.equalTo [true]
      end),

    test "Student is added to the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Aimee", 2)
      in
        GradeSchool.roster school |> Expect.equalTo ["Aimee"]
      end),

    test "Adding multiple students in the same grade in the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val ok0 = GradeSchool.add (school, "Blair", 2)
        val ok1 = GradeSchool.add (school, "James", 2)
        val ok2 = GradeSchool.add (school, "Paul", 2)
      in
        [ok0, ok1, ok2] |> Expect.equalTo [true, true, true]
      end),

    test "Multiple students in the same grade are added to the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Blair", 2)
        val _ = GradeSchool.add (school, "James", 2)
        val _ = GradeSchool.add (school, "Paul", 2)
      in
        GradeSchool.roster school |> Expect.equalTo ["Blair", "James", "Paul"]
      end),

    test "Cannot add student to same grade in the roster more than once"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val ok0 = GradeSchool.add (school, "Blair", 2)
        val ok1 = GradeSchool.add (school, "James", 2)
        val ok2 = GradeSchool.add (school, "James", 2)
        val ok3 = GradeSchool.add (school, "Paul", 2)
      in
        [ok0, ok1, ok2, ok3] |> Expect.equalTo [true, true, false, true]
      end),

    test "Student not added to same grade in the roster more than once"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Blair", 2)
        val _ = GradeSchool.add (school, "James", 2)
        val _ = GradeSchool.add (school, "James", 2)
        val _ = GradeSchool.add (school, "Paul", 2)
      in
        GradeSchool.roster school |> Expect.equalTo ["Blair", "James", "Paul"]
      end),

    test "Adding students in multiple grades"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val ok0 = GradeSchool.add (school, "Chelsea", 3)
        val ok1 = GradeSchool.add (school, "Logan", 7)
      in
        [ok0, ok1] |> Expect.equalTo [true, true]
      end),

    test "Students in multiple grades are added to the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Chelsea", 3)
        val _ = GradeSchool.add (school, "Logan", 7)
      in
        GradeSchool.roster school |> Expect.equalTo ["Chelsea", "Logan"]
      end),

    test "Cannot add same student to multiple grades in the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val ok0 = GradeSchool.add (school, "Blair", 2)
        val ok1 = GradeSchool.add (school, "James", 2)
        val ok2 = GradeSchool.add (school, "James", 3)
        val ok3 = GradeSchool.add (school, "Paul", 3)
      in
        [ok0, ok1, ok2, ok3] |> Expect.equalTo [true, true, false, true]
      end),

    test "Student not added to multiple grades in the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Blair", 2)
        val _ = GradeSchool.add (school, "James", 2)
        val _ = GradeSchool.add (school, "James", 3)
        val _ = GradeSchool.add (school, "Paul", 3)
      in
        GradeSchool.roster school |> Expect.equalTo ["Blair", "James", "Paul"]
      end),

    test "Students are sorted by grades in the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Jim", 3)
        val _ = GradeSchool.add (school, "Peter", 2)
        val _ = GradeSchool.add (school, "Anna", 1)
      in
        GradeSchool.roster school |> Expect.equalTo ["Anna", "Peter", "Jim"]
      end),

    test "Students are sorted by name in the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Peter", 2)
        val _ = GradeSchool.add (school, "Zoe", 2)
        val _ = GradeSchool.add (school, "Alex", 2)
      in
        GradeSchool.roster school |> Expect.equalTo ["Alex", "Peter", "Zoe"]
      end),

    test "Students are sorted by grades and then by name in the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Peter", 2)
        val _ = GradeSchool.add (school, "Anna", 1)
        val _ = GradeSchool.add (school, "Barb", 1)
        val _ = GradeSchool.add (school, "Zoe", 2)
        val _ = GradeSchool.add (school, "Alex", 2)
        val _ = GradeSchool.add (school, "Jim", 3)
        val _ = GradeSchool.add (school, "Charlie", 1)
      in
        GradeSchool.roster school |> Expect.equalTo ["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"]
      end),

    test "Grade is empty if no students in the roster"
      (fn _ => let
        val school = GradeSchool.newSchool ()
      in
        GradeSchool.grade (school, 1) |> Expect.equalTo []
      end),

    test "Grade is empty if no students in that grade"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Peter", 2)
        val _ = GradeSchool.add (school, "Zoe", 2)
        val _ = GradeSchool.add (school, "Alex", 2)
        val _ = GradeSchool.add (school, "Jim", 3)
      in
        GradeSchool.grade (school, 1) |> Expect.equalTo []
      end),

    test "Student not added to same grade more than once"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Blair", 2)
        val _ = GradeSchool.add (school, "James", 2)
        val _ = GradeSchool.add (school, "James", 2)
        val _ = GradeSchool.add (school, "Paul", 2)
      in
        GradeSchool.grade (school, 2) |> Expect.equalTo ["Blair", "James", "Paul"]
      end),

    test "Student not added to multiple grades"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Blair", 2)
        val _ = GradeSchool.add (school, "James", 2)
        val _ = GradeSchool.add (school, "James", 3)
        val _ = GradeSchool.add (school, "Paul", 3)
      in
        GradeSchool.grade (school, 2) |> Expect.equalTo ["Blair", "James"]
      end),

    test "Student not added to other grade for multiple grades"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Blair", 2)
        val _ = GradeSchool.add (school, "James", 2)
        val _ = GradeSchool.add (school, "James", 3)
        val _ = GradeSchool.add (school, "Paul", 3)
      in
        GradeSchool.grade (school, 3) |> Expect.equalTo ["Paul"]
      end),

    test "Students are sorted by name in a grade"
      (fn _ => let
        val school = GradeSchool.newSchool ()
        val _ = GradeSchool.add (school, "Franklin", 5)
        val _ = GradeSchool.add (school, "Bradley", 5)
        val _ = GradeSchool.add (school, "Jeff", 1)
      in
        GradeSchool.grade (school, 5) |> Expect.equalTo ["Bradley", "Franklin"]
      end)
  ]

val _ = Test.run testsuite
