public abstract class ClassFile implements InterfaceFileSystemObject {
    byte[] data = null;
    public abstract int getSize();

    @Override
    public abstract void print(final String path);
}
