//Pong App 1 Spieler
boolean mainMenu = true;

int bx;
int by;
int bsize = 20;

int ballXSpeed = 1;
int ballYSpeed = 1;

int px;
int py;
int psize = 100;

void setup(){
  size(800,800);
  py = height-15;
  px = width / 2;
  bx = width / 2;
  by = height / 2;
  
  frameRate(160);
}

void draw(){
  if (mainMenu){
    background(0);
    textAlign(CENTER);
    fill(255);
    strokeWeight(3);
    textSize(24);
    text("Press SPACE",width/2,height/2);
    
  }else{
    gameLoop();
  }
}

void gameLoop()
{
  
  moveBall();
  
  
  if (keyPressed){
    if (keyCode == RIGHT){
    px++;
    }if (keyCode == LEFT){px--;}
  }
  
  background(0);
  
  
  fill(253);
  
  rect(px,py,psize,10);
  rect(bx,by,bsize,bsize);
  
  println("Ball X : ",bx);
  println("Ball Y : ",by);
}
void moveBall(){
  bx += ballXSpeed;
  by += ballYSpeed;
  

    
    if ( px < bx + bsize && px + psize > bx && py ==by + bsize){
      //ballXSpeed *=-1;
      ballYSpeed *=-1;
    }
    if (bx< 0){
    ballXSpeed *=-1;
    bx = 0;
    }
    if (bx +bsize > width){
      ballXSpeed *= -1;
      bx = width-bsize;
    }
    
    if (by < 0){
      by = 0;
      ballYSpeed*= -1;
    }
    
    if (by > height){
      mainMenu = true;
      px = width/2;
      bx = width/2 + (int) random(-width/3,width/3);
      by = height /2;
    }
}

void keyPressed(){
if (key == ' '){
  mainMenu = false;
}
}
