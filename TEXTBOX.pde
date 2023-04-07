void textBox() {
  //if (screen == "home")
  //screen = "textBox";
  //for text-box setup
  cp5 = new ControlP5(this);
  //cp5.addTextfield("carrier")
   textbox = cp5.addTextfield("Press 'TAB' to Hide/Show or 'clear' to clear") // have to put the parameters later on e.g what the user is allowed to type
    .setPosition(width/2 + 290, height*5/6-35)
    .setSize(375, 45)
    .setAutoClear(false);
  textbox.setColorBackground(color(0)); // Set background color to white
  textbox.setColorForeground(color(255, 0, 0)); // Set border and text color to blue

  textbox.setFont(screenFont);
  textbox.getCaptionLabel().setColor(color(255, 0, 0)); // set caption label
  
  if (showTextBox) {
    textbox.setVisible(true);
    println("noCheck");
  } else if(!showTextBox) {
    textbox.setVisible(false);
    println("check");
  }
}



void getTextInput() {
  // Update carrier value from textbox
  Textfield textbox = cp5.get(Textfield.class, "Press 'TAB' to Hide/Show or 'clear' to clear"); 
  if (textbox != null) {
    input = textbox.getText();
  }
  if (input.equals("clear" ) ){
   queryRequested = false; 
  }
}
