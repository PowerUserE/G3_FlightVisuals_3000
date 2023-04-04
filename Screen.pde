class Screen {

  ArrayList<Widget> screenWidgets;
  Histogram hist;
  color screenColor;
  PImage screenBackg, usMap;
  boolean home, histogram = false;
  String header;


  Screen(color screenColor)
  {
    screenWidgets = new ArrayList<Widget>();
    this.screenColor = screenColor;
  }

  Screen(color screenColor, boolean histogram, String header)
  {
    screenWidgets = new ArrayList<Widget>();
    this.screenColor = screenColor;
    this.histogram = histogram;
    this.header = header;
    hist = new Histogram(120, 700, 80, 1100, "MKT_CARRIER", "DISTANCE (km)", myFont2);
  }

  Screen(color screenColor, PImage screenBackg, PImage usMap)
  {
    home = true;
    this.screenColor = screenColor;
    screenWidgets = new ArrayList<Widget>();
    this.screenBackg = screenBackg;
    this.usMap = usMap;
  }

  void add(Widget w) {
    screenWidgets.add(w);
  }

  void draw() {

    background(screenColor);
    if (home)
    {

      stroke(128, 0, 128); // Set the color of the line to purple
      strokeWeight(3); // Set the thickness of the line to 4 pixels
      // line(width/2 + 100, 0, width/2 + 100, height); // Draw the line shifted 100 pixels to the right

      noFill(); // Disable filling of the rectangle
      rect(0, 0, width-3, height-3); // Draw a rectangle around the edges of the screen

      image(screenBackg, 0, 0, width, height);
      image(usMap, (width - (usMap.width/(1.85)+390)), (height - (usMap.height/(1.85))), usMap.width/(1.85), usMap.height/(1.85)); //image(usMap, 25, 40, width, height);
      line(width/2 + 265.5, 0, width/2 + 265.5, height); // Draw the line shifted 100 pixels to the right
      //startScreen();
      //background(0); // Set the background to white
      noFill(); // Disable filling of the rectangle
      rect(0, 0, width-3, height-3); // Draw a rectangle around the edges of the screen

      rect(width/2 + 280, 115, 180, 180);
      image(lineGraphSample, width/2 + 280, 115, 180, 180);
      rect(width/2 + 500, 115, 180, 180);
      image(histogramSample, width/2 + 500, 115, 180, 180);
      rect(width/2 + 280, 315, 400, 180);
      image(pieChartSample, width/2 + 280, 315, 400, 180);


      rect(width/2-400, 20, 600, 40);
      fill(0);
      textAlign(CENTER, RIGHT);
      textSize(30);
      text(GroupName, width/2-120, 55);
      //image(logo, width/2-150, 30, logo.height/5, logo.width/5);
    }
    for (int i=0; i<screenWidgets.size(); i++)
    {
      Widget aWidget = (Widget) screenWidgets.get(i);
      aWidget.draw();
    }
    if (histogram)
    {
      textAlign(LEFT, BOTTOM); // temp
      text(header, 350, 40);
      hist.draw();
    }
  }

  int getEvent(int mx, int my) {
    for (int i=0; i<screenWidgets.size(); i++)
    {
      Widget aWidget = (Widget) screenWidgets.get(i);
      int event = aWidget.getEvent(mouseX, mouseY);
      if (event != EVENT_NULL)
      {
        return event;
      }
    }
    return EVENT_NULL;
  }
}
