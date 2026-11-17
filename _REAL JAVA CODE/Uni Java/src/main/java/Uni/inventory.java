package Uni;

import java.util.ArrayList;
import java.util.List;

public class inventory {

    public ArrayList<Item> items;



    public inventory()
    {
        items = new ArrayList<>() ;

    }

    public void AddItem(Item item){

        items.add(item);

    }


    public void ShowInventory()
    {
        for(Item i : items){
            i.List();
        }

    }


    public void ShowInventorySorted() {
        ArrayList<Item> sortedList = new ArrayList<>();
        ArrayList<Item> newItems = items;

        Item bestPick = null;
        float best = 9999;


        for (int index = 0; index < items.size() ; index++)
        {
            for (var i : newItems)
            {
                if (best > i.GetValue())
                {
                    best = i.GetValue();
                    bestPick = i;
                }
            }

            newItems.remove(bestPick);
            sortedList.add(bestPick);


        }

        for (Item i : sortedList)
        {
            System.out.println(i.name + " weight is " + i.weight);
        }

    }


}