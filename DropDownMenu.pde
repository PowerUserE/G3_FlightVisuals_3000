DropdownList userQuery;
void dropDown() {
   PFont  textBoxFont;
  textBoxFont = loadFont("Arial-BoldMT-15.vlw");
  //PFont  textBoxFont;
  //textBoxFont = loadFont("Arial-BoldMT-15.vlw");
  cp5 = new ControlP5(this);
  // Create the dropdown list
  userQuery = cp5.addDropdownList("userQuery")
    .setPosition(20, height-300)
    .setSize(250, 150)
    .setBarHeight(50);
    //.setBarVisible(true);

userQuery.setFont(textBoxFont);
  //userQuery.setColor(color(255, 255, 0));

  // Add 5 options
  userQuery.addItem("carrier", 0);
  userQuery.addItem("destCityCancelledFlights", 1);
  userQuery.addItem("cityOutboundFlightByDate", 2);
  // userQuery.addItem("Carrier", 1);
  //userQuery.addItem("Carrier", 1);

  // Listen for dropdown list events
  userQuery.onChange(new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      handleDropdownEvent(theEvent.getController().getValue());
    }
  }
  );
}

void handleDropdownEvent(float value) {
  int optionChosen = (int) value;

  switch (optionChosen) {
  case 0:
    println("carrier");
    inputType = "carrier";
    break;
  case 1:
    println("destCityCancelledFlights");
    inputType = "destinationCancelled";
    break;
  case 2:
    println("cityOutboundFlightByDate");
    inputType = "cityOutboundFlightByDate";
    break;
    //we could add more cases if we want
  default:
    break;
  }
}
