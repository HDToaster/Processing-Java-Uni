package TinyTextAdventure.Inventory;

import java.util.ArrayList;

public class Inventory {

    public ArrayList<Item> items;
    public int maxItems = 8;

    public Inventory()
    {
        items = new ArrayList<Item>();
    }


    public boolean AddItem(Item item)
    {
        if (items.size() < maxItems)
        {
            items.add(item);
            return true;
        }

        return false;
    }

    public void RemoveItem(Item item)
    {
        items.remove(item);
    }


    public void PrintInventory()
    {
        System.out.println("-Inventory-");
        for (Item i : items)
        {
            System.out.println(" : " + i.name);
        }
    }
}
