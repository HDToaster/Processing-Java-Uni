void setup() { 
float[] num = { 3, 1, -2, 5 }; 
println("a) test add: " + calc(1, 2 , "add")); 
println("b) test add: " + calc(num, "add")); 
println("b) test mult: " + calc(num, "mult")); 
println("b) test sub: " + calc(num, "sub")); 
}

float calc(float x, float y, String str)
{
  if (str=="add")
  {
    return x+y;
  }
  if (str=="sub")
  {
    return x-y;
  }
  if (str=="mult")
  {
    return x*y;
  }
  
  return -1;
}

float calc(float[] x, String str)
{
  float ret=0;
  if (str=="add")
  {
    for (float f: x)
    {
      ret+=f;
    }
  }
  if (str=="sub")
  {
    for (float f: x)
    {
      ret-=f;
    }
  }
  if (str=="mult")
  {
     ret=1;
    for (float f: x)
    {
      ret*=f;
    }
  }
  
  return ret;
}
