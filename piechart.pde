

//int[] values = {32, 11, 15, 45, 50, 28};
color[] colorss = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 0, 255), color(0, 255, 255), color(255, 128, 0), color(128, 0, 255), color(255, 0, 128), color(128, 255, 0)};
//color[] colorss = {color(135, 206, 235), color(173, 216, 230), color(125, 249, 255), color(0, 255, 255), color(137, 207, 240), color(240, 255, 255), color(0, 255, 255), color(128, 0, 255), color(255, 0, 128), color(128, 255, 0)};
String[] names = {"Diverted", "Cancelled", "Ontime"};
int[] valval = {32, 11, 15, 45};
int[] DepatureData = new int[3];
int[] ArrivalData = new int[3];
int[] HomePieData = new int[3];




int[] values = {30, 40, 70, 60}; // These are example values, adjust them to your data
//color[] colors = {color(135, 206, 235), color(173, 216, 230), color(125, 249, 255), color(0, 255, 255), color(137, 207, 240), color(240, 255, 255), color(0, 255, 255), color(128, 0, 255),color(135, 206, 235), color(173, 216, 230), color(125, 249, 255), color(0, 255, 255), color(137, 207, 240), color(240, 255, 255), color(0, 255, 255), color(128, 0, 255),color(135, 206, 235), color(173, 216, 230), color(125, 249, 255), color(0, 255, 255), color(137, 207, 240), color(240, 255, 255), color(0, 255, 255), color(128, 0, 255), color(255, 0, 128), color(128, 255, 0)};


//class PieChart {

//  void pieChart(float pX, float pY, float pDia, int[] pVal, int[]pCols) {
//    //noStroke();
//    strokeWeight(1);
//    float total = 0;
//    float lastAngle= -PI;
//    float mouseAngle = atan2(mouseY-pY, mouseX-pX);

//    textFont(SubHeaderFont);
//    textSize(20);
//    text("Pie Chart: Airline Distribution for "+ currState, width/2 + 310, 134);

//    // get sum of values
//    for (int i =0; i<pVal.length; i++) {
//      total += pVal[i];
//    }


//    for (int i =0; i<pVal.length; i++) {
//      ///  rect( width/2 + 310, 134,10,10);
//      fill(pCols[i]);
//      strokeWeight(0);
//      rect(width/2 + 450, 150+ i * 25, 15, 15);
//      strokeWeight(1);
//      float angle = map(pVal[i], 0, total, 0, 2*PI);
//      arc(pX, pY, pDia, pDia, lastAngle, lastAngle+angle, PIE);
//      fill(0);
//      if ( mouseAngle >= lastAngle && mouseAngle < lastAngle+angle ) {
//        float percent = (values[i]/total)*100;
//        text(int(percent)+ " %", pX-pDia/2, pY-pDia/2);
//        //text(values[i] + "/50)", pX-pDia/2, pY-pDia/2);
//      }
//      lastAngle += angle;
//    }
//  }

//}

class PieChart {

  void pieChart(float pX, float pY, float pDia, int[] pVal, int[]pCols, String[] names) {
    strokeWeight(1);
    float total = 0;
    float lastAngle= -PI;
    float mouseAngle = atan2(mouseY-pY, mouseX-pX);
    float percent = 0;

    textFont(SubHeaderFont);
    textSize(20);
    text("Pie Chart: Top 5 Airports for: "+ currState, width/2 + 310, 134);

    // get sum of values
    for (int i =0; i<pVal.length; i++) {
      total += pVal[i];
    }
       
  
    for (int i =0; i<pVal.length; i++) {
       percent = (pVal[i] / total) * 100;
      
      fill(0);
      textFont(screenFont);
      text(int(percent) + "%" ,width/2 + 450, 182+ i * 25);
      strokeWeight(1);
      fill(pCols[i]);
      rect(width/2 + 480, 170+ i * 25, 15, 15);
      textSize(15);
      //fill(0);
      text(names[i], width/2+10 + 493,  182+ i * 25);
      strokeWeight(1);
      float angle = map(pVal[i], 0, total, 0, 2*PI);
      arc(pX, pY, pDia, pDia, lastAngle, lastAngle+angle, PIE);
      //fill(0);

      float midAngle = (lastAngle + lastAngle + angle) / 2;
      //float lineEndX = pX + cos(midAngle) * pDia * 0.55;
      //float lineEndY = pY + sin(midAngle) * pDia * 0.55;
      float percentX = pX + cos(midAngle) * pDia * 0.45;
      float percentY = pY + sin(midAngle) * pDia * 0.45;

      if (mouseAngle >= lastAngle && mouseAngle < lastAngle + angle) {
        // line(pX, pY, lineEndX, lineEndY);
       // textFont(SubHeaderFont);
      }
      fill(0);
        //text(int(percent) + " %", percentX, percentY);
      lastAngle += angle;
    }
  }
  
  void pieChart(float pX, float pY, float pDia, int[] pVal, int[]pCols, String[] names, String currState) {
    strokeWeight(1);
    float total = 0;
    float lastAngle= -PI;
    float mouseAngle = atan2(mouseY-pY, mouseX-pX);
    float percent = 0;

    textFont(SubHeaderFont);     
    text("DEPATURE STATS: "+ currStateFull, 70,130);
    text("ARRIVAL STATS: "+ currStateFull, 570,130);
textSize(20);
    // get sum of values
    for (int i =0; i<pVal.length; i++) {
      total += pVal[i];
    }
       
  
    for (int i =0; i<pVal.length; i++) {
       percent = (pVal[i] / total) * 100;
      
      fill(0);
      textFont(screenFont);
      text(int(percent) + "%" ,70+20, 600+ i * 25);
      if(flagPie){
      text(int(percent) + "%" ,590+20, 600+ i * 25);
      }
      flagPie =false;
      strokeWeight(1);
      fill(pCols[i]);
      rect(70, 600+ i * 25, 15, 15);
      rect(590, 600+ i * 25, 15, 15);
      textSize(15);
      //fill(0);
      text(names[i],70+50,  600+ i * 25);
      text(names[i],590+50,  600+ i * 25);
      strokeWeight(1);
      float angle = map(pVal[i], 0, total, 0, 2*PI);
      arc(pX, pY, pDia, pDia, lastAngle, lastAngle+angle, PIE);
      //fill(0);

      float midAngle = (lastAngle + lastAngle + angle) / 2;
      //float lineEndX = pX + cos(midAngle) * pDia * 0.55;
      //float lineEndY = pY + sin(midAngle) * pDia * 0.55;
      float percentX = pX + cos(midAngle) * pDia * 0.45;
      float percentY = pY + sin(midAngle) * pDia * 0.45;

      if (mouseAngle >= lastAngle && mouseAngle < lastAngle + angle) {
        // line(pX, pY, lineEndX, lineEndY);
       // textFont(SubHeaderFont);
      }
      fill(0);
        //text(int(percent) + " %", percentX, percentY);
      lastAngle += angle;
    }
  }


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
      fill(0);
      if ( mouseAngle >= lastAngle && mouseAngle < lastAngle+angle ) {
        float percent = (values[i]/total)*100;
        text(int(percent)+ " %", pX-pDia/2, pY-pDia/2);
        //text(values[i] + "/50)", pX-pDia/2, pY-pDia/2);
      }
      lastAngle += angle;
    }
  }
}
void testDep() {
  divertDep = 0;
  cancelDep = 0;
  onTimeDep = 0;
  for (int i = 0; i<originState.size(); i++) { // for Depature
    if ((originState.get(i).equals(currState))) {
      if ((diverted.get(i) == 1)) {
        divertDep = divertDep + 1;
      } else if ((cancelled.get(i) == 1)) {
        cancelDep = cancelDep + 1;
      } else {
        onTimeDep = onTimeDep + 1;
      }
    }
  }
  DepatureData[0] = cancelDep;
  DepatureData[1] = onTimeDep;
  DepatureData[2] = divertDep;
}

void testArr() {
  divertArr = 0;
  cancelArr = 0;
  onTimeArr = 0;
  for (int i = 0; i<originState.size(); i++) { // for Arrival
    if ((destState.get(i).equals(currState))) {
      if ((diverted.get(i) == 1)) {
        divertArr = divertArr + 1;
      } else if ((cancelled.get(i) == 1)) {
        //exit();
        cancelArr = cancelArr + 1;
      } else {
        onTimeArr = onTimeArr + 1;
      }
    }
  }
  ArrivalData[0] = cancelArr;
  ArrivalData[1] = onTimeArr;
  ArrivalData[2] = divertArr;
}


void pieHomeData() {
  divertH = 0;
  cancelH = 0;
  onTimeH = 0;
  for (int i = 0; i<originState.size(); i++) { // for Arrival
    if ((destState.get(i).equals(currState)) || (originState.get(i).equals(currState))) {
      if ((diverted.get(i) == 1)) {
        divertH = divertH + 1;
      } else if ((cancelled.get(i) == 1)) {
        //exit();
        cancelH = cancelH + 1;
      } else {
        onTimeH = onTimeH + 1;
      }
    }
  }
  HomePieData[0] = divertH;
  HomePieData[1] = cancelH;
  HomePieData[2] = onTimeH;
}
