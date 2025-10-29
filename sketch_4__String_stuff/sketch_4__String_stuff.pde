PVector v1 = new PVector(5, 5);
PVector v2 = new PVector(3, 2);



String hi = "hello world";


//String n1 = "hi peterson";
//String n2 = "hit peterson";
//String n1 = "Donald Duck";
//String n2 = "Dagobert Duck";
String n1 = "Thomas Mann";
String n2 = "Erika Schmidt";
String nn1 = n1.substring(n1.indexOf(" ") + 1, n1.length());
String nn2 = n2.substring(n2.indexOf(" ") + 1, n2.length());



int counter = 0;

void setup() {

  v1.sub(v2);
  v1.add(v2);
  println(v1);
  hi.toUpperCase();

  hi.substring(0, hi.length());

  println(hi);
  println(hi.contains("wor"));
  println(hi.indexOf("wor"));
  if (nn1.equals(nn2))println(nn1+ "  uund " + nn2 + " sind gleich");
   textAlign(CENTER);
  text(n1.substring(0, n1.length() - (counter % n1.length())), width/2, height/2);
}

void draw(){}

void mousePressed() {
  background(0);
  textAlign(CENTER);
  counter++;
  println(counter);
  text(n1.substring(0, n1.length() - (counter % n1.length())), width/2, height/2);
}
