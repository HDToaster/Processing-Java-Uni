package RaycasterV1;

public class Player {
    public int x,y;

    public float angle = 0;

    int speed = 10;

    public KeyHandler keyHandler = new KeyHandler();

    public Player(int x, int y){

        this.x =x;
        this.y =y;

    }

    public void updatePlayer(){

        int oldx=x;
        int oldy=y;

        if (keyHandler.pressUp){
            y-= speed;
        }if (keyHandler.pressDown){
            y+= speed;
        }if (keyHandler.pressRight){
            x+= speed;
        }if (keyHandler.pressLeft){
            x-= speed;
        }

    }
}
