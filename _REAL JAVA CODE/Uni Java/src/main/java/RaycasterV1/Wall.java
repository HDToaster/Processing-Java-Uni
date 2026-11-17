package RaycasterV1;

import java.awt.*;

public class Wall extends Object{

    public Wall(){
        color = new Color(135, 71, 16);
    }

    public boolean isWalk(){
        return false;
    }
}
