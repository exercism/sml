# Exercism Standard ML Track

[![configlet](https://github.com/exercism/sml/workflows/Configlet/badge.svg)](https://github.com/exercism/sml/actions/workflows/configlet.yml?query=workflow%3Aconfiglet) [![sml / ci](https://github.com/exercism/sml/workflows/sml%20/%20ci/badge.svg)](https://github.com/exercism/sml/actions/workflows/ci.yml?query=workflow%3A%22sml+%2F+ci%22)

Exercism exercises in Standard ML.

## Setup

Even though there are multiple Standard ML implementations, we'll stick to
[PolyML](https://polyml.org/).

Please read [INSTALLATION.md](docs/INSTALLATION.md) for more info.

## Contributing Guide

Any type of contribution is more than welcome!

Below track specific informations are provided. Some relevant exercism-wide documents are:

- [Contributing to exercism](https://github.com/exercism/docs/tree/main/building),
- [Contributors Pull Request Guide](https://exercism.org/docs/building/github/contributors-pull-request-guide).

### Adding a practice exercise

Usually an exercise is derived from one of the exercises in the
[problem-specifications](https://github.com/exercism/problem-specifications) repository. If you want
to contribute a completely new exercise, consider opening a pull request there to make it available
to all tracks.

There is a [comprehensive guide][guide-practice-exercise] on how to add an exercise to one of the
exercism tracks. It is advisable that you skim over the text. You don't have to remember everything,
we recall the essentials her anyway. We also provide the track-specific details here. Down below we
describe tooling which helps you with the boilerplate - it makes it very easy to add an exercise.

Basically, adding an exercise means to do the following things.

- Register exercise in `{{ repo-path }}/config.json`,
- Use tooling to generate *exercise-folder* `exercises/practice/{{ slug }}/`,
- Provide a solution for the exercise in `example.sml`,
- Check if the linter (configlet) is satisfied.

So the first thing we do is to *register* it in `<repo>/config.json` under the field
`exercises/practice`. This step needs to be done manually.

```json
{
  "exercises": {
    "practice": [
      {
        "slug": "flatten-array", // the slug from `problem-specifications`
        "name": "Flatten Array",
        "uuid": "fb0a030d-33bc-4066-a30a-1b8b02cc42f1", // use `configlet` to generate this
        "practices": [],
        "prerequisites": [],
        "difficulty": 1,
        "topics": []
      },
      // more exercises ...
    ],
    // more stuff ...
  },
  // more stuff ...
}
```

To generate a unique `uuid` just execute the following on the command line:

```shell
$ bin/fetch-configlet # to fetch the latest version of configlet
$ bin/configlet uuid  # paste the output into the `uuid` field.
```

Now an *exercise-folder* `exercises/practice/{{ slug }}/` similar to this one has to be created:

```sh
exercises/practice/flatten-array/
├── flatten-array.sml          # stub-file displayed to studend on website
├── testlib.sml                # copy of the test-library (track-specific)
├── test.sml                   # actual test-suite
├── .docs
│   ├── instructions.append.md # optional track-specific file augmenting `instructions.md`
│   └── instructions.md        # contains (track-independent) description of the exercise
└── .meta
    ├── config.json            # you may add yourself as author here
    ├── example.sml            # solution proving that the test-suite can actually be satisfied
    └── tests.toml             # specifies which tests from `problem-specifications` are implemented
```

The easiest way to add the boilerplate is to execute [configlet
sync](https://exercism.org/docs/building/configlet/sync) in combination with the track specific tool
`bin/generate`:

```shell
$ bin/configlet sync --update -e {{ slug }} # interactively answer some questions
$ bin/generate {{ slug }}                   # generates test.sml
```

**Note on `bin/generate`:** You need Python 3.5+. It may fail with some exercises. Reasons:
`canonical-data.json` does not exist, or type mismatch (in these situation you can use `--force`
option). In those cases you will have to create the files manually.

It might be annoying that `configlet` asks you for every exercise whether you want to include it.
You may do the following to just add all tests (you can manually remove some of them from
`tests.toml` if desired):

```shell
$ bin/configlet sync --update --tests include -e {{ slug }}
$ bin/configlet sync --update -e {{ slug }}
```

The hardest part is to write a valid solution `example.sml` which passes the test-suite. But you
certainly can do that because you want to add the exercise. To verify that your solution is valid
just execute the tests like so

```shell
$ make test-{{ slug }}
```

Finally check if the linter is satisfied with your work

```shell
$ bin/configlet lint
```

### `testlib.sml`

The copy of `testlib.sml` for each exercise should be in sync with `lib/testlib.sml`. `make
redeploy-testlib` is provided for synchronizing all exercises with `lib/testlib.sml` when it is
updated.


[guide-practice-exercise]: https://exercism.org/docs/building/tracks/practice-exercises
