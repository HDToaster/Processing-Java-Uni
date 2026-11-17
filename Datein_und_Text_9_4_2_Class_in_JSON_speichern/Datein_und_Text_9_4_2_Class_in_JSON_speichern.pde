void setup()
{
  Auto a = new Auto("Lidl",12,1);
  safeAuto("auto",a);
  loadAuto("auto");
}

void safeAuto(String dname,Auto a)
{
  JSONObject save = new JSONObject();
  save.setString("firma",a.firma);
  save.setInt("km",a.kilometerstand);
  save.setFloat("verbrauch",a.verbrauchProKm);
  saveJSONObject(save,dname);
}

Auto loadAuto(String dname)
{
  JSONObject save= loadJSONObject(dname);
  String f = save.getString("firma");
  int k=save.getInt("km");
  float v = save.getFloat("verbrauch");
  Auto a = new Auto(f,k,v);
  a.ausgeben();
  return a;
}

class Auto {
  String firma;
  int kilometerstand;
  float verbrauchProKm;

  Auto(String f, int km, float verbrauch) {
    firma = f;
    kilometerstand = km;
    verbrauchProKm = verbrauch;
  }
  void ausgeben()
  {
    println(firma);
    println(kilometerstand);
    println(verbrauchProKm);
  }
}
