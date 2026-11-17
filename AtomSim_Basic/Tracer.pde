class Tracer
{
  
  ArrayList<SingleTrace> traces = new ArrayList<SingleTrace>();
  int tt;
  void updateTracers()
  {
    for (SingleTrace t : traces)
    {
      
        fill(255,255,255);
        circle(t.pos.x,t.pos.y,4);
     
    }
  }
  
  void Trace(Vector2 pos)
  {
    if (tt % 4 == 0 )
    {
      SingleTrace t = new SingleTrace();
      t.pos = new Vector2(pos.x,pos.y);
      t.t = 12;
      traces.add(t);
    }
    
  }
}


class SingleTrace
{
  Vector2 pos;
  float t;
}
