float electron_weight = 0.04;
float neutron_weight = 0.24;
float proton_weight = 0.09;

float electron_pull_negativity = 0.1;

float min_atom_distance = 5;

ArrayList<Atom> atoms = new ArrayList<Atom>();


Tracer tracer = new Tracer();

void setup()
{
  size(1000,1000);
  
  
  for (int i = 0; i < 2; i++)
  {
    Atom a = new Atom();
    float px = random(1000);
    float py = random(1000);
    float vx = random(10)-5;
    float vy = random(10)-5;
    
    a.pos = new Vector2(px,py);
    a.vel = new Vector2(vx,vy);
    
    atoms.add(a);
  }
  
}

void handleAtoms()
{
  for (Atom a : atoms)
  {
    a.update(1);
    tracer.Trace(a.pos);

  }
  for (Atom a : atoms)
  {
    a.draw();
  }
}


void draw()
{
  background(0,0,0);
  updateTracers();
  handleAtoms();
  
}
  
