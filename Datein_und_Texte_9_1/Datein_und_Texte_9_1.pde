
String str = "Hier ist die Info: James Bond";
boolean pressedD=false;
boolean pressedA=false;
String xs = "hello world";
String number = "2.99";
String langertext="es war ein mal russ ein kleiner see in dem  russische nukleare sprecngkörper mit dem geheimen treibstuf cyka blyat und vodka getankt werden";

String[] lines = {"This is it", "DO NOT DO THIS", "Why not", "This is right", "That not", "What is this"};
String[] lines2 = {"Hello FOO", "Guten Tag, FOO", "Bonjour FOO du wicht"};

void setup() {
  findAgent("james Bond",str);
  findTHIS(lines);
  //replaceFOO(lines2);
  replaceFooSubstring(lines2);
}

void draw()
{
 //println(pressedA);
}

void replaceFOO(String[] str)
{
  for (int i=0; i < str.length;i++)
  {
    str[i] = str[i].replace("FOO","James Bond");
    println(str[i]);
  }
}

void replaceFooSubstring(String[] str)
{
  String[] temp=new String[str.length];
  for (int i = 0; i < str.length; i ++)
  {
    String s = str[i];
    int hit = s.indexOf("FOO") ;
    
     if (hit > 0)
     {
       temp[i]=s.substring(0,hit) + "james bond"+ s.substring(hit+3,s.length());
       //println(s.substring(0,hit)+ "James Bond " + s.substring(hit+3,s.length()).trim());
     }
  }
  
  for (var s : temp)
  {
    println(s);
  }

}

void keyPressed()
{
  
  if (key=='a') 
  {
    pressedA=true;
  }
  else{
    pressedA=false;
  }
    println(xs.length());
   //for (int i=0;i<xs.length();i++)
   //{
   //  //println((int)xs.charAt(i));
   //  //println(int(xs.charAt(i)));
   //  //println(int(number) * 10);
   //  println(langertext.indexOf("russ"));
   //  int hit = langertext.indexOf("russ");
   //  if (hit >=0)
   //  {
   //     for (int y=hit;y<hit+10;y++)
   //     {
   //       print(langertext.charAt(y));
   //     }
   //     print("\n");
   //  }
   //}
   findAllSubstrings(langertext.trim());
}
boolean parseBool(String s){
  return boolean(s);
}

void findTHIS(String[] s)
{
  //String[] tempHits=new String[s.length];
  for (int i = 0; i < s.length; i ++)
  {
    String temp=s[i];
    temp=temp.toLowerCase();
    if (temp.startsWith("this") || temp.endsWith("this")){
      println(s[i]);
    }
  }
  
}

void findAgent(String agent,String s)
{
  String oldAgent=agent;
  s=s.toLowerCase();
  agent=agent.toLowerCase();
  if (s.indexOf(agent)>0)
  {
    println(agent);
    if (!oldAgent.equals(agent))
  {
    println("original agent name :" + oldAgent);
  }
  }
}

void findAllSubstrings(String s)
{
  int hit = s.indexOf("russ");
  if (hit >=0)
  {
    for (int y=hit;y<hit+10;y++)
        {
          print(s.charAt(y));
        }
        print("\n");
        findAllSubstrings(s.substring(hit+10).trim());
  }
}

void keyReleased()

{
if (key=='a') 
  {
    pressedA=false;
  }

}
