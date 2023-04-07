import controlP5.*;

ControlP5 cp5;
String carrier;
PImage backgroundImage, mapImage, CA_MAP, lineGraphSample, pieChartSample, histogramSample, logo;
String screen = "home";
String input = "";
String inputType = "carrier"; // by default, we shuld find the carrier information

void setup() {
  PFont  textBoxFont, screenFont, dropDownFont, buttonFont, resultFont;
  textBoxFont = loadFont("Arial-BoldMT-15.vlw");
  screenFont = loadFont("Arial-BoldMT-15.vlw");
  dropDownFont = loadFont("Arial-BoldMT-15.vlw");
  buttonFont = loadFont("Arial-BoldMT-15.vlw");
  widgetFont = loadFont("Arial-BoldMT-15.vlw"); // I havent used some of this yet but we might want to use different fonts in the future
  resultFont = loadFont("InkFree-30.vlw");
  //size(1420, 800);
  size(1420, 700);
  //backgroundImage = loadImage("backgroundFinal.jpeg");
  backgroundImage = loadImage("treeWhiteTest.jpg");
  lineGraphSample = loadImage("lineGraphSample.png");
  pieChartSample = loadImage("pieChartSample.png");
  histogramSample = loadImage("histogramSample.png");
  logo = loadImage("G3Logo.png");

  //mapImage = loadImage("Map-of-United-States-of-America-with-States-scaled-PhotoRoom.png-PhotoRoom.png");
  mapImage = loadImage("USAMAPBACKGROUND.jpeg");
  CA_MAP = loadImage("CA_MAP.png");
  boolean flag = true;

  parseFlightData();

  dropDown();
  textBox();
  ////widget
  widget1 = new Widget(width-430, 22, 50, 40, "Q", color(0, 255, 0), widgetFont, EVENT_BUTTON1);
  widgetList.add(widget1);
  widget2 = new Widget(width-75, 20, 70, 40, "HOME", color(0, 255, 0), widgetFont, EVENT_BUTTON2);
  widgetList.add(widget2);
  widget3 = new Widget(width-75, 65, 65, 40, "BACK", color(0, 255, 0), widgetFont, EVENT_BUTTON3);
  widgetList.add(widget3);
  widget4 = new Widget(250, 300, 510, 40, "AVERAGE FLYING DISTANCE PER CARRIER", color(0, 255, 0), widgetFont, EVENT_BUTTON4);
  widgetList.add(widget4);
  widget5 = new Widget(250, 400, 510, 40, "TOTAL DISTANCE TRAVELLED BY EACH CARRIER", color(0, 255, 0), widgetFont, EVENT_BUTTON5);
  widgetList.add(widget5);
  widget6 = new Widget(250, 500, 510, 40, "CARRIERS LATE VS CARRIERS ON-TIME", color(0, 255, 0), widgetFont, EVENT_BUTTON6);
  widgetList.add(widget6);


  screen1 = new Screen(color(150), backgroundImage, mapImage);
  screen2 = new Screen(color(150));
  screen3 = new Screen(color(150), histogram, "AVERAGE FLYING DISTANCE PER CARRIER");
  screen4 = new Screen(color(150), pieChart);
  screen1.add(widget1);
  screen2.add(widget2);
  screen2.add(widget4);
  screen2.add(widget5);
  screen2.add(widget6);
  screen3.add(widget2);
  screen3.add(widget3);
  screen4.add(widget2);
  screen4.add(widget3);
  currentScreen = screen1;
}

void draw() {
  background(0);
  if (drawHist == true)
  {
    histog.draw();
  }




  switch (screen) {
  case "home":
    //case "textBox":
  case "querypage":
    stateData();
    // getTextInput();
    currentScreen.draw();
    break;
  case "state":
    currentScreen.draw();
    break;
    //case "queryPage":
    //currentScreen.draw();
    //break;
  default:
    println("Invalid screen");
    break;
  }
  if (queryRequested) {
    queryData.displayMessage();
  }

  if (showTextBox) {
    getTextInput();
    textbox.setVisible(true);
    //println("text");
  } else {
    getTextInput();
    textbox.setVisible(false);
    // println("No Text");
  }

  stateData();
}


void state() {

  // kate's code goes here or in a differect class...havent decided
}

// One poroblem might be that we will need the keypresesed for some other action, right now, its tied to the functionality of the textbox and dropdown menu
// A solution might be to get eoin to create a widget that activates or deactivates the text box and drop down menu
void keyPressed() {
  if (key == 't' || key == 'T') {
    showTextBox = !showTextBox;
  }

  //println(input);
  // Get data when enter key is pressed
  if (key == ENTER || key == RETURN) {
    if (input != null && !input.trim().isEmpty() && (!input.equals("clear"))) {
      getData getInfo = new getData();
      if (inputType != null) {
        if (inputType.equals("carrier")) {
          getInfo.carrierDistance(input);
        } else if (inputType.equals("destinationCancelled")) {
          getInfo.destCityCancelledFlights(input);
        } else if (inputType.equals("cityOutboundFlightByDate")) {
          getInfo.cityOutboundFlightByDate(input, input); // have to figure out a way to send in two inputs
        } else if (inputType.equals("cityOutboundFlightByDate")) {
          getInfo.cityOutboundFlightByDate(input, input); // have to figure out a way to send in two inputs
        } else if (inputType.equals("OtherStats")) {
          otherStatsRequested = true;
        } else if (inputType == null) {
          println("Input type is not set.");
        }
      } else if  (input.equals("clear") ) {
        queryRequested = false; //to clear the screen if clear is typed
        println("Screen cleared, type another query");
      }
    }
  }
}

void mousePressed() {
  switch(currentScreen.getEvent(mouseX, mouseY)) {
  case EVENT_BUTTON1:
    lastScreen = currentScreen;
    currentScreen = screen2;
    break;
  case EVENT_BUTTON2:
    lastScreen = currentScreen;
    currentScreen = screen1;
    break;
  case EVENT_BUTTON3:
    currentScreen = lastScreen;
    break;
  case EVENT_BUTTON4:
    lastScreen = currentScreen;
    currentScreen = screen3;
    break;
  case EVENT_BUTTON5:
    lastScreen = currentScreen;
    currentScreen = screen4;
    break;
  case EVENT_BUTTON6:
    lastScreen = currentScreen;
    currentScreen = screen4;
    break;
  }
}

void mouseMoved() {
  int event;
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (event != EVENT_NULL) {
      aWidget.mouseOver();
    } else
      aWidget.mouseNotOver();
  }
}

// remember, youre trying to organise the page and add the query button to the drop down menu

// remember to get the team to import the js5 library // ask if it is allowed to make use of the library
// Eoin organises the code
// creates widgets
// Daire works on sorting/retrieving method

/*Class notes*/
// Avoid file readings
// what is pandas; research
// Use different type of dats structures that I can store data sets e.g Hashsets, hashmaps
// Ask group if they know how to use

// implement 3 queries on the data
//have a selection mechnism - invole different queries
// draw the queries to the screen

// three types of design patterns
// use the observer pattern to structure the textbox functinality
// implement a screen class to deal with each widget; look into the facade pattern
// signature, saved file


// show a sample query for the user
// implement navigation e.g cusor to scroll through the results
// run queries in respnse to user input and not draw


// What to do for 5th April
// redo the States but when clicked/hover, they will not lead to a new page, they will only specify a query on the stats summary page
// Decide on a group name
// Q button leads to a page with different query options(We have 3 for now)

// We need to work on creating the summary stats with the states
// We need to work on creating the actual query(chosen Q button) stats
// Then the rest is Design
