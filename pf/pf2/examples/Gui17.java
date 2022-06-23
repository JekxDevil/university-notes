import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JTextField;
import javax.swing.border.Border;
import javax.swing.JFrame;
import java.awt.BorderLayout;
import java.awt.FlowLayout;

public class Gui17 {
    public static class Frame extends JFrame {
        public Frame() {
            this.add(new Pane(), BorderLayout.CENTER);
            this.setSize(300, 300);
            this.setVisible(true);
            this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        }
    }

    public static class Pane extends JPanel {
        public Pane () {
            // textfield
            JTextField textfield = new JTextField();
            textfield.setText("hello");

            // buttons
            JButton ok = new JButton("Ok");
            JButton cancel = new JButton("Cancel");

            // create flowpanel and its panel to add buttons to
            FlowLayout fl = new FlowLayout();
            JPanel p = new JPanel();
            p.add(ok);
            p.add(cancel);
            p.setLayout(fl);

            // set in the panel the layouts
            this.setLayout(new BorderLayout());
            this.add(textfield, BorderLayout.CENTER);
            this.add(p, BorderLayout.SOUTH);
        }
    }
}
