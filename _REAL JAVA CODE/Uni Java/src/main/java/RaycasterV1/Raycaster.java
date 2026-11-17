package RaycasterV1;

import org.joml.Vector2d;

import javax.swing.*;
import java.awt.*;
import java.util.Scanner;


public class Raycaster extends JPanel {

    public int width = 1200;
    public int height = 800;
    Scanner scanner = new Scanner(System.in);

    KeyHandler keyHandler = new KeyHandler();

    public Vector2d offset = new Vector2d(30,100);

    Map m = new Map(100,100);

    Player player = new Player(40,40);

    public Raycaster() throws InterruptedException{


        //Init

        setSize(width,height);
        setVisible(true);
        JFrame frame = new JFrame();

        frame.add(this);
        frame.setVisible(true);
        frame.setSize(1200,1000);

        frame.addKeyListener(player.keyHandler);


        //Game Loop
        while (true)
        {
            Thread.sleep(20);


            update();

            repaint();
        }
    }


    public void update(){
        player.updatePlayer();

    }


    @Override
    public void paintComponent(Graphics g){
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;



        for (int y = 0; y < m.height ; y ++){
            for (int x =0; x < m.width ; x ++){
                g2.setColor(m.data[x][y].color);
                g2.fillRect((int)offset.x + x * m.displayWidth, (int)offset.y + y * m.displayWidth, m.displayWidth, m.displayWidth);
            }
        }
        g2.setColor(new Color(255,20,255));
        g2.fillOval(player.x,player.y,10,10);
        g2.fillOval(player.x + (int) Math.cos(player.angle) * 8,player.y + (int) Math.sin(player.angle) * 8,4,4);


    }

    public void Ray(int x, int y, float angle, Graphics2D g){

    }


    public static void main(String[] args){

        try{
            Raycaster r = new Raycaster();

        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }



    }
}
