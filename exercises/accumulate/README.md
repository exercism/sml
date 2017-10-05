# Accumulate

Implement the `accumulate` operation, which, given a collection and an
operation to perform on each element of the collection, returns a new
collection containing the result of applying that operation to each element of
the input collection.

Given the collection of numbers:

- 1, 2, 3, 4, 5

And the operation:

- square a number (`x => x * x`)

Your code should be able to produce the collection of squares:

- 1, 4, 9, 16, 25

## Restrictions

Avoid using any `map` or related functions supplied in the Standard Basis

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

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
