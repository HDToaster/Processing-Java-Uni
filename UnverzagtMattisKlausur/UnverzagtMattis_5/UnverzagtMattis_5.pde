int[] ar = { 5, 8 }; 
int[] foo = { -3, -20, -1 }; 
int[] bar = { 3, 2, 0 }; 
int[] bla = { 0, 1 }; 
void setup() { 
println(zusammen(ar, foo, bar)); 
println("---"); 
println(zusammen(ar, foo, bla)); 
println("---"); 
println(zusammen(bla, bla, bla)); 
}

int[] zusammen(int[] a,int[] b,int[] c)
{
  int len=a.length +b.length+b.length;
  int[] newArr= new int[len];
  int index=0;
  for (int i=0;i <a.length;i++)
  {
    newArr[index]=a[i];
    index+=1;
  }
  for (int i=0;i <b.length;i++)
  {
    newArr[index]=b[i];
    index+=1;
  }
  for (int i=0;i <c.length;i++)
  {
    newArr[index]=c[i];
    index+=1;
  }
  
  return newArr;
  
}
