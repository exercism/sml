(* Since there are infinitely many primes, there's no need for a Nil. *)
datatype 'a stream = Cons of 'a * (unit -> 'a stream)

(* Filtering a stream with predicate `p` gives a new stream. *)
fun filter p (Cons (x, stream)) =
  if p x
  then Cons (x, fn () => filter p (stream ()))
  else filter p (stream ())

(* Getting the nth element of a stream. *)
fun nth (Cons (x, _), 0) = x
  | nth (Cons (_, stream), n) = nth (stream (), n-1)

(* Get an `int stream` with multiples of `i` removed. *)
fun crossOut i =
  filter (fn n => n mod i <> 0)

(* Produce a sieve where multiples are iteratively removed. *)
fun sieve (Cons (n, stream)) =
  Cons (n, fn () => sieve (crossOut n (stream ())))

(* An `int stream` of natural numbers from `i`. *)
fun nats i =
  Cons (i, fn () => nats (i+1))

(* The nth prime is the nth element of the stream sieve. *)
fun nthPrime n =
  if n < 1
  then NONE
  else SOME (nth (sieve (nats 2), n - 1))
