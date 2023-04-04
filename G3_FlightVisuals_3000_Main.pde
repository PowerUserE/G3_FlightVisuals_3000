import controlP5.*;

ControlP5 cp5;
String carrier;
PImage backgroundImage, mapImage, CA_MAP;
String screen = "home";
String input = "";
String inputType = "carrier"; // by default, we shuld find the carrier information

void setup() {
  PFont  textBoxFont, screenFont, dropDownFont, buttonFont;
  textBoxFont = loadFont("Arial-BoldMT-15.vlw");
  screenFont = loadFont("Arial-BoldMT-15.vlw");
  dropDownFont = loadFont("Arial-BoldMT-15.vlw");
  buttonFont = loadFont("Arial-BoldMT-15.vlw");
  widgetFont = loadFont("Arial-BoldMT-15.vlw"); // I havent used some of this yet but we might want to use different fonts in the future
  size(1200, 800);
  backgroundImage = loadImage("backgroundFinal.jpeg");
  mapImage = loadImage("Map-of-United-States-of-America-with-States-scaled-PhotoRoom.png-PhotoRoom.png");
  CA_MAP = loadImage("CA_MAP.png");
  parseFlightData();

  dropDown();
  textBox();
  ////widget
  widget1 = new Widget(width/2-80, 20, 250, 140, "QUERIES", color(0, 120, 200), widgetFont, EVENT_BUTTON1);
  widget2 = new Widget(width-75, 20, 70, 40, "HOME", color(0, 255, 0), widgetFont, EVENT_BUTTON2);
  widget3 = new Widget(width-75, 65, 65, 40, "BACK", color(0, 255, 0), widgetFont, EVENT_BUTTON3);
  widget4 = new Widget(250, 300, 510, 40, "AVERAGE DISTANCE TRAVELLED BY EACH CARRIER", color(0, 255, 0), widgetFont, EVENT_BUTTON4);
  widget5 = new Widget(250, 400, 510, 40, "NUMBER OF CANCELLED FLIGHTS PER CARRIER", color(0, 255, 0), widgetFont, EVENT_BUTTON5);
  widget6 = new Widget(250, 500, 510, 40, "CARRIERS LATE VS CARRIERS ON-TIME", color(0, 255, 0), widgetFont, EVENT_BUTTON6);


  screen1 = new Screen(color(150), backgroundImage, mapImage);
  screen2 = new Screen(color(150), backgroundImage);
  screen3 = new Screen(color(150), backgroundImage, histogram, "AVERAGE DISTANCE TRAVELLED BY EACH CARRIER");
  screen4 = new Screen(color(150), backgroundImage);
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

  switch (screen) {
  case "home":
  case "textBox":
  case "querypage":
    startScreen();
    getTextInput();
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
}


void state() {

  // kate's code goes here or in a differect class...havent decided
}

// One poroblem might be that we will need the keypresesed for some other action, right now, its tied to the functionality of the textbox and dropdown menu
// A solution might be to get eoin to create a widget that activates or deactivates the text box and drop down menu
void keyPressed() {
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
        } else {
          println("Invalid input type");
        }
      } else if (inputType == null) {
        println("Input type is not set.");
      }
    } else if  (input.equals("clear") ){
      queryRequested = false; //to clear the screen if clear is typed
      println("Screen cleared, type another query");
    }
  }
}

void MouseOver() {
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
