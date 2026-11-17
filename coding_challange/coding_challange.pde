
stern[] sterne;
void setup()
{
  size(500,500);
  sterne=new stern[10];
  for (int i = 0; i < sterne.length;i++){
    sterne[i] = new stern();
  }
}


void draw()
{
  background(0);
  for (int i = 0; i < sterne.length;i++){
    sterne[i].dStar();
    sterne[i].setBright();
  }
}
