button[] buttons;

void setup() {
  size(200,200);
  buttons = new button[3];
  buttons[0] = new button(50, 50, 100, 25);
  buttons[1] = new button(50, 75, 100, 25);
  buttons[2] = new button(50, 100, 100, 25);
}

void draw() {
  
  for (int i = 0; i < buttons.length;i++){
    if (buttons[i] != null){
      boolean hit = buttons[i].checkPos(mouseX,mouseY);
      
      println(hit);
    }
  }
}

void mousePressed()
{
  int c =0;
  for (int i = 0; i < buttons.length;i++){
    if (buttons[i] != null){
      boolean hit = buttons[i].checkPos(mouseX,mouseY);
      if (hit) c = i;
      
    }
  }
  
  if (c == 0){background(255,0,0);}
  else if (c == 1){background(0,255,0);}
  else if (c == 2){background(0,0,255);}
}
