import java.util.ArrayList;
import java.util.Collections;
import processing.core.PVector;
import java.util.List;
import java.util.stream.Collectors;

String flightFilePath = "flights10k.csv";
String[] flightData;



Screen currentScreen, lastScreen, screen1, screen2, screen3, screen4;
Widget widget1, widget2, widget3, widget4, widget5, widget6;
int gameScreen = 0;

final int EVENT_BUTTON1 = 1;
final int EVENT_BUTTON2 = 2;
final int EVENT_BUTTON3 = 3;
final int EVENT_BUTTON4 = 4;
final int EVENT_BUTTON5 = 5;
final int EVENT_BUTTON6 = 6;
final int EVENT_NULL = 0;
ArrayList widgetList;

boolean histogram = true;

PFont myFont, myFont2;

String queryResult = "";

PFont widgetFont;
