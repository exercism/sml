fun primes (limit: int): int list =
  let val marks = Array.array (limit + 1, true)

      fun markMultiples prev =
        case Array.findi (fn (i, isPrime) => i > prev andalso isPrime) marks
          of NONE => ()
           | SOME (prime, _) => (doMark prime (2 * prime); markMultiples prime)

      and doMark p m =
        if m > limit then ()
        else (Array.update (marks, m, false); doMark p (m + p))

  in  Array.update (marks, 0, false);
      Array.update (marks, 1, false);
      markMultiples 1;
      Array.foldri
        (fn (i, isPrime, ps) => if isPrime then i :: ps else ps)
        []
        marks
  end
