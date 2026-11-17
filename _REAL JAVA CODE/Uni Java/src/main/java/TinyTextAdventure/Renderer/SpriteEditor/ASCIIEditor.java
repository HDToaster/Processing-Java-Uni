package TinyTextAdventure.Renderer.SpriteEditor;


import TinyTextAdventure.Renderer.ASCIIRenderer;
import TinyTextAdventure.Renderer.ScreenData;
import TinyTextAdventure.Renderer.Sprite;
import TinyTextAdventure.Util;

import java.util.Scanner;

public class ASCIIEditor {


    boolean run = true;

    Sprite sprite;
    ASCIIRenderer r;

    public static void main(String[] args){


        ASCIIEditor a = new ASCIIEditor();
    }

    public ASCIIEditor(){
        s("--------Editor running---------");


        int width = Util.inputN("Width: ");
        int height = Util.inputN("Height: ");


        sprite = new Sprite("sprite");
        sprite.data[1][1].SetNumber(1);
        r = new ASCIIRenderer();

        while (run){

            r.SetScreen(-1);
            r.DrawSprite(1,1,sprite);
            r.Draw();


            HandleCommand();
        }


    }
    public void Menu(){
        s("Menu");
        s("fill (index)");
        s("save (name)");
    }
    public void HandleCommand(){
        Menu();
        String action = Util.input("Action :");

        String[] arg = action.split(" ");
        String operator = arg[0];

        s("Operation is "+ operator);
        if (operator.equals("fill")){
            s("Filling start, color is " + arg[1]+ " " + ASCIIRenderer.GetCharFromIndex(Integer.parseInt(arg[1])));
            for (int i = 0; i < sprite.w; i++)
            {
                for (int y = 0; y< sprite.h; y++)
                {
                    sprite.data[i][y].SetNumber(Integer.parseInt(arg[1]));
                }
            }
            return;


        }else if ( operator.equals("s")){
            s("PSet start, color is " + arg[3]+ " " + ASCIIRenderer.GetCharFromIndex(Integer.parseInt(arg[3])));
            sprite.PSet(Integer.parseInt(arg[1]),Integer.parseInt(arg[2]),Integer.parseInt(arg[3]));
        }
        else{
            s("Operation is not valid");

        }

        s("Error");

    }
    void s(String str){
        Util.s(str);
    }

}
