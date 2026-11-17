package TinyTextAdventure.Inventory.Weapons;

import TinyTextAdventure.Inventory.Item;
import TinyTextAdventure.Renderer.Sprite;

public class Weapon extends Item {

    public int damage;
    public float range;

    public Weapon(String name, float range, int damage){
        this.name = name;
        this.range = range;
        this.damage = damage;
        this.sprite = new Sprite(name);
    }


}
