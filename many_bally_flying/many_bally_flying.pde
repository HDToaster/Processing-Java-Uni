

PVector[] pos;
PVector[] vec;
int balls = 1000;
color[] col;

void setup(){
  size(800,800);
  pos = new PVector[balls];
  vec = new PVector[balls];
  col = new color[balls];
   for (int i = 0; i < balls;i++){
     pos[i] = new PVector((int)random(width),(int)random(height));
     vec[i] = new PVector((int)random(-4,4),(int)random(-4,4));
     col[i] =  color((int) random(256),(int) random(256),(int) random(256));
   }
}

void draw(){
  for (int i = 0; i < balls;i++){
    
     pos[i].x += vec[i].x;
     pos[i].y += vec[i].y;
     
     if (pos[i].x > width) vec[i].x *= -1;
     if (pos[i].x < 0)vec[i].x *= -1;
     if (pos[i].y > height)vec[i].y *= -1;
     if (pos[i].y < 0)vec[i].y *= -1;
     //col[i] =  color((int) random(256),(int) random(256),(int) random(256));
     //fill(col[i]);
     circle(pos[i].x,pos[i].y,15);
   }
}
