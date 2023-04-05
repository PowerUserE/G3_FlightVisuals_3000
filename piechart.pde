//Kate

class PieChart {
  
  float onTimeCount, lateCount, cancelledCount;
  float totalFlights = flightDate.size();
  
  ArrayList<Integer> crsArrivalTime = new ArrayList<Integer>();
  ArrayList<Integer> arrivalTime = new ArrayList<Integer>();
  
  void draw() {
    float aPos = calcRadians(onTimeCount);
    float bPos = calcRadians(lateCount);
    //float cPos = calcRadians(cancelled);
    
    float currPos = 0;
    
    fill(255, 0, 0);
    arc(width/2, height/2, 500, 500, currPos, aPos);
    currPos += aPos;
    
    fill(0, 255, 0);
    arc(width/2, height/2, 500, 500, currPos, currPos + bPos);
    currPos += bPos;
    
    //fill(0, 0, 255);
    //arc(width/2, height/2, 500, 500, currPos, currPos + cPos);
    
    textSize(40);
    fill(255);
    text("Flight Arrival Time", 250, 100);
    textSize(25);
    text("% On time = ", 100, 400);
    text("% Late = ", 300, 400);
    fill(252, 23, 3);
    rect(170, 385, 20, 20);
    fill(3, 8, 252);
    rect(350, 385, 20, 20);
}

  
   public float onTimeFlights(String flightArrivalTimeQuery) {
    onTimeCount = 0.0;
    for(int i = 0; i < crsArrTime.size(); i++) {
      float predictedArrTime = crsArrTime.get(i);
      float actualArrTime = arrTime.get(i);
      float subtraction = predictedArrTime - actualArrTime;
      if(subtraction >= 1) {
        onTimeCount++;
      }  
     }
    return onTimeCount;
  }
  
   public float lateFlights(String flightArrivalTimeQuery) {
    lateCount = 0.0;
    for(int i = 0; i < arrTime.size(); i++) {
      float predictedArrTime = crsArrTime.get(i);
      float actualArrTime = arrTime.get(i);
      float subtraction = predictedArrTime - actualArrTime;
      if(subtraction >= 1) {
        lateCount++;
      }
     }
    return lateCount;
  }

  //didn't want to change cancelled array list type as it could mess up other peoples code
  // public float destCityCancelledFlights(String destCityCancelQuery) {            
  //  cancelledCount = 0.0;
  //  for (int i = 0; i < destCity.size(); i++) {
  //    if ((destCity.get(i).equals(destCityCancelQuery)) && (cancelled.get(i) != 0.0)) {
  //      cancelledCount++;
  //    }
  //  }
  //  return cancelledCount;
  //}
  
  float calcRadians(float f) {
    float percentage = (f / totalFlights) * 100;
    float arcPercent = (percentage / 100) * 360;
    float arcRadians = radians(arcPercent);
    return arcRadians;
  }

}
