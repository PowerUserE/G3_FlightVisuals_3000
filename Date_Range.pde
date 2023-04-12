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
    println(queryDate);

    String[] dateParts = split(queryDate, '/');
    String[] startParts = split(start, '/');
    String[] endParts = split(end, '/');

    String month ;
    int dateMonth ;
    String day;
    int dateDay;
    String year;
    int dateYear;

    try {
      month = queryDate.substring(0, 2);
      dateMonth = Integer.parseInt(month);
    }
    catch(NumberFormatException nfe) {
       month = queryDate.substring(0, 1);
       dateMonth = Integer.parseInt(month);
    }
    
       try {
     day = queryDate.substring(3,5);
    // println(queryDate +" Err " + day);
     dateDay = Integer.parseInt(day);
    }
    catch(NumberFormatException nfe) {
      day = queryDate.substring(2,3);
    //  println(queryDate +" Crr " + day);
     dateDay = Integer.parseInt(day);
    }
    
 try {
    year = queryDate.substring(6, 10);
    dateYear = Integer.parseInt(year);
} catch (NumberFormatException | IndexOutOfBoundsException e1) {
    try {
        year = queryDate.substring(4, 8);
        dateYear = Integer.parseInt(year);
    } catch (NumberFormatException | IndexOutOfBoundsException e2) {
        year = queryDate.substring(5, 9);
        dateYear = Integer.parseInt(year);
    }
}

 
    

    ///  println(month, day, year);

    //int dateMonth = int(dateParts[0]);
    //int dateDay = int(dateParts[1]);
    //int dateYear = int(dateParts[2]);

    int startMonth = int(startParts[0]);
    int startDay = int(startParts[1]);
    int startYear = int(startParts[2]);

    int endMonth = int(endParts[0]);
    int endDay = int(endParts[1]);
    int endYear = int(endParts[2]);

    //try {

    //  String day = date.substring(3, 5);
    //  int dayInt = Integer.parseInt(day);
    //}

    //catch (NumberFormatException nfe) {
    //  try {
    //    String day = date.substring(2, 4);
    //    int dayInt = Integer.parseInt(day);
    //  }
    //  catch (NumberFormatException nfe2) {
    //    String day2 = date.substring(2, 3);
    //    int dayInt2 = Integer.parseInt(day2);
    //  }
    //}

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
  }
}
