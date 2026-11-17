package FallingBlocksV1;

import FallingBlocksV1.Blocks.Acid;
import FallingBlocksV1.Blocks.SandBlock;
import FallingBlocksV1.Blocks.StoneBlock;
import FallingBlocksV1.Blocks.WaterBlock;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;
import java.util.List;

public class FallingBlockSimulator extends JPanel implements ActionListener, KeyListener {



    public ArrayList<Block> blocks = new ArrayList<>();

    int sizex;
    int sizey;


    int cellSize = 30;
    public int GetCellSize () {return cellSize;}


    Timer gameLoop;


    //int gameTickTime = 60;
    int gameTickTime = 20;
    int Tick;

    int selectedBlock = 0;

    public FallingBlockSimulator(int sizex, int sizey)
    {
        System.out.println("Falling Block Simulation Created");
        this.sizex = sizex;
        this.sizey = sizey;

        SetUpGame();

        gameLoop = new Timer(1000/60, this);
        gameLoop.start();




    }



    public void SetUpGame()
    {
        Tick = gameTickTime;

        for (int i = 0; i < sizex; i++){
            SandBlock sand = new SandBlock(i ,1);
            blocks.add(sand);
        }

        StoneBlock stone = new StoneBlock(3,4);
        blocks.add(stone);


    }


    public void DrawWorldBorder(Graphics g)
    {
        //g.setColor(Color.gray);
        //g.fillRect(10,10,sizex, sizey);


        for (int x = 0; x < sizex; x += 1){

            for (int y = 0; y < sizey; y += 1)
            {

                Color c = (x % 2 == 0) ? Color.GRAY : Color.DARK_GRAY;
                g.setColor(c);
                g.drawRect(x * cellSize,y * cellSize,cellSize,cellSize);

            }
        }

    }


    public void addBlock(int x, int y, int id)
    {

        if (!IsFree(x,y,null)){
            System.out.println("No Place was free so no block was made!");
            return;
        }

        Block block = new Block(x,y,Color.PINK);
        switch (id){
            case 0:
                block =  new SandBlock(x,y);
                break;
            case 1:
                block = new StoneBlock(x,y);
                break;
            case 2:
                System.out.println("Added Water");
                block = new WaterBlock(x,y);
                break;
            case 3:
                block = new Acid(x,y);
                System.out.println("Added Acid");
                break;
            default:
                System.out.println("NO BLOCK FOUND TO ADD IN ADD BLOCK METHOD");

        }
        blocks.add(block);
    }




    //Game Logic


    public boolean IsFree(int x, int y, Block ignoredBlock)
    {
        if (y >= sizey || y < 0)
        {
            return false;
        }
        if (x < 0 || x >= sizey)
        {
            return false;
        }
        for (Block b : blocks)
        {
            if (b == ignoredBlock) {continue;}
            if (b.x == x && b.y == y)
            {
                return false;
            }
        }
        return true;
    }

    public Block GetBlock(int x, int y){
        for (Block b : blocks){
            if (b.x == x && b.y == y)
            {
                return b;
            }
        }
        return null;
    }

    public void RemoveBlock(int x, int y){
        Block hit = GetBlock(x,y);
        if (hit != null){
            blocks.remove(hit);

        }
    }

    //Game Loop And Drawing game

    protected void paintComponent(Graphics g)
    {
        super.paintComponent(g);

       // g.drawRect(10, 10, 20, 20);


        g.setColor(Color.gray);


        Dimension dimension =  getSize();
        g.fillRect(0,0,dimension.width, dimension.height);

        DrawWorldBorder( g);


        for (Block b : blocks)
        {
            b.DrawBlock(g,this);
        }
        Tick++;



        if (Tick > gameTickTime){
            //Update all blocks
            for (Block b : blocks)
            {
                if (b == null) continue;
                b.BlockAction(this);
                b.moveBlock(this);
            }
            Tick = 0;
        }




        //System.out.println("Mouse X " + info.x + " Mouse Y " + info.y);

        Point mouse = GetMousePos();

    }

    public Point GetMousePos()
    {
        Point info = MouseInfo.getPointerInfo().getLocation() ;
        //System.out.println("Mouse X " + info.x + " Mouse Y " + info.y);
        info = ScreenToWorld(info.x,info.y);
        //System.out.println("Mouse X " + info.x + " Mouse Y " + info.y);
        return info;
    }

    public Point ScreenToWorld(int x, int y)
    {

        Point pos =  getLocationOnScreen();
        float calcX = (x - pos.x) / (float) cellSize;
        float calcY = (y - pos.y) / (float) cellSize;

        Point p = new Point();

        p.x = Math.round(calcX);
        p.y = Math.round(calcY);

        return p;

    }


    @Override
    public void actionPerformed(ActionEvent e) {

        //This gets called by the timer

        if (isMousePressed){
            DoMouse();
        }



        repaint();



    }



    public void SelectBlock(int id)
    {

        selectedBlock = id;
    }

    boolean isMousePressed;

    public void OnMouseClicked()
    {
        isMousePressed = true;
    }
    public void OnMouseReleased()
    {
        isMousePressed = false;
    }
    public void DoMouse()
    {
        System.out.println("Mouse Was CLicked");
        Point pos = GetMousePos();
        addBlock(pos.x,pos.y,selectedBlock);
    }


    //KeyBoardInputs


    @Override
    public void keyTyped(KeyEvent e) {

    }

    @Override
    public void keyPressed(KeyEvent e) {

    }

    @Override
    public void keyReleased(KeyEvent e) {

    }


}
