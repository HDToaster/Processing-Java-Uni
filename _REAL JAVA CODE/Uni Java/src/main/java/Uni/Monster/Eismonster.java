package Uni.Monster;

public class Eismonster extends Monster{

    boolean isFrozen = false;

    public Eismonster()
    {
        super("Eismonster", 20, 100);
        isFrozen = false;


    }

     @Override
     public void Move()
     {
         if (isFrozen)
         {
             return;
         }
     }


    public void Freeze()
    {
        System.out.println("The Eismonster freezes and does not move anymore");
    }
}
