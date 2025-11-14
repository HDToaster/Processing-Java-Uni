char[][] lines = new char[20][20];

int curserY = 2;
int curserX = 2;

void setup() {
  size(800, 800);

  for (int i = 0; i < lines.length; i++) {
    for (int y = 0; y < lines.length; y++) {
      lines[i][y] = ' ';
    }
  }
}

int lineSize = 20;

void draw() {
  background (0);
  for (int i = 0; i < lines.length; i++) {

    String thisLine = "";
    for (int y = 0; y < lines.length; y++) {
      if (i == curserX && y == curserY) {
        thisLine+='#';
      } else {
        thisLine+= lines[i][y];
      }
    }
    textSize(30);
    text(i+": " + thisLine,10,lineSize * i);
    
//rect(10,lineSize*i,50,20);
  }
  
  drawButton();
  drawButton2();
}

void keyPressed(){
  if (keyCode == RIGHT){
    curserY+=1;
    curserY=constrain(curserY,0,lines.length-1);
    return;
  }
  if (keyCode == LEFT){
    curserY-=1;
    curserY=constrain(curserY,0,lines.length-1);
    return;
  }
  if (keyCode == UP){
    curserX-=1;
    curserX=constrain(curserX,0,lines.length-1);
    return;
  }
  if (keyCode == DOWN){
    curserX+=1;
    curserX=constrain(curserX,0,lines.length-1);
    return;
  }
  
  if (keyCode == BACKSPACE){
    lines[curserX][curserY] = ' ';
    curserY-=1;
    curserY=constrain(curserY,0,lines.length-1);
  }else{
  
  //WRITING
  lines[curserX][curserY] = key;
  
  
  curserY+=1;
  
  }
  
  if (curserY >= lines.length){
    curserY = 0;
    curserX+=1;
    curserX=constrain(curserX,0,lines.length-1);
  }
    curserY=constrain(curserY,0,lines.length-1);
  
}


int bsx = 50;
int bsy = 20;
float bx =  800- bsx * 1.5f;
float by =bsy *1.5f;
void drawButton(){
  rect(bx,by,bsx,bsy);
  var x = mouseX;
  var y = mouseY;
  if (mousePressed){
    if (x > bx && x < bx +bsx && y > by && y < by + bsy){
      saveDATA();
      println("saved");
    }
  }
}

int bsx2 = 50;
int bsy2 = 20;
float bx2 =  800- bsx * 1.5f;
float by2 =bsy *3.5f;
void drawButton2(){

  rect(bx2,by2,bsx2,bsy2);
  var x = mouseX;
  var y = mouseY;
  if (mousePressed){
    if (x > bx2 && x < bx2 +bsx2 && y > by2 && y < by2 + bsy2){
      loadDATA();
      println("load");
    }
  }
}

void saveDATA(){
  String[] zeilen = new String[20];
  
  for (int i = 0; i < lines.length; i++) {

    String thisLine = "";
    for (int y = 0; y < lines.length; y++) {
 
        thisLine+= lines[i][y];
      
    }
   zeilen[i] = thisLine; 
  }
saveStrings("meineDaten.txt", zeilen);
}

void loadDATA(){
  String[] zeilen = loadStrings("meineDaten.txt");
  
  
  
  for (int i = 0; i < lines.length; i++) {

    
    for (int y = 0; y < lines.length; y++) {
 
        lines[i][y] = zeilen[i].charAt(y);
      
    }

  }

}
