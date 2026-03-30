(* version 1.0.0 *)

use "testlib.sml";
use "rail-fence-cipher.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "rail-fence-cipher" [
    describe "encode" [
      test "encode with two rails"
        (fn _ => encode (2, "XOXOXOXOXOXOXOXOXO") |> Expect.equalTo "XXXXXXXXXOOOOOOOOO"),

      test "encode with three rails"
        (fn _ => encode (3, "WEAREDISCOVEREDFLEEATONCE") |> Expect.equalTo "WECRLTEERDSOEEFEAOCAIVDEN"),

      test "encode with ending in the middle"
        (fn _ => encode (4, "EXERCISES") |> Expect.equalTo "ESXIEECSR")
    ],

    describe "decode" [
      test "decode with three rails"
        (fn _ => decode (3, "TEITELHDVLSNHDTISEIIEA") |> Expect.equalTo "THEDEVILISINTHEDETAILS"),

      test "decode with five rails"
        (fn _ => decode (5, "EIEXMSMESAORIWSCE") |> Expect.equalTo "EXERCISMISAWESOME"),

      test "decode with six rails"
        (fn _ => decode (6, "133714114238148966225439541018335470986172518171757571896261") |> Expect.equalTo "112358132134558914423337761098715972584418167651094617711286")
    ]
  ]

val _ = Test.run testsuite
