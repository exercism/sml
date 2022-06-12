open OS.Path;
open OS.FileSys;

fun printLn x = print (x ^ "\n")

fun fileExists x = access (x,[])

fun testLibName base slug =
    joinDirFile
        {
          dir = (concat (base,slug))
        , file = "testlib.sml"
        }

fun dirList dirname = let
    fun go d xs =
        case readDir d of
            SOME x => go d (x::xs)
          | NONE   => (closeDir d; xs);
in
    go (openDir dirname) []
end

fun fileBytes path = let
    val in' = BinIO.openIn path;
    val bytes = BinIO.inputAll in';
in
    BinIO.closeIn in'; bytes
end

fun writeFileBytes bytes path = let
    val out = BinIO.openOut path;
in
    BinIO.output (out, bytes);
    BinIO.closeOut out
end

val _ = let
    val concept = concat ((getDir ()), (fromUnixPath "exercise/concept"));
    val practice = concat ((getDir ()), (fromUnixPath "exercises/practice"));

    val testLib = fileBytes "lib/testlib.sml";
in
    app (writeFileBytes testLib o testLibName practice) (dirList practice)
end
