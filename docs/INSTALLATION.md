# Installation

We'll be using *PolyML* as our Standard ML implementation.

If you are using Windows you can download an installer from [https://github.com/polyml/polyml/releases](https://github.com/polyml/polyml/releases).
General instructions for Linux/OS X/Free BSD can be found at [https://github.com/polyml/polyml#readme](https://github.com/polyml/polyml#readme).

If you want to install from source, the process is pretty easy:

```sh
$ git clone https://github.com/polyml/polyml.git
$ cd polyml
$ ./configure
```

If you want to install it in a custom location for instance `$HOME/.local`:

```sh
$ ./configure --prefix=$HOME/.local
```

Last step:

```sh
$ make compiler
$ make install
```

Check that it was installed correctly:

```sh
$ poly
```

If you see the interpreter, you are ready!
If not, you'll probably have to add `$HOME/.local/bin` (or `<you prefix>/bin`) to your `$PATH`.
