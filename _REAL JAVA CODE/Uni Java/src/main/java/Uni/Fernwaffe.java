package Uni;

public class Fernwaffe extends Weapon{

    Fernwaffe (String name, float weight,float power, float range, float damage)
    {
        super ( name, weight, power, range, damage);
    }
    Fernwaffe()
    {
        super ("Glock", 20, 2, 100, 500);
    }
}
