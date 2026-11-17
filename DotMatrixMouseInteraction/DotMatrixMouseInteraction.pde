
Dot[][] screen;

 int w = 300;
 int h = 300;
 
 Vector2 mp;
 
static float Distance(Vector2 p1, Vector2 p2)
{
    return sqrt( pow(p1.x - p2.x ,2) + pow( p1.y-p2.y ,2));
} 


void setup()
{
  size(900,900);
  screen = new Dot[w][h];
  mp = new Vector2(mouseX, mouseY);
  for (int x = 0; x < w; x++)
  {
    for (int y = 0; y < h; y++)
    {
      Dot d = new Dot();
      d.x = (float) x * 900/w;
      d.y = (float) y * 900/h;
      d.r = x * 255 /  w ;
      d.b = y * 255 /  h  ;
      
      screen[x][y] =   d; 
    }
    
  }
}


void draw()
{
  
  background(0 ,0,0);
  
  mp = new Vector2(mouseX, mouseY);
  for (int x = 0; x < w; x+=4)
  {
    for (int y = 0; y < h; y+=4)
    {
      
      Dot d = screen[x][y]; 
      for (int it = 0; it < 22; it ++)
      {
        d.Update(0.1);
      }
      
      Vector2 pos = d.getPos();
      fill(d.r,d.g,d.b);
      circle(pos.x,pos.y,4);
    }
    
  }

}
