package FallingBlocksV1;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class Main {
    public static void main(String[] args){

        JFrame frame = new JFrame();
        //Drawer d = new Drawer();


        //Create a Falling Block Simulatoer
        // It extends JFrame => can be added to the jframe
        FallingBlockSimulator simulator = new FallingBlockSimulator(10, 10);


        frame.getContentPane().addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {

            }
            @Override
            public void mousePressed(MouseEvent e){
                simulator.OnMouseClicked();
            }
            @Override
            public void mouseReleased(MouseEvent e){
                simulator.OnMouseReleased();
            }
        });

        frame.add(simulator);

        String[] blockNames = {"Sand", "Stone","Water","Acid"};
        int i = 0;
        for (String name : blockNames){
            JButton button = new JButton(name);
            var value = i;

            button.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {

                    simulator.SelectBlock(value);
                }
            });
            button.setBounds(simulator.sizex* simulator.cellSize + simulator.cellSize + 70 , i * simulator.cellSize *3, simulator.cellSize *2, simulator.cellSize);
            simulator.add(button);

            i++;
        }






        frame.setSize(600,400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);



    }



}
