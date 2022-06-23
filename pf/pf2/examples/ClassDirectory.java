import java.util.Map;
import java.util.Set;

public abstract class ClassDirectory implements InterfaceFileSystemObject {
    Map<String, ClassFile> files;
    Map<String, ClassDirectory> directories;

    public abstract Set<String> getChildFileNames();
    public abstract ClassFile getChildFile(final String name);
    public abstract Set<String> getChildDirNames();
    public abstract ClassDirectory getChildDir(final String name);

    @Override
    public abstract void print(final String path);
}
