
//Speichert die Farben ab
color[][] fields;

//Die Menge  der Farbfelder
int resolution=132;

//Größe der Farbfelder
float size;


//Spieler Position
float px,py;

//Walking Directions
float dx,dy;

float spd;

//Sind die Buttuns gedrückt?
boolean left,right,up,down;

//Belieb Großer Array, statt normalen begrentzem Array
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
//enemys
ArrayList<Enemy> enemys = new ArrayList<Enemy>();

void setup()
{
  size(800,800);
  noStroke();
  // erstell ein leeres feld mit der vorgegebenen größe
  fields= new color[resolution][resolution];
  
  //leeres feld mit einer farbe füllen
  fields= emptymap( color(255,0,0));
  
  // größe der einzelnen felder auf basis der screen width bestimmen -> beliebe screen größe und tintenfelder :D
  size = width/resolution;
  
  //Player Stats
  px=400;
  py=400;
  spd=4;
  dx=0;
  dy=0;
  
  enemys.add(new Enemy(60,120));
}

void draw()
{
  background(0);
  noStroke();
  // Alle gespeicherten felder durchgehen und an der stelle auf dem bildschirm die farbe des feld malen
  for (int i=0; i<fields.length;i++)
  {
    for (int j=0; j<fields[i].length;j++)
    {
      fill(fields[i][j]);
      
      // i * size -> jedes feld hat  größe die "size", mit exact dem spacing "size" dazwischen -> cleanes grid
      rect(i*size,j*size,size,size);
      // circle(i*size,j*size,size+3);
      //if (mousePressed)
      //{
       // if (mouseX<i*size+size && mouseX>i*size && mouseY>j*size && mouseY < j*size+size)
       // {
       //   fields[i][j]= color(0,255,0);
       // }
      //}
    }
  }
  stroke(0);
  //Alle Bullets updaten
  for (var b: bullets) {
    b.updateBullet();
    b.drawBullet();
    for (var e: enemys) {
       e.hit(b);
    }
  }
  for (var e: enemys) {
    e.updateEnemy();
    e.drawEnemy();
  }
  
  //Draw Player
  fill(255,0,255);
  circle(px,py,20);
  
  buttons();
}

color[][] emptymap(color c)
{
  //Erstellt eine leere karte mit der vorgegebenen farbe c
  color[][] fields2 = new color[resolution][resolution];
    for (int i=0; i<fields2.length;i++)
  {
    for (int j=0; j<fields2[i].length;j++)
    {
      fields2[i][j]=c;
    }
    
  }
  
  //Neue Feld zurückgeben!
  return fields2;
}

void buttons()
{
   dx=0;
    dy=0;
  // Falls ein boolean wahr ist wird der knopf grade gedrückt -> spieler geschwindigkeit dx dy setzen
  if (keyPressed){
  if (up){dy=-1;}
  if (down){dy=1;}
  if (left){dx=-1;}
  if (right){dx=1;}
  }else{
    dx=0;
    dy=0;
  }
  
  PVector normalMovement = normalize(dx,dy);
  print(normalMovement.x);
  px+=normalMovement.x *spd;
  py-=normalMovement.y *spd;
  
  if (mousePressed)
  {
    //Schooting!
    
    //Vector Normalisieren, damit die partonen immer gleich schnell sind
    PVector nomalVec=normalize(px-mouseX,py-mouseY);
    
    //Neue Bullet Erstellen
    
    bullets.add(new Bullet(px,py,nomalVec.x,nomalVec.y));
  }
}
void keyPressed()
{
  // Boolean auf true wenn ein knopf gedrückt wird
  if (key=='w'){up=true;}
  if (key=='s'){down=true;}
  if (key=='d'){left=true;}
  if (key=='a'){right=true;}
}
void keyReleased()
{
  //Boolean auf false wenn ein knopf losgelassen wird
  if (key=='w'){up=false;}
  if (key=='s'){down=false;}
  if (key=='d'){left=false;}
  if (key=='a'){right=false;}

}

PVector normalize(float x,float y)
{
  // Anstatt position 800|0 wird daraus 1|0 gemacht
  //Vector Normalisierung
  float len = sqrt(pow(x,2) + pow(y,2));
  
  //Wenn x und y == 0 dann ist len auch = 0 und dann wird durch 0 geteilt .....
  if (len==0) { return new PVector(0,0);}
  x/=len;
  y/=len;
  return new PVector(-x,-y);
}


PVector overField(float x, float y)
{
  //Tested ob bzw über welchen feld etwas ist
  for (int i=0; i<fields.length;i++)
  {
    for (int j=0; j<fields[i].length;j++)
    {
      //fill(fields[i][j]);
      //rect(i*size,j*size,size,size);
      //if (mousePressed)
      //{
       if (x<i*size+size && x>i*size && y>j*size && y < j*size+size)
       {
         return new PVector(i,j);
       //   fields[i][j]= color(0,255,0);
       }
      
    }
  }
 return new PVector(-1,-1);
}

//boolean circleCircle(float )

float dist2(float x1,float y1,float x2,float y2)
{
  return sqrt(pow( (x1 -x2 ),2 ) + pow ( (y1 - y2 ) , 2 ));
}
