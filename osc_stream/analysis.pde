// Parameters
int NUM_IMAGES = 10;
int NUM_PTS = 50;

// Variables
String alpha[][];
String beta[][];
String theta[][];
int timeStep_a; int timeStep_b; int timeStep_t;
String isGood_a[][]; String isGood_b[][]; String isGood_t[][];
String averages[][];
String ending_average[][];
float useful_values[];
int curr_img = 0;

// store alpha scores in a text file
void alpha_store(OscMessage msg) {
  if (timeStep_a < NUM_PTS) {
    if (msg.checkAddrPattern("/muse/elements/is_good") == true) { 
      for(int i = 0; i < 4; i++) {
          isGood_a[i][timeStep_a] = str(msg.get(i).intValue());
      }
    }
    if (msg.checkAddrPattern("/muse/elements/alpha_session_score") == true) {
      for(int i = 0; i < 4; i++) {
        alpha[i][timeStep_a] = str(msg.get(i).floatValue());
      }
      timeStep_a++;
    }
  }
}

// store beta scores in a text file
void beta_store(OscMessage msg) {
  if (timeStep_b < NUM_PTS) {
    if (msg.checkAddrPattern("/muse/elements/is_good") == true) {
        for(int i = 0; i < 4; i++) {
          isGood_b[i][timeStep_b] = str(msg.get(i).intValue());
        }
    }
    if (msg.checkAddrPattern("/muse/elements/beta_session_score") == true) {
      for(int i = 0; i < 4; i++) {
        beta[i][timeStep_b] = str(msg.get(i).floatValue());
      }
      timeStep_b++;
    }
  }
}

// store theta scores in a text file
void theta_store(OscMessage msg) {
  if (timeStep_t < NUM_PTS) {
    if (msg.checkAddrPattern("/muse/elements/is_good") == true) {
        for(int i = 0; i < 4; i++) {
          isGood_t[i][timeStep_t] = str(msg.get(i).intValue());
        }
    }
    if (msg.checkAddrPattern("/muse/elements/theta_session_score") == true) {
      for(int i = 0; i < 4; i++) {
        theta[i][timeStep_t] = str(msg.get(i).floatValue());
      }
      timeStep_t++;
    }
  }
}

// calculate the average value for each of the wave types
// ignore electrodes which were not connected properly
void calculate_averages() {
  for (int i=0; i<NUM_PTS; i++) {
    useful_values = new float[4];
    int cnt = 0;
    for (int j=0; j<4; j++) {
      if (int(isGood_a[j][i]) == 1) {
        useful_values[cnt] = (float(alpha[j][i]));
        cnt++;
      }
    }
    float sum = 0.0F;
    if (cnt > 0) {
      for (int k=0; k<cnt; k++) {
        sum += useful_values[k];
      }
      averages[0][i] = str(sum/float(cnt));
    }
    else {
      averages[0][i] = null;
    }
  }
  
  for (int i=0; i<NUM_PTS; i++) {
    useful_values = new float[4];
    int cnt = 0;
    for (int j=0; j<4; j++) {
      if (int(isGood_b[j][i]) == 1) {
        useful_values[cnt] = (float(beta[j][i]));
        cnt++;
      }
    }
    float sum = 0.0F;
    if (cnt > 0) {
      for (int k=0; k<cnt; k++) {
        sum += useful_values[k];
      }
      averages[1][i] = str(sum/float(cnt));
    }
    else {
      averages[1][i] = null;
    }
  }
  
  for (int i=0; i<NUM_PTS; i++) {
    useful_values = new float[4];
    int cnt = 0;
    for (int j=0; j<4; j++) {
      if (int(isGood_t[j][i]) == 1) {
        useful_values[cnt] = (float(theta[j][i]));
        cnt++;
      }
    }
    float sum = 0.0F;
    if (cnt > 0) {
      for (int k=0; k<cnt; k++) {
        sum += useful_values[k];
      }
      averages[2][i] = str(sum/float(cnt));
    }
    else {
      averages[2][i] = null;
    }
  }
 //<>// //<>//
}


void ending_average() {
  ending_average = new String[3][NUM_IMAGES];
  
  for (int i=0; i<NUM_IMAGES; i++) {
    String[] temp_arr = new String[NUM_PTS];
    temp_arr = loadStrings("img"+str(i)+"\\"+"average_a.txt");
    float sum = 0.0F;
    for (int j=NUM_PTS-20; j<NUM_PTS; j++) {
      sum += float(temp_arr[j]);
    }
    ending_average[0][i] = str(sum/20.0);
  }
  
  for (int i=0; i<NUM_IMAGES; i++) {
    String[] temp_arr = new String[NUM_PTS];
    temp_arr = loadStrings("img"+str(i)+"\\"+"average_b.txt");
    float sum = 0.0F;
    for (int j=NUM_PTS-20; j<NUM_PTS; j++) {
      sum += float(temp_arr[j]);
    }
    ending_average[1][i] = str(sum/20.0);
  }
  
  for (int i=0; i<NUM_IMAGES; i++) {
    String[] temp_arr = new String[NUM_PTS];
    temp_arr = loadStrings("img"+str(i)+"\\"+"average_t.txt");
    float sum = 0.0F;
    for (int j=NUM_PTS-20; j<NUM_PTS; j++) {
      sum += float(temp_arr[j]);
    }
    ending_average[2][i] = str(sum/20.0);
  }
  
  saveStrings("end_avg_a.txt",ending_average[0]);
  saveStrings("end_avg_b.txt",ending_average[1]);
  saveStrings("end_avg_t.txt",ending_average[2]);
}

void calc_results() {
  
}