package TinyTextAdventure.Rooms;

import TinyTextAdventure.Inventory.Weapons.Fists;
import TinyTextAdventure.Monster.Monster;
import TinyTextAdventure.Monster.NormalMonster;

public class EasyRoom extends Room{



    public EasyRoom() {
        super();
        roomName = "Easy Room";

        monster = new NormalMonster("Monster",null);

        events.clear();
        RoomEvent event = new RoomEvent();
        event.type = RoomEvent.eventTypes.Fight;

        events.add(event);

        if (rooms < 6){
            connectedRooms.add (new EasyRoom());

        }else{
            connectedRooms.add(new Room(new NormalMonster("Jeff",null)));
        }

    }
}
