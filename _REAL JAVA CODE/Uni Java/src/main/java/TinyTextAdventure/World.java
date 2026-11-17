package TinyTextAdventure;

import TinyTextAdventure.Monster.Monster;
import TinyTextAdventure.Renderer.ASCIIRenderer;
import TinyTextAdventure.Renderer.Sprite;
import TinyTextAdventure.Rooms.Room;
import TinyTextAdventure.Rooms.RoomEvent;
import TinyTextAdventure.Rooms.StartRoom;
import TinyTextAdventure.Inventory.Weapons.Weapon;

import java.util.ArrayList;
import java.util.List;

public class World {

    List<Monster> monster = new ArrayList<>();
    ASCIIRenderer render = new ASCIIRenderer();
    Hero h = new Hero();

    Room currentRoom = new StartRoom();
    public RoomEvent lastEvent = null;

    String state = "room";

    public void Start(){

        Weapon sword = new Weapon("Sword", 1,5);

        h.weapon = sword;
       // render.PSet(0,0,2);

       // render.Print(2,2,"Test");
       // render.DrawSprite(5,5,new Sprite(SpriteRef.testSprite));



        while (true){
            render.SetScreen(-1);
            HandleRoomEvent();

            //Draw

            drawUi();
            drawRoomUi();
            render.Draw();

            //Input
            Util.input("What will you do");


            if (state.equals("fight")){
                Fight();



            }


        }

    }

    public void Fight(){
        render.SetScreen(-1);
        drawUi();
        Room r = currentRoom;


        //Enemy UI
        render.Print(2,3, r.monster.name + " Level: ");
        render.Print(2,4, "HP :"+ r.monster.hp);
        render.Print(2,5, "WP :"+ r.monster.weapon.name);


        //Player extra ui
        int w = ASCIIRenderer.w;
        int height = ASCIIRenderer.h;

        render.Print(w-25,1,"HP : "+ h.hp);
        render.Print(w-25,2,"DMG: "+ h.weapon.damage);
        render.Print(w-25,3,"SPD: "+ (100 - h.weapon.weight));
        render.Print(w / 2,height-5,"Options:");
        render.Print(w / 2,height-4,"1 Attack - 2 Run");
        render.Print(w / 2,height-3,"3 Invent - ");



        render.DrawSprite(32,1,new Sprite(r.monster.name));

        render.Draw();

        String input = Util.input("Waiter");

        //Does enemy attack first ?

        if (h.weapon.weight <= r.monster.weapon.weight){
            r.monster.Attack(h);
        }

        if (input.equals("1") || input.equals("Attack")){
            h.Attack(r.monster);
        }else if (input.equals("2") || input.equals("Run")){
            state="room";
        }else if(input.equals("2") || input.equals("Invent")){

        }

        if (h.weapon.weight > r.monster.weapon.weight){
            r.monster.Attack(h);
        }
        if (r.monster.hp < 0){
            state="room";
            WinFight();

        }if (h.hp < 0 ){
            state="gameover";
        }

        if (state.equals("fight"))
        {
            Fight();

            lastEvent = null;

        }
    }

    public void WinFight(){
        currentRoom = currentRoom.NextRoom();

        render.SetScreen(-1);
        render.Print(1,2,"YOU WIN");
        render.Draw();

        Util.input(" Next ");

        lastEvent = null;
    }


    public void HandleRoomEvent(){
        RoomEvent event = currentRoom.RoomAction(lastEvent);

        if (event.type == RoomEvent.eventTypes.Fight){
            state = "fight";
        }

        lastEvent = event;
    }


    public void drawRoomUi(){
        render.Print(1,1,currentRoom.GetRoomString(lastEvent));

    }

    public void drawUi(){

        render.Print(ASCIIRenderer.w -6,ASCIIRenderer.h - 7 , h.weapon.name);
        render.DrawSprite(ASCIIRenderer.w - h.weapon.sprite.w , ASCIIRenderer.h - h.weapon.sprite.h,h.weapon.sprite);
    }

}



