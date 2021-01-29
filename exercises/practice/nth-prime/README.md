# Nth Prime

Given a number n, determine what the nth prime is.

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

If your language provides methods in the standard library to deal with prime
numbers, pretend they don't exist and implement them yourself.

## Hints

If the argument is not less than `1` raise the exception [`Domain`](http://sml-family.org/Basis/general.html#SIG:GENERAL.Domain:EXN).

Some of these concepts may be helpful:

- [Lazy evaluation](https://en.wikipedia.org/wiki/Lazy_evaluation)
- Sieving (for instance [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)
- Primality by [trial division](https://en.wikipedia.org/wiki/Trial_division)


## Loading your exercise implementation in PolyML

```
$ poly --use {exercise}.sml
```

Or:

```
$ poly
> use "{exercise}.sml";
```

**Note:** You have to replace {exercise}.

## Running the tests

```
$ poly -q --use test.sml
```

## Feedback, Issues, Pull Requests

The [exercism/sml](https://github.com/exercism/sml) repository on
GitHub is the home for all of the Standard ML exercises.

If you have feedback about an exercise, or want to help implementing a new
one, head over there and create an issue. We'll do our best to help you!

## Source

A variation on Problem 7 at Project Euler [http://projecteuler.net/problem=7](http://projecteuler.net/problem=7)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
