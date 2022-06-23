public class RegularFile {
    private byte[] data;

    public RegularFile(byte[] data) {
        this.data = data;
    }

    public int getSize() {
        return data.length;
    }
}
