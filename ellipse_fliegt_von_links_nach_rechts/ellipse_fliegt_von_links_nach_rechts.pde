void setup(){size(300,300);}


int counter = 0;

void draw()
{
counter++;
 if (counter % 100 == 0)
 {
   
   background((int) random(256),(int) random(256),(int) random(256));
   fill(   (int) random(256),(int) random(256),(int) random(256));

 }
  ellipse(counter % width, height/2,15,15);
}
