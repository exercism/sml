(* version 1.0.0 *)

use "testlib.sml";
use "bottle-song.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "bottle-song" [
    describe "verse" [
      describe "single verse" [
        test "first generic verse"
          (fn _ => let
            val expected =
              "Ten green bottles hanging on the wall,\n\
              \Ten green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be nine green bottles hanging on the wall."
          in
            recite (10, 1) |> Expect.equalTo expected
          end),

        test "last generic verse"
          (fn _ => let
            val expected =
              "Three green bottles hanging on the wall,\n\
              \Three green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be two green bottles hanging on the wall."
          in
            recite (3, 1) |> Expect.equalTo expected
          end),

        test "verse with 2 bottles"
          (fn _ => let
            val expected =
              "Two green bottles hanging on the wall,\n\
              \Two green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be one green bottle hanging on the wall."
          in
            recite (2, 1) |> Expect.equalTo expected
          end),

        test "verse with 1 bottle"
          (fn _ => let
            val expected =
              "One green bottle hanging on the wall,\n\
              \One green bottle hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be no green bottles hanging on the wall."
          in
            recite (1, 1) |> Expect.equalTo expected
          end)
      ]
    ],

    describe "lyrics" [
      describe "multiple verses" [
        test "first two verses"
          (fn _ => let
            val expected =
              "Ten green bottles hanging on the wall,\n\
              \Ten green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be nine green bottles hanging on the wall.\n\
              \\n\
              \Nine green bottles hanging on the wall,\n\
              \Nine green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be eight green bottles hanging on the wall."
          in
            recite (10, 2) |> Expect.equalTo expected
          end),

        test "last three verses"
          (fn _ => let
            val expected =
              "Three green bottles hanging on the wall,\n\
              \Three green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be two green bottles hanging on the wall.\n\
              \\n\
              \Two green bottles hanging on the wall,\n\
              \Two green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be one green bottle hanging on the wall.\n\
              \\n\
              \One green bottle hanging on the wall,\n\
              \One green bottle hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be no green bottles hanging on the wall."
          in
            recite (3, 3) |> Expect.equalTo expected
          end),

        test "all verses"
          (fn _ => let
            val expected =
              "Ten green bottles hanging on the wall,\n\
              \Ten green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be nine green bottles hanging on the wall.\n\
              \\n\
              \Nine green bottles hanging on the wall,\n\
              \Nine green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be eight green bottles hanging on the wall.\n\
              \\n\
              \Eight green bottles hanging on the wall,\n\
              \Eight green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be seven green bottles hanging on the wall.\n\
              \\n\
              \Seven green bottles hanging on the wall,\n\
              \Seven green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be six green bottles hanging on the wall.\n\
              \\n\
              \Six green bottles hanging on the wall,\n\
              \Six green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be five green bottles hanging on the wall.\n\
              \\n\
              \Five green bottles hanging on the wall,\n\
              \Five green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be four green bottles hanging on the wall.\n\
              \\n\
              \Four green bottles hanging on the wall,\n\
              \Four green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be three green bottles hanging on the wall.\n\
              \\n\
              \Three green bottles hanging on the wall,\n\
              \Three green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be two green bottles hanging on the wall.\n\
              \\n\
              \Two green bottles hanging on the wall,\n\
              \Two green bottles hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be one green bottle hanging on the wall.\n\
              \\n\
              \One green bottle hanging on the wall,\n\
              \One green bottle hanging on the wall,\n\
              \And if one green bottle should accidentally fall,\n\
              \There'll be no green bottles hanging on the wall."
          in
            recite (10, 10) |> Expect.equalTo expected
          end)
      ]
    ]
  ]

val _ = Test.run testsuite
