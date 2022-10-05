val LENGTH_ALPHABET = 26;

(* The part of extendend euclidean algorithm we need for this exercise. eea t
(m, a) returns the inverse of a mod m iff a and m are coprime and t=(0,1). It
raises an Error otherwise. *)
fun eea (_, t) (_, 1) = t
  | eea _ (_, 0) = raise Fail "a and m must be coprime."
  | eea (t0, t1) (r0, r1) =
      let val q = r0 div r1 in eea (t1, t0 - q*t1) (r1, r0 - q*r1) end

fun encode_raw (key: {a: int, b: int}, phrase: string): char list =
  let
    val _ = eea (0, 0) (LENGTH_ALPHABET, (#a key)) (* check coprimality condition *)
    val ORD_LOWER_A = Char.ord #"a";
    datatype CodePoint = CP of int | LIT of char;

    fun preprocess (phrase: string): CodePoint list =
      let
        fun is_relevant (c: char) = Char.isAlphaNum c
        val phrase_filtered_lower = List.map Char.toLower (List.filter is_relevant (String.explode phrase))
        fun treat_literally c = Bool.not (Char.isAlpha c);
        fun to_code_point c = case treat_literally c of true => LIT c | false => CP ((Char.ord c) - ORD_LOWER_A)
      in
        List.map to_code_point phrase_filtered_lower
      end

    fun enc a b i = (a * i + b) mod LENGTH_ALPHABET;
    fun apply_enc (CP i) = Char.chr (((enc (#a key) (#b key) i) + ORD_LOWER_A))
      | apply_enc (LIT c) = c
  in
    List.map apply_enc (preprocess phrase)
  end;


fun encode (key: {a: int, b: int}, phrase: string): string =
  let
    fun group n 0 (c::cs) = #" " :: (group n n (c::cs))
      | group n i [] = []
      | group n i (c :: cs) = c :: (group n (i-1) cs)
  in
    String.implode (group 5 5 (encode_raw (key, phrase)))
  end;


fun decode (key: {a: int, b: int}, phrase: string): string =
  let
    fun modular_inverse x = (eea (0, 1) (LENGTH_ALPHABET, x)) mod LENGTH_ALPHABET
    val a1 = modular_inverse (#a key);
    val b1 = (~ a1 * (#b key)) mod LENGTH_ALPHABET;
  in
    String.implode (encode_raw ({a = a1, b = b1}, phrase))
  end;
