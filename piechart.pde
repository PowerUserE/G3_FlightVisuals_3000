//Kate

class PieChart {
  int[] data;
  
  //float onTimeCount, lateCount, cancelledCount;
  //float totalFlights = flightDate.size();
  
  //int cancelledCount = d1.originCityCancelledFlights("WA");
  //int totalFlights = d1.originCityCancelledFlights("WA");
  //int arrivedCount = totalFlights - cancelledCount;
  
    int cancelledCount = 10;
    int totalFlights = 100;
    int arrivedCount = totalFlights - cancelledCount;
  
  ArrayList<Integer> crsArrivalTime = new ArrayList<Integer>();
  ArrayList<Integer> arrivalTime = new ArrayList<Integer>();

  PieChart()
  {
    data = cancelledFlights();
    for(int i=0; i<data.length; i++)
    {
      
    }
  }
  
  void draw() {
    //float aPos = calcRadians(onTimeCount);
    //float bPos = calcRadians(lateCount);
 
    float cPos = calcRadians(cancelledCount);
    float bPos = calcRadians(arrivedCount);
    //float cPos = calcRadians(cancelled);
    
    float currPos = 0;
    
    //fill(255, 0, 0);
    //arc(width/2, height/2, 500, 500, currPos, aPos);
    //currPos += aPos;
    
    //fill(0, 255, 0);
    //arc(width/2, height/2, 500, 500, currPos, currPos + bPos);
    //currPos += bPos;
    
    fill(0, 0, 255);
    arc(width/2 + 550, 465, 160, 160, currPos, cPos);              // old y = height/2
    currPos += cPos;
    
    fill(255, 0, 0);
    arc(width/2 + 550, 465, 160, 160, currPos, currPos + bPos);
    
    textSize(20);
    fill(0);
    text("Flight Arrival Time", 1180, 363);
    textSize(15);
    text("% On time = ", 1080, 410);
    text("% Late = ", 1070, 490);
    fill(252, 23, 3);
    rect(1060, 420, 25, 25);
    fill(3, 8, 252);
    rect(1060, 500, 25, 25);
}

  
  // public float onTimeFlights(String flightArrivalTimeQuery) {
  //  onTimeCount = 0.0;
  //  for(int i = 0; i < crsArrTime.size(); i++) {
  //    float predictedArrTime = crsArrTime.get(i);
  //    float actualArrTime = arrTime.get(i);
  //    float subtraction = predictedArrTime - actualArrTime;
  //    if(subtraction >= 1) {
  //      onTimeCount++;
  //    }  
  //   }
  //  return onTimeCount;
  //}
  
  // public float lateFlights(String flightArrivalTimeQuery) {
  //  lateCount = 0.0;
  //  for(int i = 0; i < arrTime.size(); i++) {
  //    float predictedArrTime = crsArrTime.get(i);
  //    float actualArrTime = arrTime.get(i);
  //    float subtraction = predictedArrTime - actualArrTime;
  //    if(subtraction >= 1) {
  //      lateCount++;
  //    }
  //   }
  //  return lateCount;
  //}

  
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
