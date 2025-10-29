drop[] drops;
int dropAmmount = 20;
void setup(){
  drops = new drop[dropAmmount];
  for (int i = 0; i < dropAmmount; i++){
    drops[i] = new drop(i * 20 + 5);
  }
  
}

void draw(){
  background(0);
  for (int i = 0; i < dropAmmount; i++){
    drops[i].move();
    drops[i].drawDrop();
    
  }
}
