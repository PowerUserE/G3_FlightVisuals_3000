void parseFlightData() {
  // new Thread(new Runnable() {
  // public void run() {
  String[] flightData = loadStrings(flightFilePath);
  for (int i = 1; i <flightData.length; i++) {
    // String[] flight = flightData[i].split(",");
    //String[] flight = flightData[i].split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$))", -1);
    String[] flight = flightData[i].split(",(?=([^\"]*\"[^\"]*\")*[^\"]*$)", -1);

    data.add(flight);

    try {
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm");
      LocalDateTime parsedFlightDate = LocalDateTime.parse(flight[0].replace("\"", ""), formatter);
      String formattedFlightDate = parsedFlightDate.format(formatter);

      flightDate.add(formattedFlightDate);
      //  println(flight[0]);
    }
    catch (DateTimeParseException e) {
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M/d/yyyy hh:mm:ss a", Locale.US);
      LocalDateTime parsedFlightDate = LocalDateTime.parse(flight[0].replace("\"", ""), formatter);
      String formattedFlightDate = parsedFlightDate.format(formatter);
      int spaceIndex = formattedFlightDate.indexOf(" "); // most likely '8' but not sure for the full flights file
      String temp =  formattedFlightDate.substring(0, spaceIndex);
      flightDate.add(temp);
      // Handle the exception, e.g., log the error, skip the row, or use a default date
      //  System.out.println("Error parsing date: " + e.getMessage());
    }



    //flightDate.add(flight[0].replace("\"", ""));
    mktCarrier.add(flight[1]);
    //if(flight[1].equals("F9")){
    // println(flight[1]);
    // }
    //println(flight[1]);
    flightNum.add(Integer.parseInt(flight[2]));
    origin.add(flight[3]);
    originCity.add(flight[4].replace("\"", ""));
    originState.add(flight[5]);
    // println(flight[5]);
    originWAC.add(flight[6]);
    dest.add(flight[7]);
    destCity.add(flight[8].replace("\"", "")); // to get rid of the quotation marks
    destState.add(flight[9]);
    //println(flight[9]);
    destWAC.add(Integer.parseInt(flight[10]));
    crsDepTime.add(Integer.parseInt(flight[11]));
    if (flight[12] == "") {
      depTime.add(0);
    } else {
      depTime.add(Integer.parseInt(flight[12]));
    }

    if (flight[13] == "") {
      crsArrTime.add(0);
    } else {
      crsArrTime.add(Integer.parseInt(flight[13]));
    }

    if (flight[14] == "") {
      arrTime.add(0);
    } else {
      arrTime.add(Integer.parseInt(flight[14]));
    }
    //try {
    //  cancelled.add(Integer.parseInt(flight[15]));
    //}
    //catch(NumberFormatException e2) {
      int canC = int(flight[15]);
      cancelled.add(canC);
   // }
  //  try{
  //  diverted.add(Integer.parseInt(flight[16]));
  //  }
  //catch(NumberFormatException e2) {
    int divV = int(flight[15]);
    diverted.add(divV);
 // }
  //distance.add(flight[17]);
  distance.add(Float.parseFloat(flight[17]));

  // showLoadingScreen();
  // redraw();
}

for (int i = 0; i < 31; i++) {
  daysMonth[i] = i + 1;
}
}
//}
//  ).start();
// println("parsing done");
//}

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
ArrayList<Integer> crsDepTime = new ArrayList<Integer>();
ArrayList<Integer> depTime = new ArrayList<Integer>();
ArrayList<Integer> crsArrTime = new ArrayList<Integer>();
ArrayList<Integer> arrTime = new ArrayList<Integer>();
ArrayList<Integer> cancelled = new ArrayList<Integer>();
ArrayList<Integer> diverted = new ArrayList<Integer>();
ArrayList<Float> distance = new ArrayList<Float>();
