int hotspotX = 1;
int hotspotY = 1;
int hotspotWidth = 50;
int hotspotHeight = 50;
void stateData() {
  strokeWeight(1);
  fill(225);
  //rect(249, 235, 100,78);
}

void mouseClicked() {

  println(mouseX,mouseY);
  if (mouseX >= 367 && mouseX <= 367 + 130 && mouseY >= 495 && mouseY <= 495 + 130) {
    currState = "TX"; // Texas
    println("Texas");
  } else if (mouseX >= 647 && mouseX <= 647 + 50 && mouseY >= 485 && mouseY <= 485 + 60) {
    currState = "AL"; // Alabama
    println("Alabama");
  } else if (mouseX >= 7 && mouseX <= 7 + 200 && mouseY >= 538 && mouseY <= 538 + 200) {
    currState = "AK"; // Alaska
    println("Alaska");
  } else if (mouseX >= 156 && mouseX <= 156 + 85 && mouseY >= 418 && mouseY <= 418 + 100) {
    currState = "AZ"; // Arizona
    println("Arizona");
  } else if (mouseX >= 531 && mouseX <= 531 + 45 && mouseY >= 445 && mouseY <= 445 + 60) {
    currState = "AR"; // Arkansas
    println("Arkansas");
  } else if ((mouseX >= 5 && mouseX <= 5 + 95 && mouseY >= 362 && mouseY <= 362 + 100) || (mouseX >= 0 && mouseX <= 0 + 70 && mouseY >= 249 && mouseY <= 249 + 100)) {
    currState = "CA"; // California
    println("California");
  } else if (mouseX >= 272 && mouseX <= 272 + 100 && mouseY >= 333 && mouseY <= 333 + 60) {
    currState = "CO"; // Colorado
    println("Colorado");
  } else if (mouseX >= 879 && mouseX <= 879 + 25 && mouseY >= 259 && mouseY <= 259 + 15) {
    currState = "CT"; // Connecticut
    println("Connecticut");
  } else if (mouseX >= 889 && mouseX <= 889 + 70 && mouseY >= 336 && mouseY <= 336 + 30) {
    currState = "DE"; // Delaware
    println("Delaware");
  } else if (mouseX >= 699 && mouseX <= 699 + 130 && mouseY >= 565 && mouseY <= 565 + 100) {
    currState = "FL"; // Florida
    println("Florida");
  } else if (mouseX >= 713 && mouseX <= 713 + 60 && mouseY >= 490 && mouseY <= 490 + 40) {
    currState = "GA"; // Georgia
    println("Georgia");
  } else if (mouseX >= 229 && mouseX <= 229 + 130 && mouseY >= 612 && mouseY <= 612 + 75) {
    currState = "HI"; // Hawaii
    println("Hawaii");
  } else if (mouseX >= 161 && mouseX <= 161 + 70 && mouseY >= 225 && mouseY <= 225 + 40) {
    currState = "ID"; // Idaho
    println("Idaho");
  } else if (mouseX >= 589 && mouseX <= 589 + 50 && mouseY >= 335 && mouseY <= 335 + 30) {
    currState = "IL"; // Illinois
    println("Illinois");
  } else if (mouseX >= 647 && mouseX <= 647 + 40 && mouseY >= 316 && mouseY <= 316 + 55) {
    currState = "IN"; // Indiana
    println("Indiana");
  } else if (mouseX >= 501 && mouseX <= 501 + 70 && mouseY >= 276 && mouseY <= 276 + 55) {
    currState = "IA"; // Iowa
    println("Iowa");
  } else if (mouseX >= 390 && mouseX <= 390 + 120 && mouseY >= 360 && mouseY <= 360 + 55) {
    currState = "KS"; // Kansas
    println("Kansas");
  } else if ((mouseX >= 645 && mouseX <= 645 + 70 && mouseY >= 393 && mouseY <= 393 + 20)  || (mouseX >= 690 && mouseX <= 690 + 45 && mouseY >= 374 && mouseY <= 374 + 40)) {
    currState = "KY"; // Kentucky
    println("Kentucky");
  } else if ((mouseX >= 549 && mouseX <= 549 + 60 && mouseY >= 560 && mouseY <= 560 + 40)  || (mouseX >= 540 && mouseX <= 540 + 40 && mouseY >= 520 && mouseY <= 520 + 45)) {
    currState = "LA"; // Louisiana
    println("Louisiana");
  } else if (mouseX >= 390 && mouseX <= 390 + 120 && mouseY >= 360 && mouseY <= 360 + 55) {
    currState = "ME"; // Maine
    println("Maine");
    } else if (mouseX >= 821 && mouseX <= 821 + 35 && mouseY >= 328 && mouseY <= 328 + 10) {
      currState = "MD"; // MaryLand
      println("MaryLand");
    } else if (mouseX >= 880 && mouseX <= 880 + 35 && mouseY >= 240 && mouseY <= 240 + 10) {
      currState = "MA"; // Massachusetts
      println("Massachusetts");
    } else if (mouseX >= 654 && mouseX <= 654 + 65 && mouseY >= 228 && mouseY <= 228 + 65) {
      currState = "MI"; // Michigan
      println("Michigan");
    } else if (mouseX >= 487 && mouseX <= 487 + 63 && mouseY >= 153 && mouseY <= 153 + 100) {
      currState = "MN"; // Minnesota
      println("Minnesota");
    } else if (mouseX >= 590 && mouseX <= 590 + 53 && mouseY >= 482 && mouseY <= 482 + 65) {
      currState = "MS"; // Mississippi
      println("Mississippi");
    } else if (mouseX >= 523 && mouseX <= 523 + 60 && mouseY >= 360 && mouseY <= 360 + 65) {
      currState = "MO"; // Missouri
      println("Missouri");
    } else if (mouseX >= 207 && mouseX <= 207 + 150 && mouseY >= 130 && mouseY <= 130 + 80) {
      currState = "MT"; // Montana
      println("Montana");
    } else if (mouseX >= 392 && mouseX <= 392 + 94 && mouseY >= 296 && mouseY <= 296 + 50) {
      currState = "NE"; // Nebraska
      println("Nebraska");
    } else if (mouseX >= 86 && mouseX <= 86 + 90 && mouseY >= 278 && mouseY <= 278 + 69) {
      currState = "NV"; // Nevada
      println("Nevada");
    } else if (mouseX >= 886 && mouseX <= 886 + 30 && mouseY >= 213 && mouseY <= 213 + 20) {
      currState = "NH"; // New Hampshire
      println("New Hampshire");
    } else if (mouseX >= 859 && mouseX <= 859 + 20 && mouseY >= 285 && mouseY <= 285 + 35) {
      currState = "NJ"; // New Jersey
      println("New Jersey");
    } else if (mouseX >= 257 && mouseX <= 257 + 100 && mouseY >= 430 && mouseY <= 430 + 90) {
      currState = "NM"; // New Mexico
      println("New Mexico");
    } else if (mouseX >= 769 && mouseX <= 769 + 100 && mouseY >= 210 && mouseY <= 210 + 55) {
      currState = "NY"; // New York
      println("New York");
    } else if (mouseX >= 773 && mouseX <= 773 + 100 && mouseY >= 409 && mouseY <= 409 + 30) {
      currState = "NC"; // North Caroline
      println("North Caroline");
    } else if (mouseX >= 372 && mouseX <= 372 + 100 && mouseY >= 143 && mouseY <= 143 + 62) {
      currState = "ND"; // North Dekoda
      println("North Dekoda");
    } else if (mouseX >= 691 && mouseX <= 691 + 65 && mouseY >= 309 && mouseY <= 309 + 35) {
      currState = "OH"; // Ohio
      println("Ohio");
    } else if (mouseX >= 425 && mouseX <= 425 + 93 && mouseY >= 420 && mouseY <= 420 + 56) {
      currState = "OK"; // Oklahoma
      println("Oklahoma");
    } else if (mouseX >= 20 && mouseX <= 20 + 120 && mouseY >= 171 && mouseY <= 171 + 65) {
      currState = "OR"; // Oregon
      println("Oregon");
    } else if (mouseX >= 767 && mouseX <= 767 + 84 && mouseY >= 284 && mouseY <= 284 + 30) {
      currState = "PA"; // Pennsylvania
      println("Pennsylvania");
    } else if (mouseX >= 920 && mouseX <= 920 + 45 && mouseY >= 270 && mouseY <= 270 + 30) {
      currState = "RI"; // Rhode Island
      println("Rhode Island");
    } else if (mouseX >= 759 && mouseX <= 759 + 50 && mouseY >= 450 && mouseY <= 450 + 30) {
      currState = "SC"; // South Carolina
      println("South Carolina");
    } else if (mouseX >= 367 && mouseX <= 367 + 115 && mouseY >= 214 && mouseY <= 214 + 60) {
      currState = "SD"; // South Dakota
      println("South Dakota");
    } else if (mouseX >= 621 && mouseX <= 621 + 86 && mouseY >= 428 && mouseY <= 428 + 26) {
      currState = "TN"; // Tennessee
      println("Tennessee");
    } else if (mouseX >= 180 && mouseX <= 180 + 80 && mouseY >= 312 && mouseY <= 312 + 80) {
      currState = "UT"; // Utah
      println("Utah");
    } else if (mouseX >= 864 && mouseX <= 864 + 30 && mouseY >= 192 && mouseY <= 192 + 15) {
      currState = "VT"; // Vermont
      println("Vermont");
    } else if (mouseX >= 786 && mouseX <= 786 + 60 && mouseY >= 360 && mouseY <= 360 + 35) {
      currState = "VA"; // Virginia
      println("Virginia");
    } else if (mouseX >= 51 && mouseX <= 51 + 110 && mouseY >= 95 && mouseY <= 95 + 60) {
      currState = "WA"; // Washington
      println("Washington");
    } else if (mouseX >= 873 && mouseX <=873 + 98 && mouseY >= 370 && mouseY <= 370 + 30) {
      currState = "VA"; // Washington DC
      println("Washington DC");
    } else if (mouseX >= 740 && mouseX <= 740 + 45 && mouseY >= 347 && mouseY <= 347 + 30) {
      currState = "WV"; // West Virginia
      println("West Virginia");
    } else if (mouseX >= 559 && mouseX <= 559 + 76 && mouseY >= 225 && mouseY <= 225 + 30) {
      currState = "WI"; // Wisconsin
      println("Wisconsin");
    } else if (mouseX >= 249 && mouseX <= 249 + 100 && mouseY >= 235 && mouseY <= 235 + 78) {
      currState = "WY"; // Wyoming
      println("Wyoming");
  }
}
