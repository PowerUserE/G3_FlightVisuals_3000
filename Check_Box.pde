class Checkbox {
  float x, y, size;
  boolean state;
  String label;
  color airlineColor;
  
  
 Checkbox(float x, float y, float size, String label, color airlineColor) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.state = false;
    this.label = label;
    this.airlineColor = airlineColor;
  }

  void display() {
    stroke(0);
    fill(airlineColor);
    rect(x, y, size, size);

    if (state) {
      line(x, y, x + size, y + size);
      line(x, y + size, x + size, y);
    }

    fill(0);
    text(label, x + size + 5, y + size - 5);
  }

  boolean checkClicked(float mx, float my) {
    if (mx >= x && mx <= x + size && my >= y && my <= y + size) {
      state = !state;
      return true;
    }
    return false;
  }
}
