package Renderer;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
public class Renderer extends JFrame {

    public static String objPath = "C:\\Users\\Mattis\\Documents\\GitHub\\Processing-Java-Uni\\_REAL JAVA CODE\\Uni_Java_3\\src\\main\\java\\cube.obj";

    public ArrayList<Object> objects = new ArrayList<>();


    public Renderer(){
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
        setSize(900,450);



    }


    @Override
    public void paint(Graphics g) {
        super.paint(g);
        renderFrame((Graphics2D) g);



    }

    public void renderFrame(Graphics2D g){
        g.setColor(Color.black);
        g.fillRect(0,0,getWidth(), getHeight());

        for (Object o : objects){
            o.render(g);
        }

        System.out.println("Rendering");
    }

    static void main(String[] args){
        Renderer r = new Renderer();

        ObjectCreator creator = new ObjectCreator();
        Object o = ObjectCreator.createNewObject(objPath);

    }
}
