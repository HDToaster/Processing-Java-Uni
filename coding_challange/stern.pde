
class stern{
  
  int x =0;
  int y =0;
  int b=0;
  stern(){randomPos();}
  void dStar(){
    
    float tb=0;
    if (b<255/2) {
     tb = b;
    }else{
       tb=255-b;
    }
    fill(tb,tb,tb);
      circle(x,y,20);
  }
  
  void setBright(){
    int tx = (int) random(1,100);
    if (tx<=50){
      b+=1;
      if (b>255)
      {randomPos();
      b=0;
    }
    }
  }
  
  void randomPos()
  {
    x=(int)random(1,500);
    y=(int)random(1,500);
  }

}
