getData queryData = new getData(); // this is just an object of the getData class that i will use the call the displayMessage function in the draw method
boolean queryRequested = false;
public class getData {
  // to make the code more dynamic, i might be able to add a displaymessge function
  //that shows the message on the screen and the parameters would be just a string based on the result of the query.

  Date date = new Date();
  getData() {
    queryRequested = true;
  }
  void displayMessage() { // void it dosent return any value, just modifies the text on screen
    fill(0);
    textAlign(LEFT, TOP);
    textFont(screenFont);
    //  textSize(20);
    // text(queryResult, 20, 20);
    text(queryResult, width/2 + 290, height-125);
    noFill();
    //   rect(width/2 + 290, height-135, 375, 45);
    // sample text from previous code, look back to debug if issues encountered
  }
  public int carrierDistance(String carrier) {
    int totalDistance = 0;
    for (int i = 0; i<mktCarrier.size(); i++) {
      if (mktCarrier.get(i).equals(carrier)&& date.isWithinDateRange(flightDate.get(i), StartDateinput, EndDateinput)) {
        // println(flightDate.get(i));
        totalDistance += distance.get(i);
      }
    }
    queryResult = ("Total distance for carrier " + carrier  + ": " + totalDistance);
    println(queryResult);
    displayMessage();
    return totalDistance; // this return is here because we might implement the result of this function differently e.g(using the result to calculate something else), depends on use case. for now, we just print!!!
  }

  public int destCityCancelledFlights(String destCityCancelQuery) {
    int count = 0;
    for (int i = 0; i < destCity.size(); i++) {
      if ((destCity.get(i).equals(destCityCancelQuery)) && (cancelled.get(i) != 0.0) && date.isWithinDateRange(flightDate.get(i), StartDateinput, EndDateinput)) {
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


int[] cancelledFlights() {
  int cancelledFlightsCount = 0;
  int earlyFlightsCount = 0;
  int onTimeFlightsCount = 0;
  int delayedFlightsCount = 0;
  for (int i = 0; i < flightDate.size(); i++)
  {
    int cancelledVar = int(cancelled.get(i));
    if (cancelledVar == 1)
    {
      cancelledFlightsCount++;
    } else
    {
      int predictArrTime = int(crsArrTime.get(i));
      int actArrTime = int(arrTime.get(i));
      int subtraction = predictArrTime - actArrTime;
      if (subtraction > 0)
      {
        earlyFlightsCount++;
      } else if (subtraction == 0)
      {
        onTimeFlightsCount++;
      } else if (subtraction < 0)
      {
        delayedFlightsCount++;
      }
    }
  }
  int[] timeArray = {cancelledFlightsCount, earlyFlightsCount, onTimeFlightsCount, delayedFlightsCount};
  //println(cancelledFlightsCount);
  //println(earlyFlightsCount);
  //println(onTimeFlightsCount);
  //println(delayedFlightsCount);
  return timeArray;
}

String getBriefStats(String hoveredState) {
  String output = "Number of airports :  ";
  ArrayList<String> airportList = new ArrayList<String>();
  for (int i=0; i<originState.size(); i++)
  {
    String stateName = originState.get(i);
    if (stateName.equals(hoveredState))
    {
      String airport = origin.get(i);
      if (!airportList.contains(airport))
        airportList.add(airport);
    }
  }
  output = output + airportList.size()+"\n\nMost popular airport :  ";
  ArrayList<Integer> airportCount = new ArrayList<Integer>();
  String mostPopAirport = "";
  int airportFreq = 0;
  for (int i=0; i<airportList.size(); i++)
  {
    int count = 0;
    String distinctAirport = airportList.get(i);
    for (int j=0; j<origin.size(); j++)
    {
      String currentAirport = origin.get(j);
      String stateName = originState.get(j);
      if (currentAirport.equals(distinctAirport) && stateName.equals(hoveredState))
        count++;
    }
    airportCount.add(count);
    if (count > airportFreq)
    {
      mostPopAirport = distinctAirport;
      airportFreq = count;
    }
  }
  output = output+mostPopAirport+"\n\nMost popular airline :  ";
  ArrayList<String> distValues = new ArrayList<String>();
  for (int i=0; i<mktCarrier.size(); i++)
  {
    String carrier = mktCarrier.get(i);
    if (!distValues.contains(carrier))
    {
      distValues.add(carrier);
    }
  }
  ArrayList<Integer> resultArray = new ArrayList<Integer>();
  for (int i=0; i<distValues.size(); i++)
  {
    String carrier = distValues.get(i);
    int count = 0;
    for (int j=0; j<mktCarrier.size(); j++)
    {
      String currCarrier = mktCarrier.get(j);
      String currState = originState.get(j);
      if (currCarrier.equals(carrier) && currState.equals(hoveredState))
      {
        count = count + 1;
      }
    }
    resultArray.add(count);
  }
  String mostPopAirline = "";
  int tempCount = 0;
  for(int i=0; i<resultArray.size(); i++)
  {
    int currentCount = resultArray.get(i);
    if(currentCount > tempCount)
    {
      String tempAirline = distValues.get(i);
      mostPopAirline = tempAirline;
      tempCount = currentCount;
    }
  }
  output = output + mostPopAirline;
  return output;
}


//Number of airports ->
//Most popular airline ->
//Most poplar airport ->
