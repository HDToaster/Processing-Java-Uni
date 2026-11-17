package ImageToAscii;

import org.joml.Vector3d;
import org.joml.Vector3i;

import javax.swing.*;
import java.awt.*;
import java.awt.font.GlyphVector;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class VisualRenderer extends JFrame {

    String file ="image2.png";
    int width = 0;
    int height = 0;

    int xoff = 10;
    int yoff = 10;

    int spacing = 17;

    BufferedImage b;
    String[] pal = {"#", "W", "H","L","[","*","o","+","-","."," "};
    float time = 0;
    public VisualRenderer () throws InterruptedException {

        b = AsciiToImage.imageFromPath(file);

        height = b.getHeight();
        width = b.getWidth();



        setVisible(true);
        setSize(1500,1400);

        while (true){
            Thread.sleep(10);
            time+= 0.1f;
            System.out.println("Frame drawn");
            repaint();

            xoff+= 1;
        }
    }


    public void paint(Graphics g) {
        Graphics2D g2d = (Graphics2D) g;


       // asciifall(g2d);

        g.setColor(Color.pink);


      //  g.fillRect(0,0,5000,5000);
        g.setColor(Color.cyan);

        asciifall( g2d);


      repaint();
    }
    public void  asciipaint( Graphics2D g){
        for (int y = 0; y < height; y++){
            for (int x = 0; x < width; x++)
            {
                String val = getStringFromBrigthness(getBrightnessNormal(x,y));


                Vector3i rgb = GetRGB(x,y);

                Color c = new Color(rgb.x,rgb.y,rgb.z);

                g.setColor(c);

                g.fillRoundRect(xoff + x * spacing, yoff + y * spacing,spacing,spacing,12,12);
                g.setColor(Color.black);
                g.drawString(val,xoff+x*spacing,yoff+y*spacing);
            }
        }
    }
    public ArrayList<visualElement> elements = new ArrayList<visualElement>();
    public void asciifall(Graphics2D g){
        if (elements.size() < 2){
            for (int y = 0; y < height; y++){
                for (int x = 0; x < width; x++)
                {
                    String val = getStringFromBrigthness(getBrightnessNormal(x,y));


                    Vector3i rgb = GetRGB(x,y);

                    Color c = new Color(rgb.x,rgb.y,rgb.z);
                    visualElement newVisual = new visualElement(xoff + x * spacing, yoff + y * spacing,c);

                    elements.add(newVisual);
                }
            }
        }
        Random r = new Random();


        System.out.println(time);
        for (visualElement v : elements){
            //if (v.y < height * spacing+50){



                v.y += 1;
                //v.x +=(float) Math.sin(time * 24 ) * 2f;
               // v.x +=12;
           // }

            g.setColor(v.c);
            g.fillRoundRect((int)v.x,(int)v.y,spacing,spacing,12,12);
        }


    }


    public String getStringFromBrigthness(float brighness){
        return pal[AsciiToImage.LerpInt(0,pal.length-1, brighness)];
    }

    public float getBrightness(int x, int y){
        Vector3i v = GetRGB(x,y);
        return (v.x+v.y+v.z) / 3f;
    }
    public float getBrightnessNormal(int x, int y){

        return getBrightness(x,y) / 255f;
    }


    public Vector3i GetRGB(int x, int y){
        return VisualRenderer.GetRGB(x,y,b);
    }

    public static Vector3i GetRGB(int x, int y, BufferedImage b){
        int rgb = b.getRGB(x,y);
// Extract color components
        int red = (rgb >> 16) & 0xFF;
        int green = (rgb >> 8) & 0xFF;
        int blue = rgb & 0xFF;

        return new Vector3i(red,green,blue);
    }



    public static void main(String[] args)
    {
        try{
            VisualRenderer v = new VisualRenderer();

        }catch (InterruptedException e){
            e.printStackTrace();
        }
    }
}
