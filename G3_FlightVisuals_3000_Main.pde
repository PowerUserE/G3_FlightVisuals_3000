import controlP5.*;

ControlP5 cp5;
String carrier;
PImage backgroundImage, mapImage, CA_MAP;
String screen = "home";
String input = "";
String inputType = "carrier"; // by default, we shuld find the carrier information

void setup() {
  PFont  textBoxFont;
  textBoxFont = loadFont("Arial-BoldMT-15.vlw");
  size(1200, 800);
  backgroundImage = loadImage("backgroundFinal.jpeg");
  mapImage = loadImage("Map-of-United-States-of-America-with-States-scaled-PhotoRoom.png-PhotoRoom.png");
  CA_MAP = loadImage("CA_MAP.png");
  parseFlightData();
  startScreen();
  dropDown();
  textBox();
  ////widget
    widget1 = new Widget(100, 620, 110, 40, "QUERIES", color(0, 255, 0), myFont, EVENT_BUTTON1);
  widget2 = new Widget(width-75, 20, 70, 40, "HOME", color(0, 255, 0), myFont, EVENT_BUTTON2);
  widget3 = new Widget(width-75, 65, 65, 40, "BACK", color(0, 255, 0), myFont, EVENT_BUTTON3);
  widget4 = new Widget(250, 300, 510, 40, "AVERAGE DISTANCE TRAVELLED BY EACH CARRIER", color(0, 255, 0), myFont, EVENT_BUTTON4);
  widget5 = new Widget(250, 400, 510, 40, "TOTAL DISTANCE TRAVELLED BY EACH CARRIER", color(0, 255, 0), myFont, EVENT_BUTTON5);
  widget6 = new Widget(250, 500, 510, 40, "CARRIERS LATE VS CARRIERS ON-TIME", color(0, 255, 0), myFont, EVENT_BUTTON6);
  
  screen1 = new Screen(color(150), backgroundImage, mapImage);
  screen2 = new Screen(color(150));
  screen3 = new Screen(color(150), histogram, "AVERAGE DISTANCE TRAVELLED BY EACH CARRIER");
  screen4 = new Screen(color(150));
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
  
  
    //currentScreen.draw();
  



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
    if (input != null && !input.trim().isEmpty()) {
      getData getInfo = new getData();
      if (inputType != null) {
        if (inputType.equals("carrier")) {
          getInfo.carrierDistance(input);
        } else if (inputType.equals("destinationCancelled")) {
          getInfo.destCityCancelledFlights(input);
        } else if (inputType.equals("cityOutboundFlightByDate")) {
          getInfo.cityOutboundFlightByDate(input, input); // have to figure out a way to send in two inputs
        } else {
          println("Invalid input type");
        }
      } else if (inputType == null) {
        println("Input type is not set.");
      }
    } else {
      println("Please enter a valid input.");
    }
  }
}

void MouseOver(){
}
void mousePressed(){
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

// remember to get the team to import the js5 library // ask if it is allowed to make use of the library
// Eoin organises the code
// creates widgets
// Daire works on sorting/retrieving method

/*Class notes*/
// Avoid file readings
// what is pandas
// Use different type of dats structures that I can store data sets

// iimpelent 3 queries on the data
//have a selection mechnism - invole different queries
// draw the queries to the screen

// three types of design patterns
// use the observer pattern to structure the textbox functinality
// implement a screen class to deal with each widget; look into the facade pattern
// signate, saved file
