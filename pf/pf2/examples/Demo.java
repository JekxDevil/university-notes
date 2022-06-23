public class Demo {
        public static int calc(String[] args) { // ArrayIndexOutOfBoundsException
            int a = Integer.parseInt(args[0]);  // NumberFormatException
            String op = args[1];
            int b = Integer.parseInt(args[2]);
            if (op.equals("*")) {               // NullPointerException
                return a * b;
            } else {
                return a/b ;                    // ArithmeticException
            }
        }
}
