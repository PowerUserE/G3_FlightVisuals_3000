//ArrayList<String> airlines = new ArrayList<String>();
//ArrayList<Float> totalDistances = new ArrayList<Float>();

//void barChart() {
//  updateAirlinesAndTotalDistances();

//  int leftMargin = 80;
//  int rightMargin = 80;
//  int topMargin = 60;
//  int bottomMargin = 80;

//  textSize(12);
//  textAlign(CENTER, CENTER);
//  fill(255);
//  rect(hotspotX, hotspotY, hotspotWidth, hotspotHeight);
//  text("HOME", hotspotX, hotspotY, hotspotWidth, hotspotHeight);
//  fill(0);
//  background(255);
//  stroke(0);
//  textSize(12);
//  screen = "barChart";

//  // Add title at the top of the chart
//  textSize(20);
//  textAlign(CENTER, CENTER);
//  text("Flight Distances by Airline", width / 2, topMargin/2);


//  // draw x and y axis lines
//  line(leftMargin, height - bottomMargin, width - rightMargin, height - bottomMargin); // x axis
//  line(leftMargin, topMargin, leftMargin, height - bottomMargin); // y axis

//  /*
//  for (int i = 0; i < mktCarrier.size(); i++) {
//   String airline = mktCarrier.get(i);
//   int index = airlines.indexOf(airline);
//   if (index == -1) {
//   airlines.add(airline);
//   totalDistances.add(distance.get(i));
//   } else {
//   totalDistances.set(index, totalDistances.get(index) + distance.get(i));
//   }
//   }
//   */

//  float minDist = Collections.min(totalDistances);
//  float maxDist = Collections.max(totalDistances);
//  // to make the y-axis have a scale of a value multiple of 10;
//  int maxY = (int) (Math.ceil(maxDist / 10.0) * 10);

//  int tickInterval = maxY/10;


//  float xInterval = (float) (width - leftMargin - rightMargin) / (airlines.size() + 1);
//  float yRange = maxDist;

//  // Calculate the y-axis scaling factor
//  float yAxisHeight = height - topMargin - bottomMargin; // Margin at the top and bottom
//  float yScaleFactor = yAxisHeight / yRange;


//  // ticks and labels for x-axis (flightDate)
//  int numTicks = 10; // have to change the value
//  for (int i = 0; i < numTicks; i++) {
//    float x = leftMargin + xInterval * (i + 1);
//    float barHeight = totalDistances.get(i) * yScaleFactor;


//    //float x = 50 + tickSpacing * i;
//    line(x, height - bottomMargin + 5, x, height - bottomMargin - 5); // tick
//    //int index = (int) map(i, 0, numTicks - 1, 0, data.size() - 1);
//    String label = airlines.get(i); // extract month and day from date string
//    textAlign(CENTER);
//    text(label, x, height - bottomMargin + 20); // label
//    //println(label);
//    // Draw bar and values
//    textAlign(CENTER);
//    text(totalDistances.get(i), x, height - barHeight - 85);
//    rect(x - xInterval / 4, height - barHeight - bottomMargin, xInterval / 2, barHeight);
//  }

//  //// Draw ticks and labels on y axis
//  //println(minDist, maxDist);

//  int yAxisTicks = maxY / tickInterval + 1;
//  float yTickSpacing = (height - topMargin - bottomMargin) / (float) (yAxisTicks - 1);
//  for (int i = 0; i < yAxisTicks; i++) {
//    float y = height - bottomMargin - yTickSpacing * i;
//    line(leftMargin - 5, y, leftMargin + 5, y); // tick
//    //int index = (int) map(i, 0, yAxisTicks, 0, maxY); // changed the min-dist to 0 and using maxY instread of maxNum
//    int index = i * tickInterval;
//    textAlign(RIGHT);
//    //text(0, 45, height - 50);
//    text(index, leftMargin - 10, y + 5); // label
//    //println(index);
//  }
//}

//void updateAirlinesAndTotalDistances() {
//  airlines.clear();
//  totalDistances.clear();

//  for (int i = 0; i < mktCarrier.size(); i++) {
//    String airline = mktCarrier.get(i);
//    int index = airlines.indexOf(airline);
//    if (index == -1) {
//      airlines.add(airline);
//      totalDistances.add(distance.get(i));
//    } else {
//      totalDistances.set(index, totalDistances.get(index) + distance.get(i));
//    }
//  }
//}
