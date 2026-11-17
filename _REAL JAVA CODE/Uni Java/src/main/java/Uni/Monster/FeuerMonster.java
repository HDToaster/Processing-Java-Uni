package Uni.Monster;

public class FeuerMonster extends Monster{


    public FeuerMonster(String name)
    {
        super(name, 40, 200);
    }

    @Override
    public void Move() {
        System.out.println("Using hot lava this firemosnter moves");
    }

    public void Burn()
    {
        System.out.println("The fire monster burns menacingly");
    }

}
