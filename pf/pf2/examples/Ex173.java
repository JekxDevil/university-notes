import javax.swing.JPanel;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Ex173 {

    public static class WelcomePanel1 extends JPanel {
        public WelcomePanel1() {
            final JButton startbutton = new JButton("Start");
            this.add(startbutton);
            startbutton.addActionListener((ev) -> System.out.println(startbutton + " clicked"));
        }
    }

    public static class WelcomePanel2 extends JPanel implements ActionListener {
        private final JButton startbutton = new JButton("Start");

        public WelcomePanel2() {
            this.add(startbutton);
            startbutton.addActionListener(this);
        }

        @Override
        public void actionPerformed(ActionEvent ev) {
            System.out.println(startbutton + " clicked");
        }
    }
}
