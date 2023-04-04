DropdownList userQuery;
void dropDown() {
  PFont  textBoxFont;
  textBoxFont = loadFont("Arial-BoldMT-15.vlw");
    cp5 = new ControlP5(this);
  // Create the dropdown list
  userQuery = cp5.addDropdownList("userQuery")
    .setPosition(0, 0)
    .setSize(200, 200)
    .setBarHeight(30) // Modify the bar height to a smaller value
    .setItemHeight(25) // Set the height of each item in the list
    .setBackgroundColor(color(0)) // Change the background color of the list
    .setColorActive(color(255)) // Change the active item color
    .setColorForeground(color(150)) // Change the foreground color
    .setColorBackground(color(100)); // Change the background color of the bar


  userQuery.setFont(textBoxFont);
  //userQuery.setColor(color(255, 255, 0));
   userQuery.setOpen(false);

  // Add 5 options
  userQuery.addItem("Carrier", 0);
  userQuery.addItem("Destination City Cancelled Flights", 1);
  userQuery.addItem("City Outbound Flight By Date", 2);
  userQuery.addItem("Other Stats", 3);
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
  case 3:
    println("OtherStats");
    inputType = "OtherStats";
    break;
    //we could add more cases if we want
  default:
    break;
  }
}
