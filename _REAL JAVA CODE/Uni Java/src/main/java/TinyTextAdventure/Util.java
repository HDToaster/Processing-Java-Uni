package TinyTextAdventure;

import java.util.NoSuchElementException;
import java.util.Random;
import java.util.Scanner;

public  class Util {
    public static void s(String str){
        System.out.println(str);
    }

    public static int randInt(int x, int y){
        if (x == y) {
            return x;
        }
        Random r = new Random();
        return  r.nextInt(x,y);
    }

    public static String input(String text){
        Scanner scanner = new Scanner(System.in);

        s(text);
        try{
            return scanner.nextLine();

        }catch(NoSuchElementException e){
            e.printStackTrace();
            return "";
        }

    }

    public static int inputN(String text){
        Scanner scanner = new Scanner(System.in);
        boolean succes = true;
        int num = 0;

        do {
            String inp = input(text);
            succes = true;

            try {
                num = Integer.parseInt(inp);

            }catch (Exception e){
                succes = false;
            }
        }while (succes == false);

        return num;

    }


}
