////Kate
//class StatePieChart{
  
//  float a = 15;
//  float b = 25;
//  float c = 30;
//  float d = 30;
//  float totalFlight = 100;
  
//void draw() {
//  if(drawPie == true){
    
//    float aPos = calcRadians(a);
//    float bPos = calcRadians(b);
//    float cPos = calcRadians(c);
//    float dPos = calcRadians(d);
    
//    textSize(20);
//    fill(0);
//    text("Pie Chart: Flight Arrival Time", 1150, 360);
//    textSize(15);
//    text("% On time = ", 1050, 400); //red
//    text("% Early = ", 1050, 450); //blue
//    text("% Cancelled = ", 1050, 500); //green
//    text("% Delayed = ", 1050, 550); //yellow
//    fill(255, 0, 0);
//    rect(1100, 385, 15, 15);
//    fill(0, 255, 0);
//    rect(1100, 435, 15, 15);
//    fill(0, 0, 255);
//    rect(1100, 485, 15, 15);
//    fill(241, 255, 57);
//    rect(1100, 535, 15, 15);
    
//    float currPos = 0;
    
//    fill(255, 0, 0);
//    arc(1250, 460, 150, 150, currPos, aPos);
//    currPos+= aPos;
  
//    fill(0, 255, 0);
//    arc(1250, 460, 150, 150, currPos, currPos + bPos);
//    currPos += bPos;
    
//    fill(0, 0, 255);
//    arc(1250, 460, 150, 150, currPos, currPos + cPos);
//    currPos += cPos;
    
//    fill(241, 255, 57);
//    arc(1250, 460, 150, 150, currPos, currPos + dPos);
// }
// else{
//   drawPie = false;
//  }
// }


// float calcRadians(float f) {
//    float percentage = (f / totalFlight) * 100;
//    float arcPercent = (percentage / 100) * 360;
//    float arcRadians = radians(arcPercent);
//    return arcRadians;
//  }
//}

//////// calculate each state

//// make array list for each state
////ArrayList<String>stateArray = new ArrayList<>();
////for(int i = 0; i < flightDate.size(); i++){
////  if(stateArray.contains("CA"){
////    stateArray.add(i);
////  }
////}

//void cancelledStateFlights() {
//  totalFlight = flightDate.size();
//  for (int i = 0; i < flightDate.size(); i++)
//  {
//    int cancelledVar = int(cancelled.get(i));
//    if (cancelledVar == 1)
//    {
//      cancelledStateFlightsCount++;
//    } else
//    {
//      int predictArrTime = int(crsArrTime.get(i));
//      int actArrTime = int(arrTime.get(i));
//      int subtraction = predictArrTime - actArrTime;
//      if (subtraction > 0)
//      {
//        earlyStateFlightsCount++;
//      } else if (subtraction == 0)
//      {
//        onTimeStateFlightsCount++;
//      } else if (subtraction < 0)
//      {
//        delayedStateFlightsCount++;
//      }
//    }
//  }
//  println(cancelledStateFlightsCount);    
//  println(earlyStateFlightsCount);
//  println(onTimeStateFlightsCount);
//  println(delayedStateFlightsCount);
//  println(totalStateFlight);
//}
