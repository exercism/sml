# Exercism Standard ML Track

[![configlet](https://github.com/exercism/sml/workflows/Configlet/badge.svg)](https://github.com/exercism/sml/actions/workflows/configlet.yml?query=workflow%3Aconfiglet) [![sml / ci](https://github.com/exercism/sml/workflows/sml%20/%20ci/badge.svg)](https://github.com/exercism/sml/actions/workflows/ci.yml?query=workflow%3A%22sml+%2F+ci%22)

Exercism exercises in Standard ML.

## Contributing Guide

Any type of contribution is more than welcome!

Below track specific informations are provided. General informations are
provided [elsewhere](https://github.com/exercism/docs/tree/main/building).

## Setup

Even though there are multiple Standard ML implementations, we'll stick to [PolyML](https://polyml.org/).

Please read [INSTALLATION.md](docs/INSTALLATION.md) for more info.

## Exercise structure

Every exercise must have at least these files:

- `example.sml`: Example solution
- `{{ slug }}.sml`: Stub file with the same functions as `example.sml`
- `README.md`: Exercise description
- `HINTS.md`: (Optional)
- `test.sml`: Test suite
- `testlib.sml` Test helper

### `testlib.sml`

The copy of `testlib.sml` for each exercise should be in sync with `lib/testlib.sml`.
`make redeploy-testlib` is provided for synchronizing all exercises with `lib/testlib.sml`
when it is updated.

This helper has these structures:

```sml
structure Expect:
  sig
    val anyError: (unit -> 'a) -> expectation
    val equalTo: ''a -> ''a -> expectation
    val error: exn -> (unit -> 'a) -> expectation
    datatype expectation = Fail of string * string | Pass
    val falsy: bool -> expectation
    val nearTo: real -> real -> real -> expectation
    val truthy: bool -> expectation
  end
structure Test:
  sig
    val run: testnode -> 'a
    datatype testnode =
        Test of string * (unit -> Expect.expectation)
      | TestGroup of string * testnode list
  end
val describe = fn: string -> Test.testnode list -> Test.testnode
val test = fn: string -> (unit -> Expect.expectation) -> Test.testnode
```

Usage example:

```sml
use "foo.sml";
use "testlib.sml";

infixr |>
fun x |> f = f x

val testsuite =
  describe "Examples" [
    test "foo"
      (fn _ => foo ("foo") |> Expect.equalTo "foo-foo"),

    test "bar"
      (fn _ => bar () |> Expect.truthy),

    test "something that baz does"
      (fn _ => baz (123) |> Expect.nearTo 0.001 123.10),

    test "an exception from 'qux'"
      (fn _ => (fn _ => qux (0, 0))) |> Expect.error QuxError),
  ]

val _ = Test.run testsuite
```


## Adding an exercise

The easiest way to start is by running the generator:

```
bin/generate {{ slug }}
```

It will create the exercise directory, test and stub files.

### Generator

```
usage: generate [-h] [--force] [--test-only] [--stub-only] [--example-only]
                [--problem-specs-source {remote,local}] exercises [exercises ...]

positional arguments:
  exercises

options:
  -h, --help      show this help message and exit
  --force         Type inference will be disabled and "string" will be
                  assumed. Test cases will need to be modified to match the
                  right data type.
  --test-only     Generate only "test.sml"
  --stub-only     Generate only "<exercise>.sml"
  --example-only  Generate only "example.sml"
  --problem-specs-source {remote,local}
                  Choose whether to use remote (default) or local checkout
                  of problem-specifications.
```

**Note:**
- You need Python 3.5+.
- It may fail with some exercises. Reasons:
  - `canonical-data.json` does not exist
  - type mismatch (in these situation you can use `--force` option)

In those cases you will have to create the files manually. `testlib.sml` can be copied from `lib/testlib.sml`. When in doubt, feel free to open an issue.

In order to generate `README.md` you will need an up to date copy of `problem-specifications`. This should be located at the same level as your `sml` clone. Then you can execute:

```
bin/fetch-configlet
bin/configlet generate . -o {{ slug }}
```

## Testing

For a single exercise:

If you are at the top level:

```
make test-{{ slug }}
```

if you are in exercises/{{slug}}

```
make -C https://github.com/exercism/v3/blob/main/ test-{{ slug }}
```

If you want to run all the tests:

```
make test
```

## Pull request

Do not forget to add your exercise to `config.json`. Please read [this](https://github.com/exercism/docs/blob/master/contributing/pull-request-guidelines.md).
