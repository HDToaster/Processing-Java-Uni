package Uni;

public class Nahkampfwaffe extends Weapon{

    Nahkampfwaffe ( String name, float weight,float power, float range, float damage)
    {
        super ( name, weight, power, range, damage);
    }
    Nahkampfwaffe()
    {
        super ("Holz Schwert", 1, 2, 1, 1);
    }


}
