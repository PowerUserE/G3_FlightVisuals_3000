int hotspotX = 1;
int hotspotY = 1;
int hotspotWidth = 50;
int hotspotHeight = 50;
void startScreen() {

  //image(backgroundImage, 0, 0, width, height);
 //image(mapImage, 0, 0, width, height/*, width/1.5, height/1.5*/); // original values (mapImage, 25, 40, width/1.1, height/1.1); 
  fill(180);
  //rect(hotspotX, hotspotY, hotspotWidth, hotspotHeight);
  rect(107, 73, 20, 20);

  ellipse(107, 73, 15, 15);
  ellipse(95, 132, 15, 15);
  ellipse(323, 102, 15, 15);
  ellipse(221, 168, 15, 15);
  ellipse(151, 257, 15, 15);
  ellipse(81, 295, 15, 15);
  ellipse(227, 388, 15, 15);
  ellipse(262, 290, 15, 15);
  ellipse(349, 216, 15, 15);
  ellipse(468, 136, 15, 15);
  ellipse(486, 200, 15, 15);
  ellipse(470, 252, 15, 15);
  ellipse(366, 306, 15, 15);
  ellipse(355, 397, 15, 15);
  ellipse(484, 323, 15, 15);
  ellipse(477, 465, 15, 15);
  ellipse(533, 405, 15, 15);
  ellipse(597, 160, 15, 15);
  ellipse(601, 244, 15, 15);
  ellipse(627, 317, 15, 15);
  ellipse(642, 405, 15, 15);
  ellipse(648, 487, 15, 15);
  ellipse(702, 450, 15, 15);
  ellipse(761, 384, 15, 15);
  ellipse(694, 293, 15, 15);
  ellipse(669, 181, 15, 15);
  ellipse(786, 343, 15, 15);
  ellipse(763, 287, 15, 15);
  ellipse(769, 456, 15, 15);
  ellipse(834, 437, 15, 15);
  ellipse(890, 535, 15, 15);
  ellipse(893, 415, 15, 15);
  ellipse(900, 365, 15, 15);
  ellipse(911, 324, 15, 15);
  ellipse(871, 305, 15, 15);
  ellipse(825, 272, 15, 15);
  ellipse(774, 204, 15, 15);
  ellipse(924, 248, 15, 15);
  ellipse(957, 186, 15, 15);
  ellipse(1058, 120, 15, 15);
}

void mouseClicked() {
  if (mouseX >= hotspotX && mouseX <= hotspotX + hotspotWidth && mouseY >= hotspotY && mouseY <= hotspotY + hotspotHeight) {
    screen = "home";
    startScreen();
  } else if (mouseX >= 107 && mouseX <= 107 + 20 && mouseY >= 73 && mouseY <= 73 + 20) {
    currentScreen.draw();
  } else if (mouseX >= 95 && mouseX <= 95 + 20 && mouseY >= 132 && mouseY <= 132 + 20) {
    state();
  } else if (mouseX >= 323 && mouseX <= 323 + 20 && mouseY >= 102 && mouseY <= 102 + 20) {
    state();
  } else if (mouseX >= 221 && mouseX <= 221 + 20 && mouseY >= 168 && mouseY <= 168 + 20) {
    state();
  } else if (mouseX >= 151 && mouseX <= 151 + 20 && mouseY >= 257 && mouseY <= 257 + 20) {
    state();
  } else if (mouseX >= 81 && mouseX <= 81 + 20 && mouseY >= 295 && mouseY <= 295 + 20) {
    state();
  } else if (mouseX >= 227 && mouseX <= 227 + 20 && mouseY >= 388 && mouseY <= 388 + 20) {
    state();
  } else if (mouseX >= 262 && mouseX <= 262 + 20 && mouseY >= 290 && mouseY <= 290 + 20) {
    state();
  } else if (mouseX >= 349 && mouseX <= 249 + 20 && mouseY >= 216 && mouseY <= 216 + 20) {
    state();
  } else if (mouseX >= 468 && mouseX <= 468 + 20 && mouseY >= 136 && mouseY <= 136 + 20) {
    state();
  } else if (mouseX >= 486 && mouseX <= 486 + 20 && mouseY >= 200 && mouseY <= 200 + 20) {
    state();
  } else if (mouseX >= 470 && mouseX <= 470 + 20 && mouseY >= 252 && mouseY <= 252 + 20) {
    state();
  } else if (mouseX >= 366 && mouseX <= 366 + 20 && mouseY >= 306 && mouseY <= 306 + 20) {
    state();
  } else if (mouseX >= 355 && mouseX <= 355 + 20 && mouseY >= 397 && mouseY <= 397 + 20) {
    state();
  } else if (mouseX >= 484 && mouseX <= 484 + 20 && mouseY >= 323 && mouseY <= 323 + 20) {
    state();
  } else if (mouseX >= 477 && mouseX <= 477 + 20 && mouseY >= 465 && mouseY <= 465 + 20) {
    state();
  } else if (mouseX >= 533 && mouseX <= 533 + 20 && mouseY >= 405 && mouseY <= 405 + 20) {
    state();
  } else if (mouseX >= 597 && mouseX <= 597 + 20 && mouseY >= 160 && mouseY <= 160 + 20) {
    state();
  } else if (mouseX >= 601 && mouseX <= 601 + 20 && mouseY >= 244 && mouseY <= 244 + 20) {
    state();
  } else if (mouseX >= 627 && mouseX <= 627 + 20 && mouseY >= 317 && mouseY <= 317 + 20) {
    state();
  } else if (mouseX >= 642 && mouseX <= 642 + 20 && mouseY >= 405 && mouseY <= 405 + 20) {
    state();
  } else if (mouseX >= 648 && mouseX <= 648 + 20 && mouseY >= 487 && mouseY <= 487 + 20) {
    state();
  } else if (mouseX >= 702 && mouseX <= 702 + 20 && mouseY >= 450 && mouseY <= 450 + 20) {
    state();
  } else if (mouseX >= 761 && mouseX <= 761 + 20 && mouseY >= 384 && mouseY <= 384 + 20) {
    state();
  } else if (mouseX >= 694 && mouseX <= 694 + 20 && mouseY >= 293 && mouseY <= 293 + 20) {
    state();
  } else if (mouseX >= 669 && mouseX <= 669 + 20 && mouseY >= 181 && mouseY <= 181 + 20) {
    state();
  } else if (mouseX >= 786 && mouseX <= 786 + 20 && mouseY >= 343 && mouseY <= 343 + 20) {
    state();
  } else if (mouseX >= 763 && mouseX <= 763 + 20 && mouseY >= 287 && mouseY <= 287 + 20) {
    state();
  } else if (mouseX >= 769 && mouseX <= 769 + 20 && mouseY >= 456 && mouseY <= 456 + 20) {
    state();
  } else if (mouseX >= 834 && mouseX <= 834 + 20 && mouseY >= 437 && mouseY <= 437 + 20) {
    state();
  } else if (mouseX >= 890 && mouseX <= 890 + 20 && mouseY >= 535 && mouseY <= 535 + 20) {
    state();
  } else if (mouseX >= 893 && mouseX <= 893 + 20 && mouseY >= 415 && mouseY <= 415 + 20) {
    state();
  } else if (mouseX >= 900 && mouseX <= 900 + 20 && mouseY >= 365 && mouseY <= 365 + 20) {
    state();
  } else if (mouseX >= 911 && mouseX <= 911 + 20 && mouseY >= 324 && mouseY <= 324 + 20) {
    state();
  } else if (mouseX >= 871 && mouseX <= 871 + 20 && mouseY >= 305 && mouseY <= 305 + 20) {
    state();
  } else if (mouseX >= 825 && mouseX <= 825 + 20 && mouseY >= 272 && mouseY <= 272 + 20) {
    state();
  } else if (mouseX >= 774 && mouseX <= 774 + 20 && mouseY >= 204 && mouseY <= 204 + 20) {
    state();
  } else if (mouseX >= 924 && mouseX <= 924 + 20 && mouseY >= 248 && mouseY <= 248 + 20) {
    state();
  } else if (mouseX >= 957 && mouseX <= 957 + 20 && mouseY >= 186 && mouseY <= 186 + 20) {
    state();
  } else if (mouseX >= 1058 && mouseX <= 1058 + 20 && mouseY >= 120 && mouseY <= 120 + 20) {
    state();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  } else if (mouseX >= hotspotX && mouseX <= hotspotX + 20 && mouseY >= hotspotY && mouseY <= hotspotY + 20) {
    exit();
  }
}
