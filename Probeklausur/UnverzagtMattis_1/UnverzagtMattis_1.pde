void setup() { 
  int[] a = {1, -5, 10, -3}; 
  int[] b = {-5, -3, -5}; 
  println(); 
  println(betragSumme(a)); 
  println(betragSumme(b)); 
  println(); 
  println(randomN(2)); 
  println(); 
  println(randomN(3)); 
}

int betragSumme(int[] b)
{
  int[] newarr=b;
  int res=0;
  for (var x:b)
  {
    if (x<0) x*=-1;
    res+=x;
  }
  return res;
}

float[] randomN(int n)
{
  float[] res = new float[n];
  for (int i=0; i<res.length;i++)
  {
    res[i]=random(10);
  }
  return res;
}
