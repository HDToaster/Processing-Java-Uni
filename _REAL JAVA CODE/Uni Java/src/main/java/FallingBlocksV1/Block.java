package FallingBlocksV1;

import java.awt.*;

public class Block {
    protected String name;
    protected int x;
    protected int y;

    protected Color c;


    public Block(int x, int y, Color c)
    {
        this.x = x;
        this.y = y;
        this.c = c;
        this.name = "NO BLOCK ID";
    }


    public void moveBlock(FallingBlockSimulator faller)
    {
        System.out.println("This Block does not move!");
    }

    public void DrawBlock(Graphics g, FallingBlockSimulator faller)
    {
        g.setColor(c);
        g.fillRect(x * faller.cellSize,y * faller.cellSize,  faller.cellSize, faller.cellSize);
    }


    public void BlockAction(FallingBlockSimulator faller){

    }

}
