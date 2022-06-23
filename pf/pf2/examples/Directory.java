import java.util.Map;
import java.util.Set;

public class Directory {
    private Map<String, RegularFile> filesByName;
    private Map<String, Directory> dirsByName;

    public Directory(Map<String, RegularFile> filesByName,
                     Map<String, Directory> dirsByName) {
        this.filesByName = filesByName;
        this.dirsByName = dirsByName;
    }

    public Set<String> getChildFileNames() {
        return filesByName.keySet();
    }

    public RegularFile getChildFile(String name) {
        return filesByName.get(name);
    }

    public Set<String> getChildDirNames() {
        return dirsByName.keySet();
    }

    public Directory getChildDir(String name) {
        return dirsByName.get(name);
    }
}
