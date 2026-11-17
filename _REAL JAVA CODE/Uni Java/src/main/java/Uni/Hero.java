package Uni;

import Uni.Monster.Monster;
import net.minecraft.world.entity.player.Inventory;

public class Hero {

    inventory inv;

    public final int MAXHEALTH;
    public Hero (int maxHealth)
    {

        inv = new inventory();



        MAXHEALTH = maxHealth;
    }

    public void Attack(Monster m)
    {
        System.out.println("Hero is fighting " + m.name);
    }

    public void Defent(Monster m){
        System.out.println("Hero defends against "+ m.name);
    }
}
