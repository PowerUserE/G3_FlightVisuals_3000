// Eoin
class Histogram {
  //start_x = x position of first rectangle on histogram
  //bottom_y = y position of x-axis of histogram
  //top_y = y position of the top of the y-axis
  //end_x = x position of the end of the x-axis

  int start_x, bottom_y, top_y, end_x, labelColor, xAxisLength, yAxisLength, numberOfDistinctCarriers;
  color colorOfRect;
  String xAxisLabel, yAxisLabel;
  float x, y, w, h;
  PFont labelFont;
  ArrayList<String> distinctCarriers;
  ArrayList<Integer> cDistances = new ArrayList<Integer>();
  ArrayList<Integer> avgDistances = new ArrayList<Integer>();
  ArrayList cancelledPerCarrier = new ArrayList();
  ArrayList<Integer> flightsPerCarrier = new ArrayList<Integer>();

  Histogram(int start_x, int bottom_y, int top_y, int end_x,
    String xAxisLabel, String yAxisLabel, PFont labelFont)
  {
    this.start_x=start_x;
    this.bottom_y=bottom_y;
    this.top_y=top_y;
    this.end_x=end_x;
    this.xAxisLabel=xAxisLabel;
    this.yAxisLabel=yAxisLabel;
    // this.labelFont=labelFont;
    // textFont(labelFont);
    labelColor = 255;
    xAxisLength = end_x - start_x;
    yAxisLength = bottom_y - top_y;
    //println(xAxisLength);
    //println(yAxisLength);
    colorOfRect = color(0, 150, 200);
    distinctCarriers = getDistinctCarriers();
    numberOfDistinctCarriers = distinctCarriers.size();
    cancelledPerCarrier = getCarrierCancelled(distinctCarriers);
    flightsPerCarrier = getCarrierTotalFlights(distinctCarriers);

    for (int i=0; i<distinctCarriers.size(); i++)
    {
      String mCarrier = distinctCarriers.get(i);
      int averageDistance = (int)getAverageDistance(mCarrier);
      avgDistances.add(averageDistance);
    }
  }

  void draw() {
    stroke(255);
    fill(labelColor);
    line(start_x, top_y, start_x, bottom_y);
    line(start_x, bottom_y, end_x, bottom_y);
    text(yAxisLabel, start_x-100, top_y - 20);
    text(xAxisLabel, xAxisLength/2, bottom_y + 70);

    labelXAxis();
    labelYAxis();

    stroke(0);
    fill(255);
    rect(width/2+400, height/2-100, 205, 250);
    line(width/2+400, height/2-40, width/2+400+205, height/2-40);
    line(width/2+417, height/2+70, width/2+580, height/2+70);
    fill(0);
    textSize(18);
    text("Other information:", width/2+420, height/2+70);
    fillHistogram(colorOfRect);
  }


  //////////////////////////////////////////////////////////
  //creates an array list containing all distinct carriers//
  //////////////////////////////////////////////////////////
  ArrayList<String> getDistinctCarriers() {
    ArrayList<String> distValues = new ArrayList<String>();
    for (int i=0; i<mktCarrier.size(); i++)
    {
      String carrier = mktCarrier.get(i);
      if (!distValues.contains(carrier))
      {
        distValues.add(carrier);
      }
    }
    return distValues;
  }


  /////////////////
  //labels x axis//
  /////////////////
  void labelXAxis() {
    int separation = xAxisLength/numberOfDistinctCarriers;
    separation = (separation/2) - 10;
    for (int i=0; i<distinctCarriers.size(); i++)
    {
      String carrierString = distinctCarriers.get(i);
      text(carrierString, start_x+separation, bottom_y+25);
      separation = separation + (xAxisLength/numberOfDistinctCarriers);
    }
  }


  ///////////////////////////////////
  //labels y axis and draws notches//
  ///////////////////////////////////
  void labelYAxis() {
    int highestYValue = 6000;
    int separation = top_y;
    for (int i=highestYValue; i>=0; i=i-1000)
    {
      line(start_x-10, separation, start_x, separation);
      String yAxisValues = Integer.toString(i);
      text(yAxisValues, start_x-60, separation = separation + yAxisLength/7);
    }
  }


  /////////////////////////////////
  //draws rectangles on histogram//
  /////////////////////////////////
  void fillHistogram(color colorRect) {
    float separation = 1;
    for (int i=0; i<distinctCarriers.size(); i++)
    {
      int avgDist = (int)avgDistances.get(i);
      double avgDist_yAxis_ratio = (double)avgDist / (double)7000;

      double rectSpace = yAxisLength * avgDist_yAxis_ratio;
      double emptySpace = yAxisLength - rectSpace;
      fill(colorRect);

      x = start_x+separation+(i*w);
      y = top_y+(float)emptySpace;
      w = xAxisLength/numberOfDistinctCarriers;
      h = (float)rectSpace-1;

      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
        stroke(255);    //highlight rectangle
        fill(0);
        textSize(40);
        text(""+distinctCarriers.get(i), width/2+470, height/2-50);
        textSize(35);
        fill(113, 168, 50);
        text(""+avgDistances.get(i)+" km", width/2+448, height/2+20);
        fill(0);
        textSize(16);
        text("Total Flights = "+flightsPerCarrier.get(i), width/2+420, height/2+110);
        text("Cancelled Flights = "+cancelledPerCarrier.get(i), width/2+420, height/2+140);
      } else {
        stroke(0);
      }
      fill(colorRect);
      rect(x, y, w, h);
    }
  }
  
  ArrayList<Integer> getCarrierTotalFlights(ArrayList<String> carrierList) {
    ArrayList<Integer> total = new ArrayList<Integer>();
    for(int i=0; i<carrierList.size(); i++)
    {
      int count = 0;
      String carrier = carrierList.get(i);
      for(int j=0; j<mktCarrier.size(); j++)
      {
        String currCarrier = mktCarrier.get(j);
        if(currCarrier.equals(carrier)){
          count++;
        }
      }
      total.add(count);
    }
    return total;
  }

  ArrayList<Integer> getCarrierCancelled(ArrayList<String> carrierList) {
    ArrayList cancelledList = new ArrayList();
    for (int i=0; i<carrierList.size(); i++)
    {
      float cancelledCount = 0;
      String carrier = carrierList.get(i);
      for (int j=0; j<mktCarrier.size(); j++)
      {
        String currentCarrier = mktCarrier.get(j);
        if (currentCarrier.equals(carrier)) {
          float cancelledCarr = cancelled.get(j);
          cancelledCount = cancelledCount + cancelledCarr;
        }
      }
      cancelledList.add(cancelledCount);
    }
    return cancelledList;
  }


  //////////////////////////////////////////////////////////
  //computes the average distance of each distinct carrier//
  //////////////////////////////////////////////////////////
  float getAverageDistance(String carrier) {
    float totalDistance = 0;
    float count = 0;
    for (int i=0; i<distance.size(); i++)
    {
      String tempCarrier = mktCarrier.get(i);
      if (tempCarrier == carrier)
      {
        float dist = distance.get(i);
        count = count + 1;
        totalDistance = totalDistance + dist;
      }
    }
    return totalDistance / count;
  }
}
