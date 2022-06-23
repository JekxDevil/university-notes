public class List5 {
    private int value;
    private List5 next ;
    public List5(int value, List5 next) {
        this.value = value;
        this.next = next;
    }
    public void print () {
        System.out.print(value);
        if (next != null) {
            System.out.print(", ");
            next.print();
        }
    }

    public static void test () {
        List5 a = new List5(1, new List5(2, new List5(3, null)));
        List5 b = new List5(4, new List5(5, null));
        List5 zipped1 = zip(a, b);
        zipped1.print(); // prints 1 , 4 , 2 , 5 , 3
        List5 zipped2 = zip(b, a);
        zipped2.print(); // prints 4 , 1 , 5 , 2 , 3
        List5 zipped3 = zip(a, null);
        zipped3.print(); // prints 1 , 2 , 3
        List5 zipped4 = zip(null, a);
        zipped4.print(); // prints 1 , 2 , 3
        List5 zipped5 = zip (null, null);
        System.out.println(zipped5 == null); // prints true
    }
    public static List5 zip (List5 a, List5 b) {
        if (a == null && b == null) {
            return null;
        } else if (a == null) {
            return new List5(b.value, zip(null, b.next));
        } else if (b == null) {
            return new List5(a.value, zip(a.next, null));
        } else {
            return new List5(a.value, new List5(b.value, zip(a.next, b.next)));
        }
    }
}
