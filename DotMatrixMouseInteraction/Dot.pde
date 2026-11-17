class Dot
{
  float pull = 2.5;
  float drag = 0.788;
  float maxDistance = 120;
  float moveDistance = -0.31;
  
  float x = 0;
  float y = 0;
  
  float ox = 0;
  float oy = 0;
  
  Vector2 vel = new Vector2(1,0);
  
  
  int r;
  int g;
  int b;
  
  
  void Update(float t)
  {
    ox += vel.x;
    oy += vel.y;
    
    vel.x *= drag;
    vel.y *= drag;
    
    if (abs(ox) < 0.5) ox = 0;
    if (abs(oy) < 0.5) oy = 0;
    
    if (abs(vel.x) < 0.1) vel.x = 0;
    if (abs(vel.y) < 0.1) vel.y = 0;
    
    Vector2 pos = new Vector2(x + ox,y + oy);
    
    // Bounce back
 
    if (ox > 0.1)
    {
      vel.x -= t;
    }
    if (ox < 0.1)
    {
      vel.x +=   t;
    }
    
    if (oy > 0.1)
    {
      vel.y -= t;
    }
    if (oy < 0.1)
    {
      vel.y +=   t;
    }
    
    if (mousePressed)
    {
      float dist = Distance(mp, pos);
      Vector2 dir = new Vector2(mp.x - pos.x, mp.y - pos.y);
      float dmax = maxDistance*4;
      if (dist < dmax)
      {
        float p = 1- dist / dmax;
        vel.x += dir.x / dist * t * p * pull;
        vel.y += dir.y / dist * t * p * pull;
      }
    }
    
  }
  
  
  Vector2 getPos()
  {
   
    Vector2 pos = new Vector2(x,y);
    
    float dist = Distance(mp, pos);
    
    if (dist < maxDistance)
    {
      float dirx = mp.x - pos.x;
      float diry = mp.y - pos.y;
      
      dirx *= 1-  dist / maxDistance ;
      diry *= 1-  dist / maxDistance ;
      
      pos.x += dirx * moveDistance;
      pos.y += diry * moveDistance;

    }
    
    pos.x += ox;
    pos.y += oy;
    
    return  pos;
  }
}
