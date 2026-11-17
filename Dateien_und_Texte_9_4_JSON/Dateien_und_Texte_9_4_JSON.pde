JSONObject data=new JSONObject();
data.setInt("x",20);
data.setInt("y",80);
data.setString("form","rect");

saveJSONObject(data,"config.json");

JSONObject data2=loadJSONObject("config.json");
int x =data2.getInt("x");
int y =data2.getInt("y");
fill(255,0,0);

 print(data2.getString("form"));
if (data2.getString("form").equals("kreis"))
{
  circle(x,y,20);
}
if (data2.getString("form").equals("rect"))
{
  rect(x,y,20,20);
}
