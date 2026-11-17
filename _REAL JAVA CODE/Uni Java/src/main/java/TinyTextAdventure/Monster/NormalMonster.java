package TinyTextAdventure.Monster;

import TinyTextAdventure.Inventory.Item;
import TinyTextAdventure.Inventory.Weapons.Fists;

public class NormalMonster extends Monster {

    public NormalMonster(String name, Item item){
        super(name,12,item,new Fists());
    }
}
