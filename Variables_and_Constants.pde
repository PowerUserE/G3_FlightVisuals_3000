import java.util.ArrayList;
import java.util.Collections;
import processing.core.PVector;
import java.util.List;
import java.util.stream.Collectors;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Locale;

boolean parsing = true;
//String flightFilePath = "flights_full.csv";
String flightFilePath = "flights100k.csv";
String[] flightData;


Screen currentScreen, lastScreen, screen1, screen2, screen3, screen4;
Widget widget1, widget2, widget3, widget4, widget5, widget6, widget7;
int gameScreen = 0;

final int EVENT_BUTTON1 = 1;
final int EVENT_BUTTON2 = 2;
final int EVENT_BUTTON3 = 3;
final int EVENT_BUTTON4 = 4;
final int EVENT_BUTTON5 = 5;
final int EVENT_BUTTON6 = 6;
final int EVENT_NULL = 0;
ArrayList<Widget> widgetList = new ArrayList<Widget>();

boolean histogram = true;
boolean pieChart = true;

//String chosenState = "TX";

PFont myFont, myFont2;

String queryResult = "";

PFont widgetFont;

boolean otherStatsRequested = false;



Textfield textbox;

String GroupName = "G3 Flight";

String currState = "Null";
String currStateFull = "Null";
boolean drawHist = false;


ArrayList<String> subQueryFlightDate = new ArrayList<String>();

String startDate = "01/04/2022";   // sample start date
String endDate = "01/06/2022";      // sampe end date

String StartDateinput = "01/01/2022";
String EndDateinput = "01/12/2022";

 PFont  textBoxFont, screenFont, dropDownFont, buttonFont, HeaderFont, SubHeaderFont;

boolean showFieldsAndButton = true; // Set to 'true' to show fields and button by default
boolean showTextBox =  false;
