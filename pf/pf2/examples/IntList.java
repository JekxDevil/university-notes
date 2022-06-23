public class IntList {
    private int[] elements;

    public IntList () {
        elements = new int[0];
    }

    public void add(int value) {
        int[] newElements = new int[elements.length + 1];
        for (int i = 0; i < elements.length; i++) {
            newElements[i] = elements[i];
        }
        newElements[elements.length] = value;
        this.elements = newElements;
    }

    public IntListIterator iterator() {
        return new IntListIterator() {
            private int idx = 0;

            @Override
            public boolean hasNext() {
                return idx < elements.length;
            }

            @Override
            public int next() {
                return elements[idx++];
            }
        };
    }
}
