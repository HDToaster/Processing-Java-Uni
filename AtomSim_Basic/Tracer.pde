class Tracer
{
  
  ArrayList<SingleTrace> traces = new ArrayList<SingleTrace>();
  
  void updateTracers()
  {
    for (var t : traces)
    {
      t.t -= 0.1;
      if (t.t < 0)
      {
        traces.remove(t);
      }else{
        circle(pos.x,pos.y,1);
      }
    }
  }
  
  void Trace(Vector2 pos)
  {
    SingleTrace t = new SingleTrace();
    t.pos = pos;
    t.t = 1;
    traces.add(t);
  }
}


class SingleTrace
{
  Vector2 pos;
  float t;
}
