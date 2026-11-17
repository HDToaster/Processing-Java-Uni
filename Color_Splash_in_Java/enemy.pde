

class Enemy extends GameObject
{

  //float x,y;
  int hp;
  
  Enemy(float x,float y)
  {
    super(x,y);
    size=25;
  }
  
  void updateEnemy()
  {
  
    //Check over which field we are
    PVector feld = overField( x,  y);
    //-1 -1 wird zurückgegeben wenn kein feld gefunden wurde
    if (feld.x==-1 || feld.y==-1)
    {
      return;
    }
    
    // Wenn ein feld gefunden wurde, feld auf die farbe stellen!
    fields[(int)feld.x][(int)feld.y] = color(255,0,0);
  
  }
  
  void drawEnemy()
  {
    fill(255,0,0);
    circle(x,y,size);
  }
  
  void hit(GameObject b)
  {
    if ( dist2(x,y,b.x,b.y) <= size + b.size)
    {
      hp-=1;
      x=1000;
    }
  }

}
