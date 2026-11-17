package TinyTextAdventure.Renderer;

import TinyTextAdventure.Util;

import java.io.*;
import java.util.Scanner;

public class Sprite {


    public int w;
    public int h;

    public ScreenData[][] data;

    public Sprite(String dataPath) {
        String _dataPath = "C:\\Users\\Mattis\\Documents\\GitHub\\Processing-Java-Uni\\_REAL JAVA CODE\\Uni Java\\src\\main\\java\\TinyTextAdventure\\Renderer\\SpriteEditor\\" + dataPath + ".txt";
        try {
            Util.s("Loading sprite " + dataPath);

            File f = new File(_dataPath);
            Scanner scanner = new Scanner(f);

            w = Integer.parseInt( scanner.nextLine());
            h = Integer.parseInt( scanner.nextLine());

            //Empty Sprite
            this.data = new ScreenData[w][h];

            for (int y = 0; y < h; y++) {

                for (int x = 0; x < w; x++) {

                    this.data[x][y]= new ScreenData();
                    this.data[x][y].SetNumber(-1);

                }
            }

            // Read file into
            for (int i = 0; i < h; i++)
            {
                String readValueFull = scanner.next();

                for (int x = 0; x < w; x++){
                    String readValue =""+ readValueFull.charAt(x);

                    if (readValue.equals("x")){

                        this.data[x][i].SetChar(' ');
                        continue;
                    }
                    this.data[x][i].SetNumber(Integer.parseInt(readValue ));
                    //System.out.println(x +" "+i+" "+ " "+ readValue);
                }

            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }

    public Sprite(int _w, int _h){
        w = _w;
        h = _h;
        this.data = new ScreenData[w][h];
        for (int y = 0; y < h; y++) {

            for (int x = 0; x < w; x++) {

                this.data[x][y]= new ScreenData();

            }
        }
    }

    public Sprite(ScreenData[][] data) {
        w = data.length;
        h = data[0].length;

        this.data = new ScreenData[w][h];
        for (int y = 0; y < h; y++) {

            for (int x = 0; x < w; x++) {

                this.data[x][y]= new ScreenData();

            }
        }
        for (int y = 0; y < h; y++) {


            for (int x = 0; x < w; x++) {
                if (data[x][y].holdsNum){
                    this.data[x][y].SetNumber(data[x][y].valueNum);
                }else{
                    this.data[x][y].SetChar(data[x][y].valueChar);

                }


            }
        }

    }

    public void PSet(int x, int y, int index){
        if (x >= 0 && x < w && y >=0 && y <h){
            data[x][y].SetNumber(index);
        }
    }



}
