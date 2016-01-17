import g4p_controls.*;
import java.awt.Font;
import netP5.*;
import oscP5.*;

// OSC parameters
int recvPort = 5000;
OscP5 oscP5;

void setup() {
  size(1280,720);
  createGUI();
  lbl_title.setFont(new Font("Monospaced", Font.PLAIN, 36));
  btn_close.setVisible(false);
  frameRate(60);
  
  // listen for incoming messages
  oscP5 = new OscP5(this, recvPort);
  background(255); // black background
  
  // Other variables and parameters
  alpha = new String[4][NUM_PTS];
  beta = new String[4][NUM_PTS];
  theta = new String[4][NUM_PTS];
  timeStep_a = 0; timeStep_b = 0; timeStep_t = 0;
  isGood_a = new String[4][NUM_PTS];
  isGood_b = new String[4][NUM_PTS];
  isGood_t = new String[4][NUM_PTS];
  averages = new String[3][NUM_PTS];
  started = false;
}

// save EEG session scores in arrays
void oscEvent(OscMessage msg) {
  if (started) {
    alpha_store(msg);
    beta_store(msg);
    theta_store(msg);      
  }
  else {
    int[] isGood = new int[4];
    if (msg.checkAddrPattern("/muse/elements/is_good") == true) {
        for(int i = 0; i < 4; i++) {
          isGood[i] = msg.get(i).intValue();
        }
        
        update_electrodes(isGood);
        
    }
  }
}