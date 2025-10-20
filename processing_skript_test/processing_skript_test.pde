void setup(){
  strokeWeight(5);
  ellipse(width/2,height/2,40,40);
}
void draw(){
 line(mouseX,mouseY,pmouseX,pmouseY); 
 
 fill(0,255,9);
 
 //2.1.c
 
 println(mouseX);
 
 //2.1.d
 //background(255 );
 line(0,0,mouseX,mouseY);
 
 //2.1.f
 rectMode(CENTER);
 rect(height/2,width/2,mouseX,mouseX);
 
 //2.1.g
 
 line(0,mouseY,width,mouseY);
 line(mouseX,0,mouseX,height);
 
 //2.1.h
 strokeWeight(1);
 line(mouseX,0,mouseX,height);
 ellipse(mouseX / 2,height / 2,mouseX ,mouseX);




//2.1.k

//2.1.m
float radius = sqrt(mouseX * mouseX + mouseY * mouseY);
ellipse(0,0,radius*2,radius*2);

//2.2a
textAlign(CENTER);
fill(random(256));
textSize(12);
text("maus",mouseX,mouseY);
 
}

void keyPressed(){
  background(255);
  fill(0);
  rectMode(CENTER);
  rect(height/2, width/2, 40,40);
}


void mousePressed(){

//background(0);

//2.1.e
rectMode(CENTER);
strokeWeight(1);
fill(255);
rect(mouseX,mouseY,20,20);


//2.2c und 2.2d

int x = int(random(1,width));
int y =int( random(1,height));
int sizeX =int( random(0,20));
int sizeY = int (random(0,20));
int randColor= int (random(0,256));
fill(randColor);
rect(x,y,sizeX,sizeY);

fill(randColor);
textSize(sizeX);
text ("hallo", x,y);

}
