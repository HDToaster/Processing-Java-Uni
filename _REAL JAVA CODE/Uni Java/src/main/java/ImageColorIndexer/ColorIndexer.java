package ImageColorIndexer;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;

public class ColorIndexer {


     String filePath ="C:\\Users\\Mattis\\Documents\\GitHub\\Processing-Java-Uni\\_REAL JAVA CODE\\Uni Java\\src\\main\\java\\ImageColorIndexer\\";
    String fileName ="img_1.png";


     float scaler = 1000000;

    int height=0;

    int width=0;

    File f = new File(filePath+fileName);

    File output = new File("C:\\Users\\Mattis\\Documents\\GitHub\\Processing-Java-Uni\\_REAL JAVA CODE\\Uni Java\\src\\main\\java\\ImageColorIndexer\\output.png");


    BufferedImage image;



    public ColorIndexer()
     {
         try{
             image= ImageIO.read(f);

         } catch (IOException e) {
             e.printStackTrace();
             return;
         }


         width = image.getWidth();
         height = image.getHeight();


         try
         {
             //floatingPointError();
             closestColor();
         } catch (IOException e) {
            e.printStackTrace();
         }
     }

     public void floatingPointError() throws IOException
     {


             for (int x = 0; x < width; x++)
             {
                 for (int y = 0; y < height; y++)
                 {
                     int rgbValue = image.getRGB(x,y);
                     rgbValue =Math.round( Math.round(rgbValue/scaler )* scaler);
                     image.setRGB(x,y , rgbValue);
                 }

             }

             ImageIO.write(image, "png",output);

             System.out.println("Done !");
             System.out.println(output.getAbsolutePath());



     }

     public void closestColor() throws  IOException{

        Color [] colors = {
                new Color(1f,0.9f,0.8f),
                new Color(1f,0.9f,0.89f),
                new Color(1f,0.2f,0.8f),
                new Color(1f,0.1f,0.8f),
                new Color(1f,0.2f,0.8f),
                new Color(1f,0.4f,0.8f),
                new Color(0.2f,0.1f,0.1f),
                new Color(0.2f,0.1f,0.2f),
                new Color(1f,0.9f,0.4f),
                new Color(1f,0.5f,0.2f),
                new Color(0.2f,0.5f,0.2f),

        };

        colors = generateColors(15);

         for (int x = 0; x < width; x++){
             for (int y = 0; y < height; y++){
                 int rgb = image.getRGB(x,y);
                 image.setRGB(x,y,getClosestColor(colors,  new Color(rgb)));
             }
         }
ImageIO.write(image,"png", output);



     }
    private Color[] generateColors(int perChannel){
        Color[] colors = new Color[perChannel*3];

        for (int i = 0; i < perChannel; i++){
            float value = i/ (float)perChannel;
            Color newColor= new Color( value, value / 13f,value / 12f);
            colors[i] = newColor;
        }

        for (int i = 0; i < perChannel; i++){
            float value = i/ (float)perChannel;
            Color newColor= new Color( value / 13f, value,value / 11f);
            colors[i + perChannel] = newColor;

        }

        for (int i = 0; i < perChannel; i++){
            float value = i/ (float)perChannel;
            Color newColor= new Color( value / 6f, value / 14f,value);
            colors[i + perChannel*2] = newColor;

        }


        return colors;
    }
     public int getClosestColor(Color[] colors, Color color){
        Color colorPick = colors[0];
        int bestScore=2550;

        for (Color c : colors){
            int r = c.getRed();
            int g = c.getGreen();
            int b = c.getBlue();


            int rdiff = Math.abs( color.getRed() - r );
            int gdiff = Math.abs( color.getGreen() - g );
            int bdiff = Math.abs( color.getBlue() - b );

            int totalScore= rdiff+gdiff+bdiff;

            if (totalScore < bestScore){
                bestScore = totalScore;
                colorPick = c;
            }

        }

        return colorPick.getRGB();
     }
     public static void main(String[] args)
     {
         ColorIndexer i = new ColorIndexer();
     }
}
