package TinyTextAdventure.Renderer;

import TinyTextAdventure.Util;

public class ASCIIRenderer {

boolean debug = false;
    public static char[] pal = {'W','A','O','I','i','+','-','.', ' '};
    public static int palL = pal.length-1;


    public ScreenData[][] screen;

    public static int w = 128;
    public static int h = 12;

    public ASCIIRenderer(){
        screen = new ScreenData[w][h];

        Util.s("Color Palletet : " + palL);

        for (int y = 0; y < h; y++){


            for (int x = 0; x < w; x++) {

                screen[x][y] = new ScreenData();

            }

        }
        //SetScreen(5);
    }
    public ASCIIRenderer(int _w, int _h){
        w = _w;
        h = _h;
        screen = new ScreenData[w][h];

        Util.s("Color Palletet : " + palL);

        for (int y = 0; y < h; y++){


            for (int x = 0; x < w; x++) {

                screen[x][y] = new ScreenData();

            }

        }
    }

    /*
    Sets the entire screen buffer to color at index
     */
    public void SetScreen(int index){
        for (int y = 0; y < h; y++){


            for (int x = 0; x < w; x++) {

                PSet( x,  y,  index);

            }

        }
    }
    /*
    Sets screen buffer at x,y to index 0 of str and prints the rest in the same matter
     */

    public void PSet(int x, int y, int index){
        if (InBound(x,y)) {

            screen[x][y].SetNumber(index % palL);
        }
    }
    public void PSet(int x, int y, char c){

        if (InBound(x,y)){
            screen[x][y].SetChar(c);

        }


    }

    public void Print(int x, int y, String str){
       for (int i = 0;i < str.chars().count(); i++){

                PSet(x + i,y,str.charAt(i));

       }
    }
    public void DrawSprite(int x, int y, Sprite sprite){
            for (int iy = 0; iy < sprite.h; iy++)
                for (int ix = 0; ix < sprite.w; ix++){

            {
                PSet(x + ix, y + iy,sprite.data[ix][iy].GetValue());
            }
        }
    }

    /*
    Draws the screen
     */
    public void Draw(){
        Util.s("New Frame. -----------------------------------------------------------");
        String scr = "";

        for (int y = 0; y < h; y++){

            String newScr = "";

            for (int x = 0; x < w; x++) {

                newScr += screen[x][y].GetValue();
                if (debug) {
                    newScr+=screen[x][y].valueNum;
                }
            }

            newScr += "\n";
            scr+=newScr;
        }

        Util.s(scr);

        Util.s("End Frame -----------------------------------------------------------");

    }


    public boolean InBound(int x, int y){
        return  x >= 0 && x < w && y >= 0 && y < h;
    }

    public static char GetCharFromIndex(int index){
        if (index < 0 ){
            return ' ';
        }
        return pal[ index % palL];
    }
}

