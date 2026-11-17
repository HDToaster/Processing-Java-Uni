package RaycasterV1;

import java.awt.*;

public class Air extends Object {
    public Air(){
        color = new Color(0,0,0,0);
    }

    @Override
    public boolean isWalk() {
        return true;
    }
}
