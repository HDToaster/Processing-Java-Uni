
public class button {
  int x;
  int y;
  int sizeX;
  int sizeY;
  
  color hitColor = #AFAFAF;
  color normalColor = #D3D3D3;
  color currentColor = normalColor;

   button(int x, int y, int sizeX, int sizeY) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }

  public boolean checkPos(int mx, int my) {
    if (mx >= x && mx <= x+sizeX && my >y && my < y + sizeY)
    {
      println("in");
      currentColor = hitColor;
      drawButton();
      return true;
    }
    currentColor = normalColor;
    drawButton();
    return false;
  }
  
  void drawButton()
{
  fill(currentColor);
  rect(x,y,sizeX,sizeY);
}
}
