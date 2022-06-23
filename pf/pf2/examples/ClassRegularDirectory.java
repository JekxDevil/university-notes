import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public final class ClassRegularDirectory extends ClassDirectory {
    public ClassRegularDirectory(final Map<String, ClassFile> files,
                                 final Map<String, ClassDirectory> directories) {
        this.files = files;
        this.directories = directories;
    }

    public static final ClassRegularDirectory build() {
        // create files
        ClassRegularFile mainjava = new ClassRegularFile(new byte[100]);
        ClassRegularFile mainclass = new ClassRegularFile(new byte[200]);
        ClassRegularFile framejava = new ClassRegularFile(new byte[300]);
        ClassRegularFile gamejava = new ClassRegularFile(new byte[400]);
        ClassRegularFile boardjava = new ClassRegularFile(new byte[500]);

        // create collection of files for each directory
        HashMap<String, ClassFile> levelfiles = new HashMap<>();
        levelfiles.put("Board.java", boardjava);
        HashMap<String, ClassFile> modelfiles = new HashMap<>();
        modelfiles.put("Game.java", gamejava);
        HashMap<String, ClassFile> guifiles = new HashMap<>();
        guifiles.put("Frame.java", framejava);
        HashMap<String, ClassFile> rootfiles = new HashMap<>();
        rootfiles.put("Main.class", mainclass);
        rootfiles.put("Main.java", mainjava);

        // create in bottom-up order
        ClassRegularDirectory gui = new ClassRegularDirectory(guifiles, new HashMap<>());
        //
        ClassRegularDirectory level = new ClassRegularDirectory(levelfiles, new HashMap<>());
        //
        HashMap<String, ClassDirectory> modeldirs = new HashMap<>();
        modeldirs.put("level", level);
        ClassRegularDirectory model = new ClassRegularDirectory(modelfiles, modeldirs);
        //
        HashMap<String, ClassDirectory> rootdirs = new HashMap<>();
        rootdirs.put("gui", gui);
        rootdirs.put("model", model);
        ClassRegularDirectory root = new ClassRegularDirectory(rootfiles, rootdirs);
        return root;
    }

    @Override
    public final Set<String> getChildFileNames() {
        return this.files.keySet();
    }

    @Override
    public final ClassFile getChildFile(final String name) {
        return this.files.get(name);
    }

    @Override
    public final Set<String> getChildDirNames() {
        return this.directories.keySet();
    }

    @Override
    public final ClassDirectory getChildDir(final String name) {
        return this.directories.get(name);
    }

    public final void print() {
        this.printChildren("");
    }

    @Override
    public final void print(final String path) {
        System.out.println("d\t\t" + path);
        this.printChildren(path);
    }

    private final void printChildren(final String path) {
        for (final String fileName : this.getChildFileNames()) {
            this.getChildFile(fileName).print(path + fileName);
        }

        for (final String dirName : this.getChildDirNames()) {
            final ClassDirectory dir = this.getChildDir(dirName);
            dir.print(path + dirName + "/");
        }
    }
}
