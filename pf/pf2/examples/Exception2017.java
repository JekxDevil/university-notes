public class Exception2017 {
    public void c(int v) throws Exception {
        System.out.println("c.s");
        if (v == 0) {
            System.out.println("c.i");
            Exception ex = new Exception();
            System.out.println("c.x");
            throw ex;
        }
        System.out.println("c.e");
    }

    public void b(int v) throws Exception {
        System.out.println("b.s");
        try {
            System.out.println("b.t");
            c(v);
            if (v == 1) {
                System.out.println("b.i");
                throw new NullPointerException();
            }
            System.out.println("b.c");
        } catch (NullPointerException ex) {
            System.out.println("b.n");
        } finally {
            System.out.println("b.f");
        }
        System.out.println("b.e");
    }

    public void a(int v) throws Exception {
        System.out.println("a.s");
        try {
            System.out.println("a.t");
            b(v);
            System.out.println("a.c");
        } catch (Exception ex) {
            System.out.println("a.n");
        } finally {
            System.out.println("a.f");
        }
        System.out.println("a.e");
    }
}
