class Widget {
  int x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor, lineColor;
  PFont widgetFont;
  PImage icon;

  Widget(int x, int y, int width, int height, String label, PImage icon, color widgetColor, PFont widgetFont, int event) {

 // Widget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    this.icon = icon;
    labelColor= color(0);
    lineColor= color(0);
  }
  void draw() {
    //border();
    stroke(lineColor);
    textAlign(LEFT, BOTTOM); // temp
    fill(widgetColor);
    //rect(x, y, width, height);
    
        if (icon != null) {
      image(icon, x + (width - icon.width) / 2, y + 5);
    }
    
    fill(labelColor);
    textFont(widgetFont); // Set the font
  //  text(label, x + 5, y + height - 10);
      text(label, x + (width - textWidth(label)) / 2, y + icon.height + 20);
 
  }

  void mouseOver() {
    lineColor = color(255);
  }
  void mouseNotOver() {
    lineColor = color(0);
  }

  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    } else return EVENT_NULL;
  }
}
