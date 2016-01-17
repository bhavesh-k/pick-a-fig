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
      exit();
    }
    timeStep_a = 0; timeStep_b = 0; timeStep_t = 0; // reset for the next image
    
    change_image(); // bring the next image
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
  btn_start.setVisible(false);
}

void update_electrodes(int[] isGood) {  
  lbl_0.setText(str(isGood[0]));
  lbl_1.setText(str(isGood[1]));
  lbl_2.setText(str(isGood[2]));
  lbl_3.setText(str(isGood[3]));
}