class Screen { 


  ArrayList<Widget> screenWidgets;
  Histogram hist;
  color screenColor;
  PImage screenBackg, usMap;
  boolean home, histogram = false;
  String header;

  
  Screen(color screenColor, PImage screenBackg)
  {
    screenWidgets = new ArrayList<Widget>();
    this.screenColor = screenColor;
    this.screenBackg = screenBackg;
  }
  
  Screen(color screenColor, PImage screenBackg, boolean histogram, String header)
  {
    screenWidgets = new ArrayList<Widget>();
    this.screenColor = screenColor;
    this.screenBackg = screenBackg;
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
  
  void add(Widget w){
    screenWidgets.add(w);
  }
  
  void draw(){
    background(screenColor);
    image(screenBackg, 0, 0, width, height);
    if(home)
    {
      image(usMap, 0, 185, width, height);                            
      //startScreen();
    }
    for(int i=0; i<screenWidgets.size(); i++)
    {
      Widget aWidget = (Widget) screenWidgets.get(i);
      aWidget.draw();
    }
    if(histogram)
    {
      text(header, 350, 40);
      hist.draw();
    }
  }
  
  int getEvent(int mx, int my){
    for(int i=0; i<screenWidgets.size(); i++)
    {
      Widget aWidget = (Widget) screenWidgets.get(i);
      int event = aWidget.getEvent(mouseX, mouseY);
      if(event != EVENT_NULL)
      {
        return event;
      }
    }
    return EVENT_NULL;
  }
}
