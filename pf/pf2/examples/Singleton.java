import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashSet;

public class Singleton {
    private static final Singleton instance = new Singleton();

    private Singleton() {
        ArrayList<String> list = new ArrayList<String>();
        list.add("listdentro");
        //HashSet<int> setint = new HashSet<int>();
        //setint.add(1);
        //System.out.println(3L);
        //System.out.println("ciao");
        System.out.println(2.3);
    }

    public static final Singleton getInstance() {
        return Singleton.instance;
    }
}
