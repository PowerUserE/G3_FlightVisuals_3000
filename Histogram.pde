// Eoin
class Histogram {
  //start_x = x position of first rectangle on histogram
  //bottom_y = y position of x-axis of histogram
  //top_y = y position of the top of the y-axis
  //end_x = x position of the end of the x-axis
  
  int start_x, bottom_y, top_y, end_x, labelColor, xAxisLength, yAxisLength, numberOfDistinctCarriers;
  color colorOfRect;
  String xAxisLabel, yAxisLabel;
  PFont labelFont;
  ArrayList<String> distinctCarriers;
  ArrayList<Integer> cDistances = new ArrayList<Integer>();
  ArrayList<Float> avgDistances = new ArrayList<Float>();
  
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
    
    for(int i=0; i<distinctCarriers.size(); i++)
    {
      String mCarrier = distinctCarriers.get(i);
      float averageDistance = getAverageDistance(mCarrier);
      avgDistances.add(averageDistance);
    //  println("average distance = " + averageDistance);
    }
    //println(avgDistances);
  }
  
  void draw(){
    stroke(255);
    fill(labelColor);
    line(start_x, top_y, start_x, bottom_y);
    line(start_x, bottom_y, end_x, bottom_y); 
    text(yAxisLabel, 10, top_y - 40);                 
    text(xAxisLabel, width/2 - 40, bottom_y + 70);
    
    labelXAxis();
    labelYAxis();
    fillHistogram(colorOfRect);
  }
  
  
  //////////////////////////////////////////////////////////
  //creates an array list containing all distinct carriers//
  //////////////////////////////////////////////////////////
  ArrayList<String> getDistinctCarriers() {
    ArrayList<String> distValues = new ArrayList<String>();
    for(int i=0; i<mktCarrier.size(); i++)
    {
      String carrier = mktCarrier.get(i);
      if(!distValues.contains(carrier))
      {
        distValues.add(carrier);
      }
    }
    return distValues;
}


  /////////////////
  //labels x axis//
  /////////////////
  void labelXAxis(){
    int separation = xAxisLength/numberOfDistinctCarriers;
    separation = (separation/2) - 10;
    for(int i=0; i<distinctCarriers.size(); i++)
    {
      String carrierString = distinctCarriers.get(i);
      text(carrierString, start_x+separation, bottom_y+25);
      separation = separation + (xAxisLength/numberOfDistinctCarriers);
    }
  }
  
  
  ///////////////////////////////////
  //labels y axis and draws notches//
  ///////////////////////////////////
  void labelYAxis(){
    int highestYValue = 6000;
    int separation = top_y;
    for(int i=highestYValue; i>=0; i=i-1000)               
    {
      line(start_x-10, separation, start_x, separation);
      String yAxisValues = Integer.toString(i);
      text(yAxisValues, start_x-60, separation = separation + yAxisLength/7);
    }
  }


  /////////////////////////////////
  //draws rectangles on histogram// 
  /////////////////////////////////
  void fillHistogram(color colorRect){
    stroke(0);
    int separation = 1;
    for(int i=0; i<distinctCarriers.size(); i++)
    {
      Float avgDist = avgDistances.get(i); 
      double avgDist_yAxis_ratio = (double)avgDist / (double)7000;   
      
      double rectSpace = yAxisLength * avgDist_yAxis_ratio;
      double emptySpace = yAxisLength - rectSpace; 
      fill(colorRect);
      rect(start_x+separation, top_y+(float)emptySpace, xAxisLength/numberOfDistinctCarriers, (float)rectSpace-1);
      separation = separation + (xAxisLength/numberOfDistinctCarriers);
    }
  }
  
  
  //////////////////////////////////////////////////////////
  //computes the average distance of each distinct carrier//
  //////////////////////////////////////////////////////////
  float getAverageDistance(String carrier){
    float totalDistance = 0;
    float count = 0;
    for(int i=0; i<distance.size(); i++)
    {
      String tempCarrier = mktCarrier.get(i);
      if(tempCarrier == carrier)
      {
        float dist = distance.get(i);
        count = count + 1;
        totalDistance = totalDistance + dist;
      }
    } 
    return totalDistance / count;
  }
  
}
