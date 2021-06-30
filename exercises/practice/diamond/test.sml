(* version 1.0.0 *)

use "diamond.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "diamond" [
    test "Degenerate case with a single 'A' row"
      (fn _ => rows ("A") |> Expect.equalTo ["A"]),

    test "Degenerate case with no row containing 3 distinct groups of spaces"
      (fn _ => rows ("B") |> Expect.equalTo [" A ", "B B", " A "]),

    test "Smallest non-degenerate case with odd diamond side length"
      (fn _ => rows ("C") |> Expect.equalTo ["  A  ", " B B ", "C   C", " B B ", "  A  "]),

    test "Smallest non-degenerate case with even diamond side length"
      (fn _ => rows ("D") |> Expect.equalTo ["   A   ", "  B B  ", " C   C ", "D     D", " C   C ", "  B B  ", "   A   "]),

    test "Largest possible diamond"
      (fn _ => rows ("Z") |> Expect.equalTo ["                         A                         ", "                        B B                        ", "                       C   C                       ", "                      D     D                      ", "                     E       E                     ", "                    F         F                    ", "                   G           G                   ", "                  H             H                  ", "                 I               I                 ", "                J                 J                ", "               K                   K               ", "              L                     L              ", "             M                       M             ", "            N                         N            ", "           O                           O           ", "          P                             P          ", "         Q                               Q         ", "        R                                 R        ", "       S                                   S       ", "      T                                     T      ", "     U                                       U     ", "    V                                         V    ", "   W                                           W   ", "  X                                             X  ", " Y                                               Y ", "Z                                                 Z", " Y                                               Y ", "  X                                             X  ", "   W                                           W   ", "    V                                         V    ", "     U                                       U     ", "      T                                     T      ", "       S                                   S       ", "        R                                 R        ", "         Q                               Q         ", "          P                             P          ", "           O                           O           ", "            N                         N            ", "             M                       M             ", "              L                     L              ", "               K                   K               ", "                J                 J                ", "                 I               I                 ", "                  H             H                  ", "                   G           G                   ", "                    F         F                    ", "                     E       E                     ", "                      D     D                      ", "                       C   C                       ", "                        B B                        ", "                         A                         "])
  ]

val _ = Test.run testsuite