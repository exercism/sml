datatype nationality = Englishman | Spaniard | Ukrainian | Norwegian | Japanese

local
  (* Knuth Algorithm L *)
  fun nextPermutation a =
    let
      val n = Array.length a
      (* Step 1. find j *)
      fun findJ j =
        if j < 0 then NONE
        else if Array.sub (a, j) >= Array.sub (a, j + 1) then findJ (j - 1)
        else SOME j
    in
      case findJ (n - 2) of
        NONE => false
      | SOME j =>
          let
            (* Step 2. increase a[j] *)
            fun findL l =
              if Array.sub (a, j) >= Array.sub (a, l) then findL (l - 1)
              else l
            val l = findL (n - 1)
            val aj = Array.sub (a, j)
            val al = Array.sub (a, l)
            val () = Array.update (a, j, al)
            val () = Array.update (a, l, aj)

            (* Step 3. reverse a[j+1] ... a[n-1] *)
            fun rev (k, l) =
              if k >= l then ()
              else
                let
                  val ak = Array.sub (a, k)
                  val al = Array.sub (a, l)
                in
                  Array.update (a, k, al);
                  Array.update (a, l, ak);
                  rev (k + 1, l - 1)
                end
          in
            rev (j + 1, n - 1);
            true
          end
    end

  exception Found of {drinksWater: nationality, ownsZebra: nationality}

  fun notAdjacent i j = abs (i - j) <> 1

  fun solve () =
    let
      val initial = Vector.fromList [0, 1, 2, 3, 4]

      val nat = Array.tabulate (5, fn i => i)
      fun englishman () = Array.sub (nat, 0)
      fun japanese ()   = Array.sub (nat, 1)
      fun norwegian ()  = Array.sub (nat, 2)
      fun spaniard ()   = Array.sub (nat, 3)
      fun ukrainian ()  = Array.sub (nat, 4)

      val col = Array.tabulate (5, fn i => i)
      fun blue ()   = Array.sub (col, 0)
      fun green ()  = Array.sub (col, 1)
      fun ivory ()  = Array.sub (col, 2)
      fun red ()    = Array.sub (col, 3)
      fun yellow () = Array.sub (col, 4)

      val drk = Array.tabulate (5, fn i => i)
      fun coffee ()      = Array.sub (drk, 0)
      fun milk ()        = Array.sub (drk, 1)
      fun orangeJuice () = Array.sub (drk, 2)
      fun tea ()         = Array.sub (drk, 3)
      fun water ()       = Array.sub (drk, 4)

      val hob = Array.tabulate (5, fn i => i)
      fun reading ()  = Array.sub (hob, 0)
      fun painting () = Array.sub (hob, 1)
      fun football () = Array.sub (hob, 2)
      fun dancing ()  = Array.sub (hob, 3)
      fun chess ()    = Array.sub (hob, 4)

      val pet = Array.tabulate (5, fn i => i)
      fun dog ()    = Array.sub (pet, 0)
      fun fox ()    = Array.sub (pet, 1)
      fun horse ()  = Array.sub (pet, 2)
      fun snails () = Array.sub (pet, 3)
      fun zebra ()  = Array.sub (pet, 4)

      fun reset a = Array.copyVec {src = initial, dst = a, di = 0}

      fun whoLivesIn house =
        let
           val table = Vector.fromList [Englishman, Japanese, Norwegian, Spaniard, Ukrainian]
          fun find i = if Array.sub (nat, i) = house then i else find (i + 1)
        in
          Vector.sub (table, find 0)
        end

      fun tryPets () =
          (* 3. The Spaniard owns the dog. *)
          if spaniard () <> dog () then () else
          (* 7. The snail owner likes to go dancing. *)
          if dancing () <> snails () then () else
          (* 11. The person who enjoys reading lives in the house next to the person with the fox. *)
          if notAdjacent (reading ()) (fox ()) then () else
          (* 12. The painter's house is next to the house with the horse. *)
          if notAdjacent (painting ()) (horse ()) then () else
          raise Found {drinksWater = whoLivesIn (water ()), ownsZebra = whoLivesIn (zebra ())}

      fun tryHobbies () =
          (* 8. The person in the yellow house is a painter. *)
          if painting () <> yellow () then () else
          (* 13. The person who plays football drinks orange juice. *)
          if football () <> orangeJuice () then () else
          (* 14. The Japanese person plays chess. *)
          if japanese () <> chess () then () else
          (tryPets (); while nextPermutation pet do tryPets (); reset pet)

      fun tryDrinks () =
          (* 4. Coffee is drunk in the green house. *)
          if coffee () <> green () then () else
          (* 5. The Ukrainian drinks tea. *)
          if ukrainian () <> tea () then () else
          (* 9. Milk is drunk in the middle house. *)
          if milk () <> 2 then () else
          (tryHobbies (); while nextPermutation hob do tryHobbies (); reset hob)

      fun tryColors () =
          (* 2. The Englishman lives in the red house. *)
          if englishman () <> red () then () else
          (* 6. The green house is immediately to the right of the ivory house. *)
          if green () <> ivory () + 1 then () else
          (* 15. The Norwegian lives next to the blue house. *)
          if notAdjacent (norwegian ()) (blue ()) then () else
          (tryDrinks (); while nextPermutation drk do tryDrinks (); reset drk)

      fun tryNationalities () =
          (* 10. The Norwegian lives in the first house. *)
          if norwegian () <> 0 then () else
          (tryColors (); while nextPermutation col do tryColors (); reset col)
    in
      tryNationalities ();
      while nextPermutation nat do tryNationalities ();
      raise Fail "no solution"
    end
    handle Found result => result

  val result = solve ()
in
  fun drinksWater () = #drinksWater result
  fun ownsZebra () = #ownsZebra result
end
