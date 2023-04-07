import g4p_controls.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

GTextField startDateField;
GTextField endDateField;
GButton submitButton;

class Date {
  

   void dateRange(String startDate, String endDate, String queryDate) {

    println("Data within the date range " + startDate + " to " + endDate + ":");
    //for (String data : flightDate) {
    for (int i = 0; i<flightDate.size(); i++) {
      String date = flightDate.get(i).substring(0, 10); // Extract the date from the data string

      if (isWithinDateRange(date, startDate, endDate)) {
        subQueryFlightDate.add(date);
       // println(date);
      }
    }
  }


   boolean isWithinDateRange(String queryDate, String start, String end) {
//println("queryDate");
    String[] dateParts = split(queryDate, '/');
    String[] startParts = split(start, '/');
    String[] endParts = split(end, '/');

    int dateMonth = int(dateParts[0]);
    int dateDay = int(dateParts[1]);
    int dateYear = int(dateParts[2]);

    int startMonth = int(startParts[0]);
    int startDay = int(startParts[1]);
    int startYear = int(startParts[2]);

    int endMonth = int(endParts[0]);
    int endDay = int(endParts[1]);
    int endYear = int(endParts[2]);

    if (dateYear < startYear || dateYear > endYear) {
      return false;
    }

    if (dateYear == startYear && dateMonth < startMonth) {
      return false;
    }

    if (dateYear == startYear && dateMonth == startMonth && dateDay < startDay) {
      return false;
    }

    if (dateYear == endYear && dateMonth > endMonth) {
      return false;
    }

    if (dateYear == endYear && dateMonth == endMonth && dateDay > endDay) {
      return false;
    }
    return true;
  }



  void displayCurrentDateRange() {
    fill(0);
    textAlign(LEFT);
    textFont(SubHeaderFont);
    // textSize(24);
    // text("Current Date Range: ", width/2 + 280, height*5/6+60, 400, 70);
    text(StartDateinput, width/2 + 290, height*5/6+75, 400, 70);
    text(EndDateinput, width/2 + 450, height*5/6+75, 400, 70);
  }

}
public void handleButtonEvents(GButton button, GEvent event) {
  if (button == submitButton && event == GEvent.CLICKED && startDateField.getText() != null
  && endDateField.getText() != null) {
    
    
      StartDateinput = startDateField.getText();
      println(StartDateinput);
    
      EndDateinput = endDateField.getText();
    

    Date date = new Date();
   date.displayCurrentDateRange();
    println("VLOOVP");
  }
  println("VLPBDFD");
}
