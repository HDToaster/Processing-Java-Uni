
void setup()
{
  String[] str = {"hi2"};
  //saveStrings("meineDatei.txt",str);
  
  println(loadIntToArray());
  saveToData();
  
}

void draw()
{}

int[] loadIntToArray()
{
  String[] data= loadStrings("meineDatei.txt");
  String[] temp=new String[data.length];
  
  for (var s : data)
  {
    int i=0;
    String[] splitArr=  s.split(";");
    int[] intArr= new int[splitArr.length];
    for (var st : splitArr)
    {
      intArr[i] = int( splitArr[i]);
      i++;
    }
    return intArr;
    
  }
  return  new int[0];
}

void saveToData()
{
  String str= "Once upon a time in a galaxy far, far away." ;
  saveStrings("meineDatei2.txt",str.split(" "));
}
