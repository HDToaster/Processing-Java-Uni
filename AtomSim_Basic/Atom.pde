class Atom
{
  
  Vector2 pos;
  Vector2 vel;
  
  
  
  int electrons = 5;
  int protons = 4;
  int neutrons = 3;
  
  
  Atom()
  {
    
  }
  Atom(Vector2 pos)
  {
    this.pos = pos;
  }
  
  
  float getNegativity()
  {
    return (electrons - protons) * electron_pull_negativity;
  }
  float getWeight()
  {
    return ( electrons * electron_weight + neutrons * neutron_weight + protons * proton_weight ) * 100;
  }
  
  float getWeightMod(Atom a)
  {
    return ( a.getWeight() / getWeight() );
  }
  
  float getPull(Atom a)
  {
    // Look at negativity difference
    float negativity_other = a.getNegativity();
    float difference = abs(negativity_other-getNegativity());
    
    float d = pos.Distance(a.pos);
    
    // Basic Bounce
    if (d < min_atom_distance)
    {
      return -getWeightMod(a) * (1- d / min_atom_distance);
    }
    
    if (difference < 0.1) return 0;

    
    if (d < max_atom_distance)
    {
      float pullPow = 1 - d / max_atom_distance;
      return  pullPow  * difference * getWeightMod(a);
    }
    
    
  
    return 0;
    
  }
  
  
  void atomInteraction(float t)
  {
    for (Atom a : atoms)
    {
      float pull = a.getPull(this);
      Vector2 dir = new Vector2(a.pos.x - pos.x, a.pos.y - pos.y);
      dir.x *= pull * t;
      dir.y *= pull * t;
      
      
      
      
      vel.Add(dir);
    }
  
  }
  
  void update(float t)
  {
    
    
    
    pos.x += vel.x * t;
    pos.y += vel.y * t;
    
    if (pos.x < 0) 
    {
      vel.x *= -1;
      pos.x = 0;
    }
    if (pos.x > 1000) 
    {
      vel.x *= -1;
      pos.x = 1000;
    }
    
    if (pos.y < 0) 
    {
      vel.y *= -1;
      pos.y = 0;
    }
    if (pos.y > 1000) 
    {
      vel.y *= -1;
      pos.y = 1000;
    }
  }
  void draw()
  {
    fill(electrons * 25,neutrons * 25,255);
    circle(pos.x,pos.y,6);
  }

}
