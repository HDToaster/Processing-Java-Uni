package Renderer;

import java.util.Timer;
import java.util.TimerTask;

public class MyThreadExcersize {

    MyThreadExcersize(){
        OddPrint p = new OddPrint();
        Thread oddThread = new Thread(p);

        EvenPrint evenPrint = new EvenPrint();
        Thread evenThread = new Thread(evenPrint);

        oddThread.start();
        evenThread.start();

        Timer t = new Timer(false);
        t.scheduleAtFixedRate(new MyTimerTask(), 0, 100);

    }


    public class MyTimerTask extends TimerTask{
        @Override
        public void run() {
            System.out.println("Sheduled timer was executed!");
        }
    }




    public class OddPrint implements Runnable{
        @Override
        public void run() {
            int n = 1;

            while (n < 100){
                System.out.println("Odd : " +n );
                n+=2;
            }
        }
    }

    public class EvenPrint implements Runnable{
        @Override
        public void run() {
            int n = 0;

            while (n < 100){
                System.out.println("Even : " +n );
                n+=2;
            }
        }
    }

    static void main(String[] args){
        MyThreadExcersize m = new MyThreadExcersize();
    }
}
