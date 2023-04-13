class Screen {


  ArrayList<Widget> screenWidgets;
  Histogram hist, stateHist;
  lineGraph lg;
  StateHistogram histo;
  PieChart pie, pieHome;
  color screenColor;
  PImage screenBackg, usMap;
  boolean home, histogram, pieChart, lineGraph = false;
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
  }

  Screen(color screenColor, boolean pieChart)
  {
    screenWidgets = new ArrayList<Widget>();
    this.screenColor = screenColor;
    this.pieChart = pieChart;
    pie = new PieChart();
  }

  Screen(color screenColor, boolean lineGraph, String placeHolder, int temp) {
    this.screenColor = screenColor;
    this.lineGraph = lineGraph;
    screenWidgets = new ArrayList<Widget>();
    lg = new lineGraph();
  }

  Screen(color screenColor, PImage screenBackg, PImage usMap)
  {
    home = true;
    this.screenColor = screenColor;
    screenWidgets = new ArrayList<Widget>();
    this.screenBackg = screenBackg;
    this.usMap = usMap;
    pieHome = new PieChart();
  }

  void add(Widget w) {
    screenWidgets.add(w);
  }


  void draw() {

    background(screenColor);
    if (home)
    {
      noStroke();

      rectMode(CORNER);
      stroke(128, 0, 128); // Set the color of the line to purple
      strokeWeight(1); // Set the thickness of the line to 4 pixels
      // line(width/2 + 100, 0, width/2 + 100, height); // Draw the line shifted 100 pixels to the right

      noFill(); // Disable filling of the rectangle
      // rect(0, 0, width-3, height-3); // Draw a rectangle around the edges of the screen

      image(screenBackg, 0, 0, width, height);
      image(usMap, (width - (usMap.width/(1.85)+390)), (height - (usMap.height/(1.85))), usMap.width/(1.85), usMap.height/(1.85)); //image(usMap, 25, 40, width, height);
      line(width/2 + 265.5, 0, width/2 + 265.5, height); // Draw the line shifted 100 pixels to the right
      //startScreen();
      //background(0); // Set the background to white
      noFill(); // Disable filling of the rectangle
      // rect(0, 0, width-3, height-3); // Draw a rectangle around the edges of the screen

      fill(170, 206, 235);
      rect(0, 0, width - 445, 75);
      rect(976, 0, 445, height);


      rect(width-430, 65, 320, 32); // Header for summary heading
      fill(0);
      textAlign(LEFT, LEFT);
      textFont(HeaderFont);
      //textSize(30);
      text("Quick Insights ", width-420, 50);
      textFont(SubHeaderFont);
      text("State: " + currStateFull, width-420, 90);
      fill(255);

      //  rect(width-100, 65, 70, 32); // Exit button

      rect(width/2 + 280, 110, 400, 30); // Header
      rect(width/2 + 280, 145, 400, 180);
      //image(histogramSample, width/2 + 280, 115+30, 400, 180);

      rect(width/2 + 280, 340, 400, 30); // Header
      rect(width/2 + 280, 375, 400, 180);
      //image(pieChartSample, width/2 + 280, 375, 400, 180);

      //image(histogramSample, width/2 + 280, 115+30, 400, 180);

      rect(width/2 + 280, 340, 400, 30); // Header
      rect(width/2 + 280, 375, 400, 180);
      //image(pieChartSample, width/2 + 280, 375, 400, 180);

      rect(width/2 + 280, height*3/4+38 + 15, 400, 30); // header
      rect(width/2 + 280, height*5/6+30, 400, 70); // Daire's space bar program
      //image(lineGraphSample, width/2 + 280, 115, 180, 180);


      fill(0);
      textFont(HeaderFont);
      textAlign(CENTER, RIGHT);
      //  textSize(30);
      text(GroupName, width/2-120, 55);
      //image(logo, width/2-150, 30, logo.height/5, logo.width/5);
      //histo.draw();
      if (drawHist == true)
      {
        histog.draw();
      }
      //  pieHome.draw();
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
      text(currStateFull, width/2+106, 110);
      boolean stateHisto;
      if (allStatesHist) {
        hist = new Histogram(120, 600, 80, 1100, "MKT_CARRIER", "DISTANCE (km)", myFont2, color(0, 150, 200), stateHisto = false, currState);
        hist.draw();
      }
      if (currStateHist) {
        stateHist = new Histogram(120, 600, 80, 1100, "MKT_CARRIER", "DISTANCE (km)", myFont2, color(170, 66, 245), stateHisto = true, currState);
        stateHist.draw();
      }
    }
    if (pieChart)
    {
      // pie.draw();
    }
    if (lineGraph) {
      lg.drawAxes();
      for (Checkbox checkbox : checkboxes) {
        checkbox.display();
      }

      for (int i = 0; i < checkboxes.size(); i++) {
        Checkbox checkbox = checkboxes.get(i);
        if (checkbox.state) {
          String airline = checkbox.label;
          color airlineColor = checkbox.airlineColor;
          DelayData delayData = calc(airline, currState);////////////////////
          Integer[] dayArray = delayData.dayArray;
          Float[] totalDelaysArray = delayData.totalDelaysArray;
          lg.draw(dayArray, totalDelaysArray, airline, airlineColor);
        }
      }
      //  lg.drawLineGraph();
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
