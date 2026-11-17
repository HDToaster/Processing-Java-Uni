
int[] points;
void setup(){
  size(800,800);
  String[] data=loadStrings("data.csv");
  points=new int[data.length];
  int pointPos=0;
  String dataStr="";
  for(String s :data){dataStr+=s;}
  
  char endChar='_';
  
  int endPos = dataStr.indexOf(endChar);
  
  
  for(int i =0;i<data.length;i++)
  {
    if (data[i].startsWith("WS "))
    {
      points[pointPos]=int(findLast(data[i]));
       pointPos+=1;
      println(points[i]+"3l");
    }
  }
  print("----------------");
    for (int i=0; i<pointPos;i++) 
  {
    println(int(points[i]));
    circle(i*width/pointPos,height-map(points[i],0,5616881,0,height),5);
    if (i<pointPos-1)
    {
      line(i*width/pointPos,height-map(points[i],0,5616881,0,height),
        (i+1)*width/pointPos,height-map(points[i+1],0,5616881,0,height));
    }
  }

}

String findLast(String str)
{
  int hit=str.indexOf(";");
  if (hit>0)
  {
    return findLast(str.substring(hit+1,str.length()));
  }
  return str;
  
}

void draw()
{
  

}
