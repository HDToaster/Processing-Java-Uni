int curseamount = 0;


void setup() {
  size(200,200);
}

void draw() {
  int x = 50;
  int y = 50;
  
  x = mouseX;
  y = mouseY;
  
  fill(#FFF80D);
  ellipse(x,y,100,100);
  strokeWeight(1);
  ellipse(x-20,y-20,20,20);
  ellipse(x + 20,y-20,20,20);
  arc(x,y,50,50 + curseamount,0,PI);
  
  
//  println(mueslipreis(700,3.99,500));
 // println(mueslipreis(1000,2,500));
  
 // pythagoras23d();
 
 drawCircleBall();
  
}


float mueslipreis(int groesse1, float preis, int groesse2){
  float frak = preis / groesse1;
  return groesse2* frak;
}

void pythagoras23d()
{
  int x = 20;
  int y = 30;
  
  float distance =sqrt( pow(mouseX - x,2) + pow( mouseY - y,2));
  
  println("x="+mouseX," y="+mouseY);
  println("Distance: ", distance);
  
  rect(x,y,10,10);

}
String message = "la";
int myCircleSize = 0;
void mousePressed(){
  println(message);
  message += " la";
  
  myCircleSize += 1;
  
  //2.3.j
  int randomx = int (random(0,width));
  int randomy = int ( random(0,height));
  
  fill(0);
  ellipse(randomx,randomy,10 +myCircleSize,10 +myCircleSize);
}

//2.4 c Kreis Animation

float ballpos = 0;
float ringSize = 100;
float ringOffset = 100;
void drawCircleBall(){
  float posX = sin(ballpos) * ringSize + ringOffset;
  float posY = cos(ballpos) * ringSize + ringOffset;
  fill(#FFF80D);
  ellipse(posX,posY,20,20);
  ballpos-=0.01;
}
