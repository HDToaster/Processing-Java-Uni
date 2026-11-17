package Uni;

import Uni.Monster.Eismonster;
import Uni.Monster.FeuerMonster;
import Uni.Monster.Phoenix;

public class main {

    public static void main(String[] args)
    {

        Hero h = new Hero(20);
        //inventory inv = new inventory();

        Weapon w = new Weapon("My Uni.Weapon 1",1,1,1,1);
        Trank t= new Trank("Drink",2,new Effect(1));

        Nahkampfwaffe w2 = new Nahkampfwaffe();

        h.inv.AddItem(w);
        h.inv.AddItem(w2);
        h.inv.AddItem(t);






        FeuerMonster feuerm = new FeuerMonster("Ludwig van Feuerburg");
        Eismonster eism = new Eismonster();
        Phoenix f = new Phoenix();

        Fernwaffe w3 = new Fernwaffe();

        h.inv.AddItem(w3);

        eism.Attack(f);

        h.Attack(eism);

        h.inv.ShowInventory();

        h.inv.ShowInventorySorted();





    }
}
