import java.util.Timer;
import java.util.TimerTask;

public class paralleleZahlen {

    public paralleleZahlen(){
        Thread evenPrinter = new Thread(new EvenPrinter());

        Thread oddPrinter = new Thread(new OddPrinter());


        evenPrinter.start();

        oddPrinter.start();




        Timer myTimer = new Timer(true);
        TimerTask myTimerTask = new MyTimerClass();

        myTimer.scheduleAtFixedRate(myTimerTask, 0, 100);
    }

    public class EvenPrinter implements Runnable{
        public EvenPrinter(){

        }
        @Override
        public void run() {
            int number = 0;
            while (number < 100){
                number+=2;
                if (number > 4){
                    if (number < 77){
                        if (number == 12){
                            System.out.println("extra step");
                        }
                    }
                }
                try{
                    Thread.sleep(60);
                }catch (InterruptedException e){
                    e.printStackTrace();
                }
                System.out.println("Even Printer: "+number);
            }
        }
    }

    public class OddPrinter implements Runnable {
        @Override
        public void run() {
            int number = 1;
            while (number < 100){
                number+=2;
                System.out.println("Odd Printer: "+number);
            }
        }
    }

    public class MyTimerClass extends TimerTask {
        int number = 0;
        @Override
        public void run() {
            number += 1;
            System.out.println("TIMER TASK WAS RUN : "+ number);
        }
    }

    static void main(String[] args){
        paralleleZahlen zahlen = new paralleleZahlen();
    }
}
