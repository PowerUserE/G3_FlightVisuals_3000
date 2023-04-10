import controlP5.*;

ControlP5 cp5;
String carrier;
PImage backgroundImage, mapImage, CA_MAP, lineGraphSample, pieChartSample, histogramSample, logo, loadingScreen;
String screen = "home";
String input = "";
String inputType = "carrier"; // by default, we shuld find the carrier information
Screen lineGraphScreen = new Screen(color(255), true);



void setup() {
  //noLoop();
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
  widget1 = new Widget(width-430, 22, 50, 40, "Q", color(0, 255, 0), widgetFont, EVENT_BUTTON1);
  widgetList.add(widget1);


  widget1 = new Widget(width-100, 65, 70, 32, "Query", color(0, 255, 0), widgetFont, EVENT_BUTTON1);
  widget2 = new Widget(width-75, 20, 70, 40, "HOME", color(0, 255, 0), widgetFont, EVENT_BUTTON2);
  widgetList.add(widget2);
  widget3 = new Widget(width-75, 65, 65, 40, "BACK", color(0, 255, 0), widgetFont, EVENT_BUTTON3);
  widgetList.add(widget3);
  widget4 = new Widget(250, 300, 510, 40, "AVERAGE FLYING DISTANCE PER CARRIER", color(0, 255, 0), widgetFont, EVENT_BUTTON4);
  widgetList.add(widget4);
  widget5 = new Widget(250, 400, 510, 40, "TOTAL DISTANCE TRAVELLED BY EACH CARRIER", color(0, 255, 0), widgetFont, EVENT_BUTTON5);
  widgetList.add(widget5);
  widget6 = new Widget(250, 500, 510, 40, "Line Graph", color(0, 255, 0), widgetFont, EVENT_BUTTON6);
  widgetList.add(widget6);
  widget7 = new Widget(width-100, 65, 70, 32, "Exit", color(0, 255, 0), widgetFont, EVENT_BUTTON6); // remeber to run widget



  screen1 = new Screen(color(150), backgroundImage, mapImage);
  screen2 = new Screen(color(150));
  screen3 = new Screen(color(150), histogram, "AVERAGE FLYING DISTANCE PER CARRIER");
  screen4 = new Screen(color(150), pieChart);
  screen5 = new Screen(color(255), lineGraph);
  screen1.add(widget1);
  screen2.add(widget2);
  screen2.add(widget4);
  screen2.add(widget5);
  screen2.add(widget6);
  screen3.add(widget2);
  screen3.add(widget3);
  screen4.add(widget2);
  screen4.add(widget3);
  screen5.add(widget2);
  screen5.add(widget3);
  lineGraphScreen.add(widget2);
  lineGraphScreen.add(widget3);
  currentScreen = screen1;




  Date date = new Date();
  //date.dateRange("01/04/2022", "01/06/2022", "01/04/2022");

  startDateField = new GTextField(this, width/2 + 290, height*5/6+35, 150, 30);
  endDateField = new GTextField(this, width/2 + 450, height*5/6+35, 150, 30);

  submitButton = new GButton(this, width/2 + 620, height*5/6+35, 50, 30);

  submitButton.setText("Submit");

  for (int i = 0; i < airlines.length; i++) {
    checkboxes.add(new Checkbox(width-50, 120 + i * 25, 20, airlines[i], airlineColors[i]));
  }
}

void draw() {
  background(0);
  if (drawHist == true)
  {
    histog.draw();
  }


  currentScreen.draw();


  //switch (screen) {
  //case "home":
  //  //case "textBox":
  //case "querypage":
  //  stateData();
  //  // getTextInput();
  //  //currentScreen.draw();
  //  break;
  //case "state":
  //  //currentScreen.draw();
  //  break;
  //  //case "queryPage":
  //  //currentScreen.draw();
  //  //break;
  //default:
  //  println("Invalid screen");
  //  break;
  //}
  if (queryRequested) {
    queryData.displayMessage();
  }
  Date date = new Date();
  if ( currentScreen == screen1) {
    date.displayCurrentDateRange();
  }

  if (showFieldsAndButton && currentScreen == screen1) {
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

  if (lineGraph) {
  
    for (Checkbox checkbox : checkboxes) {
       checkbox.display();
    }


    lineGraph lg = new lineGraph();
    lg.drawAxes();
    for (int j = 0; j < checkboxes.size(); j++) {
      Checkbox checkbox = checkboxes.get(j);
      if (checkbox.state) {
        String airline = checkbox.label;
        color airlineColor = checkbox.airlineColor;
        DelayData delayData = calc(airline, currState);
        Integer[] dayArray = delayData.dayArray;
        Float[] totalDelaysArray = delayData.totalDelaysArray;
        lg.draw(dayArray, totalDelaysArray, airline, airlineColor);
      }
    }
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
  println(mouseX, mouseY);
  for (Checkbox checkbox : checkboxes) {
    checkbox.checkClicked(mouseX, mouseY);
  }
  switch(currentScreen.getEvent(mouseX, mouseY)) {
  case EVENT_BUTTON1:
    lineGraph = false;
    lastScreen = currentScreen;
    currentScreen = screen2;
    break;
  case EVENT_BUTTON2:
    lineGraph = false;
    lastScreen = currentScreen;
    currentScreen = screen1;
    break;
  case EVENT_BUTTON3:
    lineGraph = false;
    currentScreen = lastScreen;
    break;
  case EVENT_BUTTON4:
    lineGraph = false;
    lastScreen = currentScreen;
    currentScreen = screen3;
    break;
  case EVENT_BUTTON5:
    lineGraph = false;
    lastScreen = currentScreen;
    currentScreen = screen4;
    break;
  case EVENT_BUTTON6:
    lineGraph = true;
    lastScreen = currentScreen;
    currentScreen = lineGraphScreen;
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

void sortData(Integer[] xData, Float[] yData) { // bubble sort
  for (int i = 0; i < xData.length - 1; i++) {
    for (int j = 0; j < xData.length - i - 1; j++) {
      if (xData[j] > xData[j + 1]) {
        int xTemp = xData[j];
        float yTemp = yData[j];
        xData[j] = xData[j + 1];
        yData[j] = yData[j + 1];
        xData[j + 1] = xTemp;
        yData[j + 1] = yTemp;
      }
    }
  }
}
