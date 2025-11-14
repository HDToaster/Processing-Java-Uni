class localGrid {


   void localDebugGrid(float scale,int steps, float thickness) {
    stroke(100);
    strokeWeight(thickness);
    
    stroke(70);
    for (float x = -width  ; x <= width ; x += steps) {
      line(x * scale, -height* scale, x* scale, height* scale);
    }

    // Horizontale Linien
    for (float y = -height ; y <= height ; y += steps) {
      line(-width* scale, y* scale, width * scale, y* scale);
    }

    stroke(150, 0, 0);   // x-Achse rot

    line(-width, 0, width, 0);
    stroke(0, 0, 150);   // y-Achse blau
    line(0, -height, 0, height);
  }
  void localDebugGrid(){
    localDebugGrid(0.1,200,0.1);
  }
  
}
