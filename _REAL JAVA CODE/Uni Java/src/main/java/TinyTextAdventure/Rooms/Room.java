package TinyTextAdventure.Rooms;

import TinyTextAdventure.Monster.Monster;
import TinyTextAdventure.Util;

import java.util.ArrayList;
import java.util.List;

public class Room {
    public Monster monster;

    public String roomName ="Default Room";

    public List<RoomEvent> events = new ArrayList<>();

    public List<Room> connectedRooms = new ArrayList<>();

    public int roomDialogIndex = 0;

    public static int rooms;
    public int roomNumber;

    public Room (Monster m){
        roomNumber = rooms;
        rooms++;
        this.monster = m;
    }
    public Room(){
        roomNumber = rooms;
        rooms++;


    }
    public Room NextRoom(){
        return connectedRooms.get(Util.randInt(0,connectedRooms.size()));
    }

    public RoomEvent RoomAction(RoomEvent currentEvent){

        RoomEvent event = currentEvent;
        boolean done = false;

        if (currentEvent == null){
            // no event was passed, so this is the first
                event = GetNewRandomRoomEvent();
                roomDialogIndex=0;
        }else{

            //There is a room event => lets handly it
            if (currentEvent.type == RoomEvent.eventTypes.Dialog){
                roomDialogIndex++;

                if (roomDialogIndex >= currentEvent.roomString.size()){
                    done = true;
                }

            }else if (currentEvent.type== RoomEvent.eventTypes.Fight){
                Util.s("Figjt");
            }
        }
        if (done){
            if (currentEvent.followEvent != null)
            {
                return currentEvent.followEvent;
            }
            return null;
        }


        return event;

    }

    public String GetRoomString(RoomEvent event){
        if (event == null){
            return " Next ";
        }



        if (event.type == RoomEvent.eventTypes.Dialog){
            return event.roomString.get(roomDialogIndex);

        }else if (event.type == RoomEvent.eventTypes.Fight){
            return "You are fighting "+( (monster== null)?" nothing " : monster.name);
        }
        return  "No room string set up for this case " + event.type + " Room " + roomName + " Nr: " + roomNumber;
    }
    public RoomEvent GetNewRandomRoomEvent(){

        if (!events.isEmpty()){

            return events.get(Util.randInt(0,events.size()));

        }

        Util.s("Returnd emtpy new Room Event Error -----------");

        return new RoomEvent();
    }
}
