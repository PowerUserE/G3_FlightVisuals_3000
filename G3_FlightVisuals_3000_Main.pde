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
}

void draw() {
  background(0);
  



  switch (screen) {
  case "home":
  case "textBox":
    startScreen();
    getTextInput();
    break;
  case "state":
    state();
    break;
  case "lineGraph":
    //lineGraph();
    break;
  case "barChart":
    barChart();
    break;
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
