package TinyTextAdventure.Monster;

import TinyTextAdventure.IHit;
import TinyTextAdventure.Inventory.Item;
import TinyTextAdventure.Util;
import TinyTextAdventure.Inventory.Weapons.Weapon;

public class Monster implements IHit {

    public String name;
    public int hp;

    public Item item;
    public Weapon weapon;

    public Monster (String name,int hp, Item item, Weapon weapon )
    {
        this.name = name;
        this.hp = hp;
        this.item = item;
        this.weapon = weapon;
    }


    public void Attack(Monster m)
    {
        Util.s(name + " attacks "+ m.name);
        m.TakeDamage(this);
    }


    @Override
    public boolean TakeDamage(Monster attacker) {
        hp -= attacker.weapon.damage;
        attacker.weapon.UseItem(attacker);
        System.out.println(name+" was hit by " + attacker.name+ " with " + attacker.weapon + " " + " HP left : " + hp);
        return true;
    }
}
