local
  fun chuck (chuckLength: int) (phrase: string): string list =
    let
      val phraseLength = String.size phrase
      fun recurse (index: int): string list =
        if index + chuckLength >= phraseLength then String.extract (phrase, index, NONE) :: nil
        else String.substring (phrase, index, chuckLength) :: recurse (index + chuckLength)
    in
      if phraseLength = 0 then nil
      else recurse 0
    end

  fun isStop "UAA" = true
    | isStop "UAG" = true
    | isStop "UGA" = true
    | isStop _ = false

  fun protein "AUG" = "Methionine"
    | protein "UUU" = "Phenylalanine"
    | protein "UUC" = "Phenylalanine"
    | protein "UUA" = "Leucine"
    | protein "UUG" = "Leucine"
    | protein "UCU" = "Serine"
    | protein "UCC" = "Serine"
    | protein "UCA" = "Serine"
    | protein "UCG" = "Serine"
    | protein "UAU" = "Tyrosine"
    | protein "UAC" = "Tyrosine"
    | protein "UGU" = "Cysteine"
    | protein "UGC" = "Cysteine"
    | protein "UGG" = "Tryptophan"
    | protein _ = raise Fail "Invalid codon"

  fun translate nil = nil
    | translate (codon :: rest) =
        if isStop codon then nil
        else protein codon :: translate rest
in
  val proteins: string -> string list =
    translate o chuck 3
end
