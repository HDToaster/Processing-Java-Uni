package Uni;

public abstract class Item implements IComparable{

    int id;
    String name;
    float weight;
    //float power;
    //float range;
    //float damage;


    private static int itemCount = 0;

    public static int  GetItemCount ()
    {
        return itemCount;
    }

    public Item(String name, float weight){
        //this.id = id;
        this.name = name;
        this.weight = weight;
        //this.power = power;
        //this. range = range;
        //this.damage = damage;

        itemCount++;
        this.id = GetItemCount();
    }

    public void List()
    {
        System.out.println(name + " Uni.Item id is " + id);

    }

    public boolean IsThisBiggerThen(IComparable compare){

        return (GetValue() > compare.GetValue());

    }

    public float GetValue(){

        return weight;

    }

}