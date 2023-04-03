void textBox() {
  screen = "textBox";
  PFont  textBoxFont;
  textBoxFont = loadFont("Arial-BoldMT-15.vlw");
  //for text-box setup
  cp5 = new ControlP5(this);
  //cp5.addTextfield("carrier")
  Textfield textbox = cp5.addTextfield("Type in your Query") // have to put the parameters later on e.g what the user is allowed to type
    .setPosition((width-1120), 115)
    .setSize(350, 45)
    .setAutoClear(true);
  textbox.setColorBackground(color(0)); // Set background color to white
  textbox.setColorForeground(color(255, 0, 0)); // Set border and text color to blue

  textbox.setFont(textBoxFont);
  textbox.setColor(color(255, 255, 0));
}

void getTextInput() {
  // Update carrier value from textbox
  Textfield textbox = cp5.get(Textfield.class, "Type in your Query");
  if (textbox != null) {
    input = textbox.getText();
  }
}
