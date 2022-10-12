# Exercism Standard ML Track

[![configlet](https://github.com/exercism/sml/workflows/Configlet/badge.svg)](https://github.com/exercism/sml/actions/workflows/configlet.yml?query=workflow%3Aconfiglet) [![sml / ci](https://github.com/exercism/sml/workflows/sml%20/%20ci/badge.svg)](https://github.com/exercism/sml/actions/workflows/ci.yml?query=workflow%3A%22sml+%2F+ci%22)

Exercism exercises in Standard ML.

## Setup

Even though there are multiple Standard ML implementations, we'll stick to
[PolyML](https://polyml.org/).

Please read [INSTALLATION.md](docs/INSTALLATION.md) for more info.

## Contributing Guide

Any type of contribution is more than welcome!

Before opening a pull request please have look into [Contributors Pull Request
Guide](https://exercism.org/docs/building/github/contributors-pull-request-guide).

## Contributing a new exercise

Usually an exercise is derived from one of the exercises in the
[problem-specifications](https://github.com/exercism/problem-specifications) repository. If you want
to contribute a completely new exercise, consider opening a pull request there to make it available
to all tracks.

There is a [comprehensive guide][guide-practice-exercise] on how to add an exercise to one of the
exercism tracks. It is advisable that you skim over the text. You don't have to remember everything,
we recall the essentials here anyway. We also provide the track-specific details here. Down below we
describe tooling which helps you with the boilerplate.

Basically, adding an exercise means to do the following things.

- Register the exercise in `{{ repo-path }}/config.json`,
- Use tooling to generate *exercise-folder* `exercises/practice/{{ slug }}/`,
- Provide a solution for the exercise in `example.sml`,
- Check if the linter (configlet) is satisfied.

### Register exercise in `{{ repo-path }}/config.json`

This step needs to be done manually. You have to add a block looking like that under
`exercises/practice`:

```json
{
  "exercises": {
    "practice": [
      {
        "slug": "flatten-array", // the slug from `problem-specifications`
        "name": "Flatten Array",
        "uuid": "fb0a030d-33bc-4066-a30a-1b8b02cc42f1", // use `configlet uuid` to generate this
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

### Generate exercise-folder `exercises/practice/{{ slug }}/`

A folder similar to this one has to be created:

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

The easiest way to autogenerate the boilerplate is to execute [configlet
sync](https://exercism.org/docs/building/configlet/sync) in combination with the track specific tool
`bin/generate`. The former is responsible for required files with "generic" content, and the latter
for required files with sml-specific content

```shell
$ bin/configlet sync -yu --tests include --docs --filepaths --metadata -e {{ slug }}
$ bin/generate {{ slug }}
```

**Note on `bin/generate`:** You need Python 3.5+. It may fail with some exercises. Reasons:
`canonical-data.json` does not exist, or type mismatch (in these situation you can use `--force`
option). In those cases you will have to create the files manually.

**IMPORTANT:** Currently the test-framework expects `example.sml` to be inside `.meta/`, which is
not the case right after execution of `bin/generate`. As a workaround you should move the file
manually and update the path in `.meta/config.json` accordingly.

### Provide a solution in `example.sml`

The most creative part is to write a valid solution `example.sml` which passes the test-suite. To
verify that your solution is valid just execute the tests like so

```shell
$ make test-{{ slug }}
```

### Linting

Finally check if the linter is satisfied with your work

```shell
$ bin/configlet lint
```

## Exercise Tests

You can execute tests by

```shell
$ make test            # all tests
$ make test-{{ slug }} # single test
```

Mainstream languages usually have one or more popular test-frameworks. Standard ML is not blessed
with this convenience. Therefore the track implements its own "test-framework" `lib/testlib.sml`. It
gets the job done. For technical reasons each exercise must provide its own copy of the testlib.

Any updates to `lib/testlib.sml` have to be synced to all exercises by

```
$ make redeploy-testlib
```

We don't want to deal with multiple versions of testlib. Hence the redeploy script is the only way to update the testlib of any exercise.


[guide-practice-exercise]: https://exercism.org/docs/building/tracks/practice-exercises
