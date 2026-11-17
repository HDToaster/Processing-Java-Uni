package TinyTextAdventure.Rooms;

import TinyTextAdventure.Monster.NormalMonster;
import TinyTextAdventure.Inventory.Weapons.Fists;

public class StartRoom extends Room {


    public StartRoom() {
        super(new NormalMonster("Jeff",null));

        roomName = "Start Room";

        events.clear();

        connectedRooms.add(new EasyRoom());

        RoomEvent follow = new RoomEvent();
        follow.type = RoomEvent.eventTypes.Fight;


        RoomEvent r = new RoomEvent();
        r.type = RoomEvent.eventTypes.Dialog;
        r.roomString.clear();
        r.roomString.add("Hi, welcome to Tiny Text Adventure");
        r.roomString.add("My name is Jeff");
        r.roomString.add("And i am evil!");
        r.followEvent = follow;

        events.add(r);


    }

}
