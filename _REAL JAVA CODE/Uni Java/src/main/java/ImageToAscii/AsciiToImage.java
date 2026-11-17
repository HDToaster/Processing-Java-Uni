package ImageToAscii;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.io.File;

public class AsciiToImage {

    public AsciiToImage()
    {
        String filePath = "C:\\Users\\Mattis\\Documents\\GitHub\\Processing-Java-Uni\\_REAL JAVA CODE\\Uni Java\\src\\main\\java\\ImageToAscii\\" + "image.png";

        File f = new File(filePath);

        try{
            BufferedImage b = ImageIO.read(f);
            int width = b.getWidth();
            int height = b.getHeight();

            String finalString  = "";

            for (int y = 0; y < height; y++){

                String workingString = "";

                    for (int x=0; x< width ; x ++){

                    int rgb = b.getRGB(x,y);
// Extract color components
                    int red = (rgb >> 16) & 0xFF;
                    int green = (rgb >> 8) & 0xFF;
                    int blue = rgb & 0xFF;
                    //System.out.println("Value " + value[ x + y * width]);
                    //System.out.println("Val " + red + " " + green + " " + blue);

                    float brightness = (red + green + blue) / 3f;

                    float normalBrightness = brightness / 255f;

                    String[] pal = {"#", "W", "H","L","[","*","o","+","-","."," "};

                    float calculatedBrightness = (float) Math.clamp(Math.pow((normalBrightness ), 2f) , 0f ,1f );


                    String stringValue = pal[LerpInt(0, pal.length-1, calculatedBrightness)];
                    //System.out.println();
                    workingString+=stringValue + " ";
                }
                finalString+=workingString + "\n";
            }

            System.out.println(finalString);

        }catch (Exception e){
            System.out.println("Failed");
            e.printStackTrace();
        }

        System.out.println();
    }

    public static BufferedImage imageFromPath(String name){
        String filePath = "C:\\Users\\Mattis\\Documents\\GitHub\\Processing-Java-Uni\\_REAL JAVA CODE\\Uni Java\\src\\main\\java\\ImageToAscii\\" + name;

        File f = new File(filePath);

        try{
            BufferedImage b = ImageIO.read(f);

            return b;

        }catch (Exception e){

        }

        return null;
    }


    public static int LerpInt(int a, int b, float t){
        float l = Lerp(a,b,t);
        return (int) Math.floor(l);
    }
    public static float Lerp(float a, float b, float t)
    {
        return a + (b - a) * t;
    }


    public static void main(String[] args){
        AsciiToImage i = new AsciiToImage();
    }


}
