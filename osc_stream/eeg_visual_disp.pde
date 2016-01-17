PImage img;
boolean started;

void draw() { 
  // If data for the current image has been collected, save to file
  if ((timeStep_a+timeStep_b+timeStep_t) == (3*NUM_PTS)) {
    saveFiles();
    curr_img++;
    // if all the images are done, exit program
    if (curr_img == NUM_IMAGES) {
      ending_average();
      calc_results();
    }
    timeStep_a = 0; timeStep_b = 0; timeStep_t = 0; // reset for the next image
    
    if (curr_img <= NUM_IMAGES) {
      change_image(); // bring the next image
    }
  }
}

void saveFiles() {
  
  System.out.println("Saving data...");
  
  String path = "img" + str(curr_img) + "\\";  
  for(int i=0; i<4; i++) {
    saveStrings(path+"alpha"+str(i)+".txt",alpha[i]);
    saveStrings(path+"beta"+str(i)+".txt",beta[i]);
    saveStrings(path+"theta"+str(i)+".txt",theta[i]);
    //saveStrings(path+"isGood_a"+str(i)+".txt",isGood_a[i]);
    //saveStrings(path+"isGood_b"+str(i)+".txt",isGood_b[i]);
    //saveStrings(path+"isGood_t"+str(i)+".txt",isGood_t[i]);      
  }
  
  calculate_averages();
  saveStrings(path+"average_a.txt",averages[0]);
  saveStrings(path+"average_b.txt",averages[1]);
  saveStrings(path+"average_t.txt",averages[2]);
  
  System.out.println("Data saved!");
  
}

void change_image() {
  img = loadImage("img\\"+str(curr_img)+".jpg");
  image(img,0,0);
}

void removeGUI() {
  lbl_0.setVisible(false);
  lbl_1.setVisible(false);
  lbl_2.setVisible(false);
  lbl_3.setVisible(false);
  lbl_check.setVisible(false);
  lbl_title.setVisible(false);
  btn_start.setVisible(false);
}

void update_electrodes(int[] isGood) {  
  lbl_0.setText(str(isGood[0]));
  lbl_1.setText(str(isGood[1]));
  lbl_2.setText(str(isGood[2]));
  lbl_3.setText(str(isGood[3]));
}

void display_results(float avg) {
  String verdict = new String();
  if (avg>=0 && avg<.25) {
    verdict = "Engineering might not be for you";
  }
  else if (avg>=0.25 && avg<0.5) {
    verdict = "You might be interested in Engineering";
  }
  else if (avg>=0.5 && avg<0.75) {
    verdict = "You should consider Engineering as a career";
  }
  else {
    verdict = "You were made for Engineering";
  }
  
  background(255);
  lbl_percent.setText("Your percentage interest in Engineering is " + str(int(avg*100))+"%");
  lbl_percent.setVisible(true);
  lbl_percent.setFont(new Font("Monospaced", Font.PLAIN, 36));
  lbl_verdict.setText(verdict);
  lbl_verdict.setVisible(true);
  lbl_verdict.setFont(new Font("Monospaced", Font.PLAIN, 36));
  btn_close.setVisible(true);
}