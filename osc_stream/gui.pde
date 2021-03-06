/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void btn_start_click(GButton source, GEvent event) { //_CODE_:btn_start:431744:
  println("btn_start - GButton >> GEvent." + event + " @ " + millis());
  started = true;
  // load the first image
  removeGUI();
  img = loadImage("img\\0.jpg");
  image(img,0,0);
} //_CODE_:btn_start:431744:

public void btn_close_click(GButton source, GEvent event) { //_CODE_:btn_close:208199:
  println("btn_close - GButton >> GEvent." + event + " @ " + millis());
  exit();
} //_CODE_:btn_close:208199:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Pick-a-Fig");
  lbl_1 = new GLabel(this, 566, 198, 39, 35);
  lbl_1.setOpaque(true);
  lbl_0 = new GLabel(this, 509, 261, 40, 37);
  lbl_0.setLocalColorScheme(GCScheme.RED_SCHEME);
  lbl_0.setOpaque(true);
  lbl_2 = new GLabel(this, 648, 198, 39, 36);
  lbl_2.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  lbl_2.setOpaque(true);
  lbl_3 = new GLabel(this, 705, 261, 40, 39);
  lbl_3.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  lbl_3.setOpaque(true);
  lbl_check = new GLabel(this, 511, 113, 240, 69);
  lbl_check.setText("Check that all electrodes are connected");
  lbl_check.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lbl_check.setOpaque(true);
  btn_start = new GButton(this, 559, 360, 136, 74);
  btn_start.setText("START");
  btn_start.setTextBold();
  btn_start.setLocalColorScheme(GCScheme.RED_SCHEME);
  btn_start.addEventHandler(this, "btn_start_click");
  lbl_title = new GLabel(this, 31, 29, 1221, 68);
  lbl_title.setText("Are YOU a future engineer?");
  lbl_title.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lbl_title.setOpaque(false);
  lbl_percent = new GLabel(this, 29, 49, 1224, 93);
  lbl_percent.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  lbl_percent.setOpaque(false);
  lbl_verdict = new GLabel(this, 30, 166, 1222, 99);
  lbl_verdict.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  lbl_verdict.setOpaque(false);
  btn_close = new GButton(this, 559, 318, 137, 67);
  btn_close.setText("CLOSE");
  btn_close.setTextBold();
  btn_close.setLocalColorScheme(GCScheme.RED_SCHEME);
  btn_close.addEventHandler(this, "btn_close_click");
}

// Variable declarations 
// autogenerated do not edit
GLabel lbl_1; 
GLabel lbl_0; 
GLabel lbl_2; 
GLabel lbl_3; 
GLabel lbl_check; 
GButton btn_start; 
GLabel lbl_title; 
GLabel lbl_percent; 
GLabel lbl_verdict; 
GButton btn_close; 