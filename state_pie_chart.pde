
class HomePieChart {

  void pieChart(float pX, float pY, float pDia, int[] pVal, int[]pCols) {
    //noStroke();
    strokeWeight(1);
    float total = 0;
    float lastAngle= -PI;
    float mouseAngle = atan2(mouseY-pY, mouseX-pX);

    textFont(SubHeaderFont);
    textSize(20);
    text("Pie Chart: Airline Distribution for "+ currState, width/2 + 310, 134);

    // get sum of values
    for (int i =0; i<pVal.length; i++) {
      total += pVal[i];
    }


    for (int i =0; i<pVal.length; i++) {
      ///  rect( width/2 + 310, 134,10,10);
      fill(pCols[i]);
      strokeWeight(0);
      rect(width/2 + 450, 150+ i * 25, 15, 15);
      strokeWeight(1);
      float angle = map(pVal[i], 0, total, 0, 2*PI);
      arc(pX, pY, pDia, pDia, lastAngle, lastAngle+angle, PIE);

      if ( mouseAngle >= lastAngle && mouseAngle < lastAngle+angle ) {
        text(values[i] + "/50)", pX-pDia/2, pY-pDia/2);
      }
      lastAngle += angle;
    }
  }
}



HashMap<String, Integer> airportCounts = new HashMap<String, Integer>();
String[] airportNamesArray;
int[] airportCountsArray;

void pieHomeArray() {
  airportCounts = new HashMap<String, Integer>();

  for (int i = 0; i < originCity.size(); i++) {
    String airport = originCity.get(i);
    if (originState.get(i).equals(currState)) {
      if (airportCounts.containsKey(airport)) {
        int count = airportCounts.get(airport);
        airportCounts.put(airport, count + 1);
      } else {
        airportCounts.put(airport, 1);
      }
    }
  }


  List<String> sortedAirportNames = new ArrayList<String>(airportCounts.keySet());
  sortedAirportNames.sort((a1, a2) -> airportCounts.get(a2).compareTo(airportCounts.get(a1)));

 int topN = min(5, sortedAirportNames.size());
  airportNamesArray = new String[topN];
  airportCountsArray = new int[topN];

  for (int i = 0; i < topN; i++) {
    String airport = sortedAirportNames.get(i);
    airportNamesArray[i] = airport;
    airportCountsArray[i] = airportCounts.get(airport);
  }
}
