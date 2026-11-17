package Renderer;

import java.io.BufferedReader;
import java.util.Scanner;
import java.util.Timer;
import java.util.TimerTask;

public class MultipleTImer {

    public class MyTimerTask extends TimerTask{
        public static int TIMER_AMMOUNT=0;
        private int nr=0;
        private float sekunden;
        public MyTimerTask(float sekunen){
            nr=TIMER_AMMOUNT;
            TIMER_AMMOUNT++;

            this.sekunden = sekunen;
        }

        @Override
        public void run() {
            System.out.println("Timer Nr: "+nr + " mit sekunden " + sekunden);
        }
    }
    public MultipleTImer(){

        Scanner s = new Scanner(System.in);

        while (true){

            try{
                System.out.println("New Timer sekonds: ");
                String nextLine = s.nextLine();

                try{
                    float f = Float.parseFloat(nextLine);

                    System.out.println("Creating new Timer with secondz " + f);

                    Timer t = new Timer();
                    TimerTask m = new  MyTimerTask(f);
                    t.schedule(m,(long)f*1000);

                } catch (NumberFormatException e) {
                    float f = 10;
                }

            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        }

    }

    static void main(String[] args){
        MultipleTImer m = new MultipleTImer();
    }

}
