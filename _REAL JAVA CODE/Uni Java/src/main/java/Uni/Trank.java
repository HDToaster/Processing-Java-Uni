package Uni;

public class Trank extends Item {

    Effect effect;

    public Trank (String name, float weight, Effect effect)
    {
        super(name,weight);
        this.effect = effect;
    }

    public void Trinken(){
        System.out.println("Gulp");


    }
}
