import controlP5.*;

ControlP5 cp5;
String carrier;
PImage backgroundImage, mapImage, CA_MAP, lineGraphSample, pieChartSample, histogramSample, logo, loadingScreen;
String screen = "home";
String input = "";
String inputType = "carrier"; // by default, we shuld find the carrier information

void setup() {






  HeaderFont = loadFont("PTSerif-Bold-42.vlw"); // assign the loaded font to the variable
  SubHeaderFont = loadFont("PTSerif-Regular-28.vlw"); // assign the loaded font to the variable
  textBoxFont = loadFont("Arial-BoldMT-15.vlw");
  screenFont = loadFont("PTSerif-Regular-16.vlw");
  dropDownFont = loadFont("Arial-BoldMT-15.vlw");
  buttonFont = loadFont("Arial-BoldMT-15.vlw");
  widgetFont = loadFont("Arial-BoldMT-15.vlw"); // I havent used some of this yet but we might want to use different fonts in the future

  //size(1420, 800);
  size(1420, 700);

  //backgroundImage = loadImage("backgroundFinal.jpeg");
  backgroundImage = loadImage("treeWhiteTest.jpg");
  lineGraphSample = loadImage("lineGraphSample.png");
  pieChartSample = loadImage("pieChartSample.png");
  histogramSample = loadImage("histogramSample.png");
  logo = loadImage("G3Logo.png");
  loadingScreen = loadImage("loadingScreen.jpeg");
  //image(loadingScreen, 0, 0, width, height);
  parseFlightData();

  //mapImage = loadImage("Map-of-United-States-of-America-with-States-scaled-PhotoRoom.png-PhotoRoom.png");
  mapImage = loadImage("USAMAPBACKGROUND.jpeg");
  CA_MAP = loadImage("CA_MAP.png");



  dropDown();
  textBox();
  ////widget


  widget1 = new Widget(width-100, 65, 70, 32, "Query", color(0, 255, 0), widgetFont, EVENT_BUTTON1);
  widget2 = new Widget(width-75, 20, 70, 40, "HOME", color(0, 255, 0), widgetFont, EVENT_BUTTON2);
  widget3 = new Widget(width-75, 65, 65, 40, "BACK", color(0, 255, 0), widgetFont, EVENT_BUTTON3);
  widget4 = new Widget(250, 300, 510, 40, "AVERAGE DISTANCE TRAVELLED BY EACH CARRIER", color(0, 255, 0), widgetFont, EVENT_BUTTON4);
  widget5 = new Widget(250, 400, 510, 40, "TOTAL DISTANCE TRAVELLED BY EACH CARRIER", color(0, 255, 0), widgetFont, EVENT_BUTTON5);
  widget6 = new Widget(250, 500, 510, 40, "CARRIERS LATE VS CARRIERS ON-TIME", color(0, 255, 0), widgetFont, EVENT_BUTTON6);
  widget7 = new Widget(width-100, 65, 70, 32, "Exit", color(0, 255, 0), widgetFont, EVENT_BUTTON6); // remeber to run widget



  screen1 = new Screen(color(150), backgroundImage, mapImage);
  screen2 = new Screen(color(150));
  screen3 = new Screen(color(150), histogram, "AVERAGE DISTANCE TRAVELLED BY EACH CARRIER");
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




  Date date = new Date();
  //date.dateRange("01/04/2022", "01/06/2022", "01/04/2022");

  startDateField = new GTextField(this, width/2 + 290, height*5/6+35, 150, 30);
  endDateField = new GTextField(this, width/2 + 450, height*5/6+35, 150, 30);

  submitButton = new GButton(this, width/2 + 620, height*5/6+35, 50, 30);

  submitButton.setText("Submit");
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


  stateData();
  Date date = new Date();
  date.displayCurrentDateRange();


  if (showFieldsAndButton) {
    startDateField.setVisible(true);
    endDateField.setVisible(true);
    submitButton.setVisible(true);
    date.displayCurrentDateRange();
  } else {
    startDateField.setVisible(false);
    endDateField.setVisible(false);
    submitButton.setVisible(false);
  }

  if (showTextBox) {
    getTextInput();
    textbox.setVisible(true);
  } else {
    textbox.setVisible(false);
  }
}


// One poroblem might be that we will need the keypresesed for some other action, right now, its tied to the functionality of the textbox and dropdown menu
// A solution might be to get eoin to create a widget that activates or deactivates the text box and drop down menu
void keyPressed() {
  if (key == '<' || key == '>') { // press '<' or '>' hide date range fields and button
    showFieldsAndButton = !showFieldsAndButton;
  }
  if (key == TAB || key == TAB) { // press '<' or '>' hide date range fields and button
    showTextBox = !showTextBox;
    queryRequested = false;
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
