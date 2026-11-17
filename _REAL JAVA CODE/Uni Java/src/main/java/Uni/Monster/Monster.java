package Uni.Monster;

import Uni.Hero;
import Uni.Tameable;
import Uni.Tamer;

import java.util.Random;

public  class Monster implements Tameable {
    public int id;
    public String name;
    public int health;
    public int maxHealth;
    public int strength;


    static int monsterCount = 0;


    Hero tamer;

    public Monster(String name, int maxHealth, int strength){

        this.name = name;
        this.maxHealth = maxHealth;
        this.health = maxHealth;
        this.strength = strength;

        monsterCount ++;
        this.id = monsterCount;

    }


    public  void Move(){

        System.out.println("Monster was moved");

    }

    public  void Attack (Monster m){

        System.out.println("Monster " + name + " attacked " + m.name + " strenght " + strength );
        m.Defend(this);
    }
    public void Defend(Monster m){
        System.out.println(name + " was attacked and is now defending");
        health -= m.strength;

        System.out.println("Monster health is now "+ health);

        if (health < 0)
        {
            System.out.println("Monster is Dead");

        }
    }


    @Override
    public void GetTamed(Hero tamer) {

        Random rand = new Random();

        float r = rand.nextFloat();

        if (r > 0.2f){
            this.tamer = tamer;
            System.out.println(name + " was tamed! ");
        }else{
            System.out.println(name + " was not tamed");
        }



    }

    @Override
    public void Cuddle(int value) {

    }
}
