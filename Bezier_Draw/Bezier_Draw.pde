
bPoint[] points = {new bPoint(1,1),new bPoint(100,10),new bPoint(100,100)};

ArrayList<PVector> lerpPoints = new ArrayList<PVector>();
void setup(){
  size(500,500);
}

void draw(){
  //background(255);
  PVector lastPos = new PVector();
  int i = 0;
  lerpPoints = new ArrayList<PVector>();
  for (var b : points){
    b.drawC();
    if (i!=0)
    {
      line(b.x,b.y,lastPos.x,lastPos.y);
      for (int c= 0; c < 1;c+=0.1f)
      {
        lerpPoints.add(new PVector(lerp(lastPos.x,b.x,c),(lerp(lastPos.y,b.y,c))));
      }
    }
    if (i==2){
      for (int c= 0; c < 1;c+=0.1f)
      {
        line(lerpPoints);
       }
    }
   
    lastPos = new PVector(b.x,b.y);
    i++;
  }
  
  for (var l : lerpPoints)
  {
    circle(l.x,l.y,4);  
  }
}

public float lerpMy(float a,float b,float t){
  return (a+(b-a)*t);
}

class bPoint{
  float x;float y;
  public bPoint(float x,float y){
    this.x=x;this.y=y;
  }
  
  public void drawC(){
    rectMode(CENTER);
    circle(x,y,10);
    if (abs(mouseX-x)<10 &&abs(mouseY-y)<10 && mousePressed){
      x = mouseX;
      y = mouseY;
    }
  }
  
  public float distToMouse(int x,int y){
     return sqrt(1f) ;
  }
}
