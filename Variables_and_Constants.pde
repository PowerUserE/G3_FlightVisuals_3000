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
import java.util.stream.Collectors;


boolean parsing = true;
//String flightFilePath = "flights2k.csv";
//String flightFilePath = "flights10k.csv";
//String flightFilePath = "flights100k.csv";
String flightFilePath = "flights_full.csv";
String[] flightData;


Screen currentScreen, lastScreen, screen1, screen2, screen3, screen4, screen5;
Widget widget1, widget2, widget3, widget4, widget5, widget6, widget7, histWidget1, histWidget2;
int gameScreen = 0;



final int EVENT_BUTTON1 = 1;
final int EVENT_BUTTON2 = 2;
final int EVENT_BUTTON3 = 3;
final int EVENT_BUTTON4 = 4;
final int EVENT_BUTTON5 = 5;
final int EVENT_BUTTON6 = 6;
final int EVENT_BUTTON7 = 7;
final int EVENT_BUTTON_HIST1 = 8;
final int EVENT_BUTTON_HIST2 = 9;
final int EVENT_NULL = 0;
ArrayList<Widget> widgetList = new ArrayList<Widget>();

boolean histogram = true;
boolean pieChart = true;
boolean lineGraph = false;
boolean allStatesHist = false;
boolean currStateHist = false;

boolean flagPie = true;

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

int divertArr = 0;
int cancelArr = 0;
int onTimeArr = 0;

int divertDep = 0;
int cancelDep = 0;
int onTimeDep = 0;

int divertH = 0;
int cancelH = 0;
int onTimeH = 0;


String[] airlines = {"AA", "NK", "AS", "B6", "DL", "F9", "G4", "HA", "UA", "WN"};
color[] airlineColors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 0, 255), color(0, 255, 255), color(255, 128, 0), color(128, 0, 255), color(255, 0, 128), color(128, 255, 0)};
