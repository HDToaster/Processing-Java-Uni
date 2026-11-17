

int kreise = 10;
int[][] colorGrey;
int kreisSize;
void setup(){
  size(500,500);
  colorGrey = new int[kreise][kreise]  ;
  kreisSize = width / kreise;
   for (int i = 0; i < kreise; i ++){
    for (int j = 0; j < kreise ; j ++){
      colorGrey  [i][j] =(int) random(0,255);
  
    }

  
  }
}

void draw(){
  
  var maus = new PVector(mouseX,mouseY);
  
  for (int i = 0; i < kreise; i ++){
    for (int j = 0; j < kreise; j ++){
      var pos = new PVector(i * kreisSize + kreisSize / 2, j * kreisSize + kreisSize / 2);
      
      if (getMouseDist(maus,pos) < kreisSize / 2){
        println("Maus : "+getMouseDist(maus,pos));
        colorGrey[i][j] += 10;
        colorGrey[i][j] %= 255;
      }
      fill(colorGrey[i][j]);
      circle(i*kreisSize + kreisSize / 2,j*kreisSize + kreisSize / 2,kreisSize);
      
    }

  
  }

}

float getMouseDist(PVector maus,PVector pos){
  return maus.dist(pos);
}
