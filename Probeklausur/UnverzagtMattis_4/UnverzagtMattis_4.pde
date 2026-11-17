void setup() { 
println(zehnerreihe(2)); 
println(); 
println(zehnerreihe(5)); 
}


int[] zehnerreihe(int x)
{
  int[] res = new int[x];
  for (int i=0;i<res.length;i++)
  {
    res[i]=i*10;
  }
  return res;
}
