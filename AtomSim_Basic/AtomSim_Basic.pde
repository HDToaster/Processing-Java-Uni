float electron_weight = 0.000004;
float neutron_weight = 0.00011;
float proton_weight = 0.00001;

float electron_pull_negativity = 0.001;

float min_atom_distance = 5;
float max_atom_distance = 220;

ArrayList<Atom> atoms = new ArrayList<Atom>();


Tracer tracer = new Tracer();

void setup()
{
  size(1000, 1000);


  for (int i = 0; i < 40; i++)
  {
    AddNewRandom();
  }
}

void handleAtoms()
{
  float t = 4;
  for (Atom a : atoms)
  {
    a.atomInteraction(t);

    //tracer.Trace(a.pos);
  }
  
  for (Atom a : atoms)
  {
    a.update(t);

    //tracer.Trace(a.pos);
  }


  for (Atom a : atoms)
  {
    a.draw();
  }
}


void draw()
{
  background(0, 0, 0);
  //tracer.updateTracers();
  tracer.tt++;
  handleAtoms();


  if (mousePressed)
  {
    AddNewClick();
  }
}

void AddNewRandom()
{
  Atom a = new Atom();
  float px = random(1000);
  float py = random(1000);
  float vx = random(10)-5;
  float vy = random(10)-5;
  a.electrons = (int) random(1, 10);
  a.neutrons = (int) random(1, 10);


  a.pos = new Vector2(px, py);
  a.vel = new Vector2(vx, vy);

  atoms.add(a);
}


void AddNewClick()
{
  Atom a = new Atom();
  float px = mouseX;
  float py = mouseY;
  float vx = random(10)-5;
  float vy = random(10)-5;
  a.electrons = (int) random(1, 10);
  a.neutrons = (int) random(1, 10);


  a.pos = new Vector2(px, py);
  a.vel = new Vector2(vx, vy);

  atoms.add(a);
}
