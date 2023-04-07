class StateHistogram {

  //start_x = x position of first rectangle on histogram
  //bottom_y = y position of x-axis of histogram
  //top_y = y position of the top of the y-axis
  //end_x = x position of the end of the x-axis

  int start_x, bottom_y, top_y, end_x, labelColor, xAxisLength, yAxisLength, numberOfDistinctCarriers;
  color colorOfRect;
  String xAxisLabel, yAxisLabel, chosenState;
  PFont labelFont;
  ArrayList<String> distinctCarriers;
  ArrayList<Integer> carrierCount;
  ArrayList<String> distinctStates;

  StateHistogram(int start_x, int bottom_y, int top_y, int end_x,
    String xAxisLabel, String yAxisLabel, PFont labelFont, String chosenState)
  {
    this.start_x=start_x;
    this.bottom_y=bottom_y;
    this.top_y=top_y;
    this.end_x=end_x;
    this.xAxisLabel=xAxisLabel;
    this.yAxisLabel=yAxisLabel;
    this.chosenState=chosenState;
    // this.labelFont=labelFont;
    // textFont(labelFont);
    labelColor = 0;
    xAxisLength = end_x - start_x;
    yAxisLength = bottom_y - top_y;
    //println(xAxisLength);
    //println(yAxisLength);
    colorOfRect = color(3, 252, 232);
    distinctCarriers = getDistinctCarriers();
    numberOfDistinctCarriers = distinctCarriers.size();
    carrierCount = countNumberOfEachCarrier(currState, distinctCarriers, mktCarrier, originState);
    distinctStates = getDistinctStates();
    //println(distinctStates);

    //for(int i=0; i<distinctCarriers.size(); i++)
    //{
    //  String mCarrier = distinctCarriers.get(i);
    //  float averageDistance = getAverageDistance(mCarrier);
    //  avgDistances.add(averageDistance);
    ////  println("average distance = " + averageDistance);
    //}
    //println(avgDistances);
  }

  void draw() {
    if (drawHist == true)
    {
      stroke(0);
      strokeWeight(1);
      fill(labelColor);
      line(start_x, top_y, start_x, bottom_y);
      line(start_x, bottom_y, end_x, bottom_y);
      textSize(18);
      text("TOTAL NUMBER OF EACH AIRLINE IN " + chosenState, width/2 + 473, 134);
      //text(yAxisLabel, start_x - 10, top_y - 40);
      //text(xAxisLabel, width/2 - 40, bottom_y + 70);

      labelXAxis();
      labelYAxis();
      fillHistogram(colorOfRect);
    }
    else{
      drawHist = false;
    }
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
    separation = (separation/2);
    for (int i=0; i<distinctCarriers.size(); i++)
    {
      String carrierString = distinctCarriers.get(i);
      textSize(10);
      text(carrierString, start_x+separation, bottom_y+12);
      separation = separation + (xAxisLength/numberOfDistinctCarriers);
    }
  }


  ///////////////////////////////////
  //labels y axis and draws notches//
  ///////////////////////////////////
  void labelYAxis() {
    int highestYValue = 500;
    int separation = top_y;
    boolean maxYAxisValue = true;
    for (int i=highestYValue; i>=0; i=i-100)
    {
      line(start_x-10, separation, start_x, separation);
      String yAxisValues = Integer.toString(i);
      textSize(10);
      if (maxYAxisValue) {
        text(yAxisValues, start_x-24, separation);
        maxYAxisValue = false;
      } else {
        text(yAxisValues, start_x-24, separation = separation + yAxisLength/5);
      }
    }
  }


  /////////////////////////////////
  //draws rectangles on histogram//
  /////////////////////////////////
  void fillHistogram(color colorRect) {
    stroke(0);
    strokeWeight(1);
    int separation = 0;
    for (int i=0; i<distinctCarriers.size(); i++)
    {
      int carrCount = carrierCount.get(i);
      double carrCount_yAxis_ratio = (double)carrCount / (double)500;

      double rectSpace = yAxisLength * carrCount_yAxis_ratio;
      double emptySpace = yAxisLength - rectSpace;
      fill(colorRect);
      rect(start_x+separation, top_y+(float)emptySpace, xAxisLength/numberOfDistinctCarriers, (float)rectSpace);
      separation = separation + (xAxisLength/numberOfDistinctCarriers);
    }
  }


  /// number of each carrier for particular state
  ArrayList<Integer> countNumberOfEachCarrier(String chosenState, ArrayList<String> distCarrierList, ArrayList<String> carrierList, ArrayList<String> stateList) {
    ArrayList<Integer> resultArray = new ArrayList<Integer>();
    for (int i=0; i<distCarrierList.size(); i++)
    {
      String carrier = distCarrierList.get(i);
      int count = 0;
      for (int j=0; j<carrierList.size(); j++)
      {
        String currCarrier = carrierList.get(j);
        String currState = stateList.get(j);
        if (currCarrier.equals(carrier) && currState.equals(chosenState))
        {
          count = count + 1;
        }
      }
      resultArray.add(count);
    }
    //println(resultArray);
    return resultArray;
  }

  ArrayList<String> getDistinctStates() {
    ArrayList<String> distStates = new ArrayList<String>();
    for (int i=0; i<originState.size(); i++)
    {
      String state = originState.get(i);
      if (!distStates.contains(state))
      {
        distStates.add(state);
      }
    }
    return distStates;
  }
}
