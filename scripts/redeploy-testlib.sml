structure Path =  OS.Path
structure File =  OS.FileSys

fun printLn x = print (x ^ "\n")

fun fileExists x = File.access (x, [])

fun testLibName base slug =
  Path.joinDirFile
    {
      dir = Path.concat (base, slug),
      file = "testlib.sml"
    }

fun dirList dirname =
  let
    fun go d xs =
      case File.readDir d of
          SOME x => go d (x::xs)
        | NONE   => (File.closeDir d; xs)
  in
    go (File.openDir dirname) []
  end

fun fileBytes path =
  let
    val instream = BinIO.openIn path
    val bytes = BinIO.inputAll instream
  in
    BinIO.closeIn instream; bytes
  end

fun writeFileBytes bytes path =
  let
    val out = BinIO.openOut path
  in
    BinIO.output (out, bytes);
    BinIO.closeOut out
  end

fun relUnixPathToAbs x = Path.concat (File.getDir (), Path.fromUnixPath x)

val _ =
  let
    val practice = relUnixPathToAbs "exercises/practice"
    val testLib = fileBytes "lib/testlib.sml"
  in
    List.app (writeFileBytes testLib o testLibName practice) (dirList practice)
  end
