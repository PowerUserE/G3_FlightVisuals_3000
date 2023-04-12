import java.util.ArrayList;
import java.util.Collections;
import processing.core.PVector;
import java.util.List;
import java.util.stream.Collectors;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Locale;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Map;


boolean parsing = true;
String flightFilePath = "flights2k.csv";
//String flightFilePath = "flights10k.csv";
//String flightFilePath = "flights100k.csv";
//String flightFilePath = "flights_full.csv";
String[] flightData;


Screen currentScreen, lastScreen, screen1, screen2, screen3, screen4, screen5;
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
boolean lineGraph = false;

//String chosenState = "TX";

PFont myFont, myFont2;

String queryResult = "";

PFont widgetFont;

boolean otherStatsRequested = false;

float transitionProgress = 0.0;


Textfield textbox;

String GroupName = "G3 FLIGHT";
PImage GroupLogo;
PImage queryIcon, homeIcon, backIcon;


String currState = "Null";
String currStateFull = "Null";
boolean drawHist = false;


ArrayList<String> subQueryFlightDate = new ArrayList<String>();
HashMap<String, Float> totalDelayTime = new HashMap<>();

String StartDateinput = "01/01/2022";
String EndDateinput = "01/31/2022";

PFont  textBoxFont, screenFont, dropDownFont, buttonFont, HeaderFont, SubHeaderFont;

boolean showFieldsAndButton = true; // Set to 'true' to show fields and button by default
boolean showTextBox =  false;

int[] daysMonth = new int[31];
int multiplier = 40;
float max = 0;
float min = 0;
ArrayList<Checkbox> checkboxes = new ArrayList<Checkbox>();


String[] airlines = {"AA", "NK", "AS", "B6", "DL", "F9", "G4", "HA", "UA", "WN"};
color[] airlineColors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 0, 255), color(0, 255, 255), color(255, 128, 0), color(128, 0, 255), color(255, 0, 128), color(128, 255, 0)};
