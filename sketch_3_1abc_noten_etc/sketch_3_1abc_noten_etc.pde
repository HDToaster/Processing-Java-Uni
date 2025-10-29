
void setup() {
  geradeCheck(2);
  verschachteltesif(2,4,1);
  
  klausurnoten(0);
  klausurnoten(15);
  klausurnoten(25);
}

void geradeCheck(int zahl) {
  if (zahl%2 == 0) {
    println("gerade");
  } else {
    println("ungerade");
  }
}

void verschachteltesif(int x, int b, int a)
{
if (x <= b){
  if (x >= a){
    println("drinnen");
  }
}
}


void klausurnoten(int note){
if (note >= 0 && note < 5){println("Durchgefallen");}
else if (note >= 5 && note <10){println("Bestanden");}
else{println("Mit AusZeichnung");}
}
