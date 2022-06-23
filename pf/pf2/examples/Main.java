import javax.swing.JFrame;
import java.io.File;
import java.util.Set;

public class Main {
    public static void main(String[] args){
        /*
        IntList list = new IntList();
        list.add(3);
        list.add(5);
        IntListIterator it = list.iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }

        Demo d = new Demo();
        System.out.println(d.calc(new String[] {"8000000", "*", "4000000"}));
        new Gui17.Frame();
        int n = 5;
        System.out.println(f(n));
        System.out.println(f(n));
        FileSystemBuilder fsb = new FileSystemBuilder();
        ClassRegularDirectory root = ClassRegularDirectory.build();
        root.print();*/
        //Singleton.getInstance();
        List5.test();
    }

    public static void printDescendants(Directory top) {
        for (final String fname : top.getChildFileNames()) {
            final RegularFile fobj = top.getChildFile(fname);
            final String s = "f\t" + fobj.getSize() + "\t" + fname;
            System.out.println(s);
        }

        for (final String dname : top.getChildDirNames()) {
            final Directory d = top.getChildDir(dname);
            final String s = "d\t" + "\t" + dname + "/";
            System.out.println(s);
            printDescendants(dname + "/", d);
        }
    }

    public static void printDescendants(final String path, final Directory top) {
        for (final String fname : top.getChildFileNames()) {
            final RegularFile fobj = top.getChildFile(fname);
            final String s = "f\t" + fobj.getSize() + "\t" + path + fname;
            System.out.println(s);
        }

        for (final String dname : top.getChildDirNames()) {
            final Directory d = top.getChildDir(dname);
            final String s = "d\t" + "\t" + path + dname + "/";
            System.out.println(s);
            printDescendants(path + dname + "/", d);
        }
    }

    public static int f(int n ) {
        return n == 1 ? 1 : n * n + f(n - 1);
    }

    public static int iterative(int n) {
        int sum = 0;
        for (int i = 1; i <= n; i++) {
            sum += i;
        }
        return sum;
    }
}
