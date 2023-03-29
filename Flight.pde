void parseFlightData() {
  String[] flightData = loadStrings(flightFilePath);
  for (int i = 1; i <flightData.length; i++) {
    // String[] flight = flightData[i].split(",");
    //String[] flight = flightData[i].split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$))", -1);
    String[] flight = flightData[i].split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)", -1);

    data.add(flight);

    //fix syntax later like so:
    //int flightNumber = Integer.parseInt(row[2]); // The flight number is in the 3rd column (index 2)
    //flightNumbers.add(flightNumber);

    flightDate.add(flight[0].replace("\"", ""));
    mktCarrier.add(flight[1]);
    flightNum.add(Integer.parseInt(flight[2]));
    origin.add(flight[3]);
    originCity.add(flight[4].replace("\"", ""));
    originState.add(flight[5]);
    originWAC.add(flight[6]);
    dest.add(flight[7]);
    destCity.add(flight[8].replace("\"", "")); // to get rid of the quotation marks
    destState.add(flight[9]);
    destWAC.add(Integer.parseInt(flight[10]));
    crsDepTime.add(flight[11]);
    depTime.add(flight[12]);
    crsArrTime.add(flight[13]);
    arrTime.add(flight[14]);
    cancelled.add(Double.parseDouble(flight[15]));
    diverted.add(flight[16]);
    //distance.add(flight[17]);
    distance.add(Float.parseFloat(flight[17]));
  }

  //  public List<Flight> getFlightsFromOriginState(String originState) {
  //    return flights.stream()
  //            .filter(flight -> flight.originState.equals(originState))
  //            .collect(Collectors.toList());
  //}

  // reparsed the data to adjust the strings, i.e print without the quotation marks
}

ArrayList<String[]> data = new ArrayList<>();

ArrayList<String> flightDate = new ArrayList<String>();
ArrayList<String> mktCarrier = new ArrayList<String>();
ArrayList<Integer> flightNum = new ArrayList<Integer>();
ArrayList<String> origin = new ArrayList<String>();
ArrayList<String> originCity = new ArrayList<String>();
ArrayList<String> originState = new ArrayList<String>();
ArrayList<String> originWAC = new ArrayList<String>();
ArrayList<String> dest = new ArrayList<String>();
ArrayList<String> destCity = new ArrayList<String>();
ArrayList<String> destState = new ArrayList<String>();
ArrayList<Integer> destWAC = new ArrayList<Integer>();
ArrayList<String> crsDepTime = new ArrayList<String>();
ArrayList<String> depTime = new ArrayList<String>();
ArrayList<String> crsArrTime = new ArrayList<String>();
ArrayList<String> arrTime = new ArrayList<String>();
ArrayList<Double> cancelled = new ArrayList<Double>();
ArrayList<String> diverted = new ArrayList<String>();
ArrayList<Float> distance = new ArrayList<Float>();
