int zustand = 0;

void setup() {
  textAlign(CENTER);
  textSize(20);
}
String textPart;
void draw() {
  background(0);
  
  if (zustand == 0) {
    textPart = "Hallo";
  }
  if (zustand == 1) {
    textPart = "mein";
  }
  if (zustand == 2) {
    textPart = "Name";
  }
  if (zustand == 3) {
    textPart = "ist";
  }
  if (zustand == 4) {
    textPart = "Hase";
  }
  if (zustand == 5) {
    textPart = "Tschüss";
  }
  text(textPart, width/2, height/2);
}

void mousePressed(){
  zustand+=1;
  if (zustand > 5){zustand = 0;}
}
