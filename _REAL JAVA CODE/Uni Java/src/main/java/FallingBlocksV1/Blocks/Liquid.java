package FallingBlocksV1.Blocks;

import FallingBlocksV1.Block;
import FallingBlocksV1.FallingBlockSimulator;

import java.awt.*;

public class Liquid extends Block {

    public Liquid (int x, int y, Color c)
    {
        super(x,y, c);
    }




    @Override
    public void moveBlock(FallingBlockSimulator faller)
    {

        System.out.println("Default Liqiud Move");

        if (faller.IsFree(x,y+1, this))
        {
            y += 1;


        }else if (faller.IsFree(x+1,y+1, this)){
            //DOESNT ACCOUNT FOR EDGES THAT ARE FILLED

            y+=1;
            x+=1;

        }else if (faller.IsFree(x-1,y+1,this)){
            y+=1;
            x-=1;
        }else if ( faller.IsFree(x+1,y,this)){
            x+=1;
        }else if ( faller.IsFree(x-1,y,this))
        {
            x-=1;
        }
    }

}
