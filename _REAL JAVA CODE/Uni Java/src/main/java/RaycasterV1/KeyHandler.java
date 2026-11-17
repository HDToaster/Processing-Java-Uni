package RaycasterV1;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class KeyHandler implements KeyListener {

    public  boolean pressUp,pressDown,pressLeft,pressRight;




    @Override
    public void keyTyped(KeyEvent e) {

    }

    @Override
    public void keyPressed(KeyEvent e) {
        int c = e.getKeyCode();

        if (c == KeyEvent.VK_W){
            pressUp=true;
        }if (c == KeyEvent.VK_S){
            pressDown=true;
        }if (c == KeyEvent.VK_A){
            pressLeft=true;
        }if (c == KeyEvent.VK_D){
            pressRight=true;
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {
        int c = e.getKeyCode();

        if (c == KeyEvent.VK_W){
            pressUp=false;
        }if (c == KeyEvent.VK_S){
            pressDown=false;
        }if (c == KeyEvent.VK_A){
            pressLeft=false;
        }if (c == KeyEvent.VK_D){
            pressRight=false;
        }
    }
}
