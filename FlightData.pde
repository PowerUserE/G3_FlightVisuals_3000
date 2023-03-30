getData queryData = new getData(); // this is just an object of the getData class that i will use the call the displayMessage function in the draw method
boolean queryRequested = false;
public class getData {
  // to make the code more dynamic, i might be able to add a displaymessge function
  //that shows the message on the screen and the parameters would be just a string based on the result of the query.

  getData() {
    queryRequested = true;
  }
  void displayMessage() { // void it dosent return any value, just modifies the text on screen
    fill(255);
    textAlign(LEFT, TOP);
    textSize(25);
    text(queryResult, 20, 20);
    // sample text from previous code, look back to debug if issues encountered
  }
  public int carrierDistance(String carrier) {
    int totalDistance = 0;
    for (int i = 1; i<mktCarrier.size(); i++) {
      if (mktCarrier.get(i).equals(carrier)) {
        totalDistance += distance.get(i);
      }
    }
    queryResult = ("Total distance for carrier " + carrier + ": " + totalDistance);
    println(queryResult);
    displayMessage();
    return totalDistance; // this return is here because we might implement the result of this function differently e.g(using the result to calculate something else), depends on use case. for now, we just print!!!
  }

  public int destCityCancelledFlights(String destCityCancelQuery) {
    int count = 0;
    for (int i = 0; i < destCity.size(); i++) {
      if ((destCity.get(i).equals(destCityCancelQuery)) && (cancelled.get(i) != 0.0)) {
        count++;
      }
    }
    queryResult = ("Total cancelled flights for  " + destCityCancelQuery + ": " + count);
    println(queryResult);
    displayMessage();
    return count;
  }

  public int cityOutboundFlightByDate(String originStateQuery, String flightDateQuery) { // I need to modify this function to get an new dataset based on the dates selected
    int count = 0;
    for (int i = 0; i < destCity.size(); i++) {
      if ((originCity.get(i).equals(originStateQuery)) && (flightDate.get(i).equals(flightDateQuery))) {
        count++;
      }
    }
    queryResult = ("Total outbound flights for  " + originStateQuery + ": " + count);
    println(queryResult);
    displayMessage();
    return count;
  }
  
 
}
