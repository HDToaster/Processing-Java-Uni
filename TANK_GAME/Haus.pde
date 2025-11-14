class Haus extends Object

{

  float sizeX;
  float sizeY;

  Haus(float x, float y, float sx, float sy) {
    super(x, y);
    sizeX = sx;
    sizeY = sy;
    size.x = sizeX;
    size.y = sizeY;
  }
  Haus(float x, float y) {
    super(x, y);
    sizeX = 50;
    sizeY = 60;
  }

  void drawObj() {
    if (!isActive)return;
    pushMatrix();

    rectMode(CORNER);


    rect(pos.x, pos.y, sizeX, sizeY);


    popMatrix();
  }

  void destroy() {
    isActive = false;
  }
  

  boolean hit(float x, float y,boolean isPlayer) {
rectMode(CORNER);
    if (!isActive) return false;

    if (x > pos.x && x < pos.x + sizeX && y > pos.y && y < pos.y + sizeY) {
      leben -= 1;
      if (leben < 0) {
        destroy();
      }
      return true;
    }
    return false;
  }
}
