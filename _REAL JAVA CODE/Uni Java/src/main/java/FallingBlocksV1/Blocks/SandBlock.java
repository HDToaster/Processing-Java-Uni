package FallingBlocksV1.Blocks;

import FallingBlocksV1.Block;
import FallingBlocksV1.FallingBlockSimulator;

import java.awt.*;

public class SandBlock extends Block
{

    public SandBlock(int x, int y)
    {
        super(x,y, Color.YELLOW);
        name = "Sand";
    }



    @Override
    public void moveBlock(FallingBlockSimulator faller)
    {
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
        }
    }

}
