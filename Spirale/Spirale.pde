float scale =0;
float inc = 0.01f;
float ogscale = 0;
void setup(){
  size(800,800);

}

void draw(){
spiral();
}

void spiral(){
  scale = ogscale;
  background(0);
  for (float i = 1; i < 300; i+=0.1){
 scale += inc;
    ellipse(scale * sin(i) * height/2 + height/2,scale * cos(i) * height/2+ height/2,20,20);
  }
}


void keyPressed(){
  ogscale += 0.01f;
}
void mousePressed(){
  ogscale -= 0.01f;
}
