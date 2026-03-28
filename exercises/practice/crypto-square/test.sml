(* version 1.0.0 *)

use "testlib.sml";
use "crypto-square.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "crypto-square" [
    test "empty plaintext results in an empty ciphertext"
      (fn _ => ciphertext "" |> Expect.equalTo ""),

    test "normalization results in empty plaintext"
      (fn _ => ciphertext "... --- ..." |> Expect.equalTo ""),

    test "Lowercase"
      (fn _ => ciphertext "A" |> Expect.equalTo "a"),

    test "Remove spaces"
      (fn _ => ciphertext "  b " |> Expect.equalTo "b"),

    test "Remove punctuation"
      (fn _ => ciphertext "@1,%!" |> Expect.equalTo "1"),

    test "9 character plaintext results in 3 chunks of 3 characters"
      (fn _ => ciphertext "This is fun!" |> Expect.equalTo "tsf hiu isn"),

    test "8 character plaintext results in 3 chunks, the last one with a trailing space"
      (fn _ => ciphertext "Chill out." |> Expect.equalTo "clu hlt io "),

    test "54 character plaintext results in 8 chunks, the last two with trailing spaces"
      (fn _ => ciphertext "If man was meant to stay on the ground, god would have given us roots." |> Expect.equalTo "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ")
  ]

val _ = Test.run testsuite
