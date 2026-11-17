package FallingBlocksV1.Blocks;

import FallingBlocksV1.FallingBlockSimulator;

import java.awt.*;

public class Acid extends Liquid{


    public Acid (int x, int y)
    {
        super(x,y, Color.green);
    }

    @Override
    public void BlockAction(FallingBlockSimulator faller) {
        //super.BlockAction(faller);
        if (faller.GetBlock(x,y+1) != null){
            faller.RemoveBlock(x,y+1);
        }else if (faller.GetBlock(x+1,y) != null){
            faller.RemoveBlock(x+1,y);
        }else if (faller.GetBlock(x-1,y) != null){
            faller.RemoveBlock(x-1,y);
        }
    }
}
