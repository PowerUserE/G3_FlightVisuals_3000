class lineGraph {

  void draw(Integer[] xData, Float[] yData, String identifier, color lineColor) {
    if (xData.length != yData.length || xData.length == 0) {
      println(identifier);
      return;
    }
    // println(xData.length);
    sortData(xData, yData);
    stroke(lineColor);
    strokeWeight(1);
    fill(lineColor);

    for (int i = 0; i < xData.length-1; i++) {
      float x1 = 60+(xData[i]*multiplier);
      float y1 = (height-50) -  yData[i]/1.679;
      float x2 = 60+(xData[i+1]*multiplier);
      float y2 = (height-50) -  yData[i+1]/1.679;
      println(xData[i]);

      line(x1, y1, x2, y2);
      ellipse(x1, y1, 5, 5);
    }

    // Draw the last line segment and point
    int lastIndex = xData.length - 1;
    float x2 = 60+(xData[lastIndex]*multiplier);
    float y2 = (height-50) -  yData[lastIndex]/1.679;
    ellipse(x2, y2, 5, 5);

    drawAxes();
  }




  void drawAxes() {
    String title = "Total Delay Time per Day";
    String xAxisLabel = "Date";
    String yAxisLabel = "Total Delay (minutes)";

    // Draw title, xAxisLabel, and yAxisLabel
    fill(0);
    textFont(SubHeaderFont);
    textAlign(CENTER, CENTER);
    text(title + " for " + currStateFull, width / 2, 25);
    text(xAxisLabel, width / 2, height - 20);
    textAlign(RIGHT, CENTER);
    pushMatrix();
    translate(20, height / 2);
    rotate(-PI / 2);
    text(yAxisLabel, 0, 0);
    popMatrix();


    stroke(1);
    strokeWeight(3);

    // Draw x and y axes


    line(100, height - 100, width - 120, height - 100); // horizontal
    line(100, 50, 100, height -100); // vertical

    textFont(screenFont);
    fill(0);

   

    // Draw vertical grid lines, tick marks, and labels on x-axis

    for (int i = 0; i < daysMonth.length; i++) {
      float xPos = 60 + (daysMonth[i] * 40);
      // Draw the tick mark
      strokeWeight(0);
      line(xPos, height - 100, xPos, 50);
      // Draw the text with its unique color
      text(daysMonth[i], xPos + 5, height - 85);
    }



    int highestYValue = 900;
    float separation = 50;//top_y
    int start_x = 115;
    boolean maxYAxisValue = true;
    float yAxisLength = 153.25;
    for (int i=highestYValue; i>=0; i=i-50)
    {
      strokeWeight(0);
      line(start_x-10, separation, start_x+(width-235), separation);
      String yAxisValues = Integer.toString(i);
      textSize(10);
      if (maxYAxisValue) {
        text(yAxisValues, start_x-24, separation);
        maxYAxisValue = false;
      } else {
        text(yAxisValues, start_x-24, separation= separation + (yAxisLength/5));
      }
    }
  }
}
