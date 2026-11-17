class Bullet extends GameObject
{
  //float x,y;
  float speed;
  int damage;
  float dx,dy;
  color c;
  Bullet(float x,float y,float dx, float dy){
    super(x,y);
    //Set alle the values a bullet needs to work but without color 
    //this.x=x;
    //this.y=y;
    this.speed=4;
    this.dx=dx;
    this.dy=dy;
    this.c = color(0,255,255);
    size+= random(0,0.5);
  }
  Bullet(float x,float y,float dx, float dy,color c){
    //Set alle the values a bullet needs to work with color
    super(x,y);
    //this.x=x;
    //this.y=y;
   //Bullet(x,y,dx,dy);
   
  }
  
  void updateBullet()
  {
    
    //Bullet Movement
    x+=dx*speed;
    y+=dy*speed;
    
    
    //Check over which field we are
    PVector feld = overField( x,  y);
    //-1 -1 wird zurückgegeben wenn kein feld gefunden wurde
    if (feld.x==-1 || feld.y==-1)
    {
      return;
    }
    
    // Wenn ein feld gefunden wurde, feld auf die farbe stellen!
    fields[(int)feld.x][(int)feld.y] = c;
  }
  
  void drawBullet()
  {
    fill(0,255,255);
    circle(x,y,size);
  }
}
