class Vector2
{

  public float x;
  public float y;
  
  
  Vector2(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  
  void Add(Vector2 p)
  {
    x+=p.x;
    y+=p.y;
  }
  

  float Distance(Vector2 p)
  {
    float tx = x - p.x;
    float ty = y - p.y;
    tx *= tx;
    ty *= ty;
    return sqrt(tx+ty);
  }
}
