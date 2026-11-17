package Uni;

public class Weapon extends Item{

    float damage;
    float range;
    float power;

    public Weapon(String name,float weight, float power, float range, float damage)
    {
        super(name,weight);
        //this.id = id;
        //this.name = name;
        //this.weight = weight;
        this.power = power;
        this. range = range;
        this.damage = damage;

    }

    public float GetDamage()
    {
        return damage;

    }
}
