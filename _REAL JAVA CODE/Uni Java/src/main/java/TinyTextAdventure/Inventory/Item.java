package TinyTextAdventure.Inventory;


import TinyTextAdventure.Monster.Monster;
import TinyTextAdventure.Renderer.Sprite;
import TinyTextAdventure.Util;

public abstract class Item {

    public String name;

    public float weight;

    public Sprite sprite;

    public void UseItem(Monster user){
        Util.s(user.name + " used " +name);
    }
}
