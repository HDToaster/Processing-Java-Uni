// Hauptprogramm
Ball[] balls = new Ball[5]; // neues Array

void setup() {
  // Array befüllen mit Objekten
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(100);

  // Funktionen der Objekte regelmäßig aufrufen
  for (int i = 0; i < balls.length; i++) {
    balls[i].draw();
        balls[i].move();
  }
}


// Klasse Ball (in eigenem Reiter "Ball")
class Ball
{
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  // Konstruktor
  // erzeugt Ball an zufälliger Position
  // mit zufälliger Geschwindigkeit
  Ball()
  {
    xpos = random(10, width-10);
    ypos = random(10, height-10);
    xspeed = random(0,3);
    yspeed = random(0,3);
  }

  // Methode zum Zeichnen
  void draw() {
    noStroke();
    ellipse(xpos, ypos, 20, 20);
  }

  // Methode zum Bewegen, inkl. Kollision
  void move() {
    xpos += xspeed;
    ypos += yspeed;

    if (xpos < 10 || xpos > width-10) {
      xspeed = -xspeed;
    }
    if (ypos < 10 || ypos > height-10) {
      yspeed = -yspeed;
    }
  }
}

void saveConf()
{
  String[] data=new String[balls.length];
  for (int i = 0; i < balls.length;i++)
  {
    String dataString = ""+balls[i].xpos+","+balls[i].ypos+","+balls[i].xspeed+","+balls[i].yspeed;
    data[i]=dataString;
  }
  saveStrings("save.csv",data);
}

void loadConf()
{
  String[] saveData=loadStrings("save.csv");
  for (int i =0; i<balls.length;i++)
  {
    String[] splits=saveData[i].split(",");
    float xp=float(splits[0]);
    balls[i].xpos=xp;
     xp=float(splits[1]);
    balls[i].ypos=xp;
     xp=float(splits[2]);
    balls[i].xspeed=xp;
     xp=float(splits[3]);
    balls[i].yspeed=xp;
  }
}

void keyPressed()
{
  if (key=='s')
  {
    saveConf();
    print(key);
  }
  else if (key=='l')
  {
    loadConf();
    print(key);
  }
  
}
