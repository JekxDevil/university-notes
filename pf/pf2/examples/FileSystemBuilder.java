import java.util.HashMap;

public class FileSystemBuilder {
    public Directory build() {
        // create files
        RegularFile mainjava = new RegularFile(new byte[100]);
        RegularFile mainclass = new RegularFile(new byte[200]);
        RegularFile framejava = new RegularFile(new byte[300]);
        RegularFile gamejava = new RegularFile(new byte[400]);
        RegularFile boardjava = new RegularFile(new byte[500]);

        // create collection of files for each directory
        HashMap<String, RegularFile> levelfiles = new HashMap<>();
        levelfiles.put("Board.java", boardjava);
        HashMap<String, RegularFile> modelfiles = new HashMap<>();
        modelfiles.put("Game.java", gamejava);
        HashMap<String, RegularFile> guifiles = new HashMap<>();
        guifiles.put("Frame.java", framejava);
        HashMap<String, RegularFile> rootfiles = new HashMap<>();
        rootfiles.put("Main.class", mainclass);
        rootfiles.put("Main.java", mainjava);

        // create in bottom-up order
        Directory gui = new Directory(guifiles, new HashMap<>());
        //
        Directory level = new Directory(levelfiles, new HashMap<>());
        //
        HashMap<String, Directory> modeldirs = new HashMap<>();
        modeldirs.put("level", level);
        Directory model = new Directory(modelfiles, modeldirs);
        //
        HashMap<String, Directory> rootdirs = new HashMap<>();
        rootdirs.put("gui", gui);
        rootdirs.put("model", model);
        Directory root = new Directory(rootfiles, rootdirs);
        return root;
    }
}
