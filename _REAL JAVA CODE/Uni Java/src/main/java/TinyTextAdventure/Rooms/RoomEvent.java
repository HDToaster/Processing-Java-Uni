package TinyTextAdventure.Rooms;

import java.util.ArrayList;
import java.util.List;

public class RoomEvent {

    public eventTypes type = eventTypes.Nothing;

    public List<String> roomString = new ArrayList<>();

    public RoomEvent followEvent;


    public enum eventTypes  {
        Fight,
        Chest,
        Nothing,
        Dialog,
    }




}
