public final class ClassRegularFile extends ClassFile {

    public ClassRegularFile(final byte[] data) {
        this.data = data;
    }

    @Override
    public final int getSize() {
        return data.length;
    }

    @Override
    public final void print(final String path) {
        System.out.print("f\t" + this.getSize() + "\t" + path + "\n");
    }
}
