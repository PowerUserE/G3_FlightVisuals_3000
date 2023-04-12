class DelayData {
  public Integer[] dayArray;
  public Float[] totalDelaysArray;

  public DelayData(Integer[] dayArray, Float[] totalDelaysArray) {
    this.dayArray = dayArray;
    this.totalDelaysArray = totalDelaysArray;
  }
}

DelayData calc(String specificAirline, String state) {
  
    
  float departureDelay = 0;
  float arrivalDelay = 0;
  HashMap<String, Float> totalDelayTime = new HashMap<>();
  

  for (int i = 0; i < flightDate.size(); i++) {
   
    String date = flightDate.get(i);
    String airline = mktCarrier.get(i); // Get the airline for the current flight
    String dateAndAirline = date + "_" + airline; // Concatenate date and airline with an underscore as delimiter
    
if((originState.get(i).equals(state) || destState.get(i).equals(state))){
     departureDelay = crsDepTime.get(i) - depTime.get(i);
     arrivalDelay = crsArrTime.get(i) - arrTime.get(i);
}
    float totalDelay = departureDelay + arrivalDelay;

    if (!totalDelayTime.containsKey(dateAndAirline)) {
      totalDelayTime.put(dateAndAirline, totalDelay);
    } else {
      float currentTotal = totalDelayTime.get(dateAndAirline);
      totalDelayTime.put(dateAndAirline, currentTotal + totalDelay);
    }
  }

  ArrayList<Integer> dayList = new ArrayList<>();
  ArrayList<Float> totalDelaysList = new ArrayList<>();

  for (Map.Entry<String, Float> entry : totalDelayTime.entrySet()) {
    String dateAndAirline = entry.getKey();
    String[] parts = dateAndAirline.split("_");
    String date = parts[0];
    String airline = parts[1];


    if (airline.equals(specificAirline)) {

      try {

        String day = date.substring(3, 5);
        int dayInt = Integer.parseInt(day);
        dayList.add(dayInt);
        if (entry.getValue() < 0) {
          //println("HADFADSKFASDFASDFK" +  entry.getValue() + specificAirline);
        }
        float currentInput = entry.getValue();
        if (currentInput > max) {
          max = currentInput;
        } else if (currentInput < min) {
          min = currentInput;
        }
        float adjValue = map(entry.getValue(), min, max, 180, 920);
        // println(min);
        // println(max);
        totalDelaysList.add(adjValue); // remember to find a way to handle negative values
      }

      catch (NumberFormatException nfe) {
        try {
          String day = date.substring(2, 4);
           int dayInt = Integer.parseInt(day);
          dayList.add(dayInt);
        }
        catch (NumberFormatException nfe2) {
           String day2 = date.substring(2, 3);
            int dayInt2 = Integer.parseInt(day2);
          dayList.add(dayInt2);
        }
        //   println("tytytytytytytytyty     " +  entry.getValue() + specificAirline);
        if (entry.getValue() < 0) {
          // println("HADFADSKFASDFASD     " +  entry.getValue() + specificAirline);
        }
        float currentInput = entry.getValue();
        if (currentInput > max) {
          max = currentInput;
        } else if (currentInput < min) {
          min = currentInput;
        }
            float adjValue = map(entry.getValue(), min, max, 180, 920);
        // println(min);
      //  println(max + " MAX");
        totalDelaysList.add(adjValue); // remember to find a way to handle negative values
      }
    }
  }


  Integer[] dayArray = dayList.toArray(new Integer[0]);
  Float[] totalDelaysArray = totalDelaysList.toArray(new Float[0]);

  return new DelayData(dayArray, totalDelaysArray);
}
float easeInOutQuart(float t) {
  if ((t *= 2) < 1) {
    return 0.5 * t * t * t * t;
  }
  return -0.5 * ((t -= 2) * t * t * t - 2);
}
