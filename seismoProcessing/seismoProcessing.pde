import ddf.minim.*;
import processing.serial.*;

String serialPortName = "/dev/cu.usbmodem14631"; // at uni /dev/cu.usbmodem14631 at home COM4
Serial arduino;
Minim minim;
AudioPlayer wallSound, batSound;

String[] messageArray;

// PHANT UPLOAD
String publicKey = "9JN8Xv5zn2cr6OJmp1D4";
String privateKey = "xzK7xGEVN6t4p5a0zybX";
String baseURL = "http://data.sparkfun.com/input/";

void setup()
{
  size(500, 500);
  if (serialPortName.equals("")) scanForArduino();
  else arduino = new Serial(this, serialPortName, 9600);
  
}



void draw()
{
  background(0);
  text("SEISMO", 10, 20);
  
  // IF STATEMENT 
  if ((arduino != null) && (arduino.available()>0)) {
    String message = arduino.readStringUntil('\n');
    if (message != null) {
      //int value = int(message.trim());
      messageArray = message.split(","); // messageArray[0] = x [1] = y and [2] = z and [3] = magnitude/strength
      println(" X: " +messageArray[0] +" | Y: " +messageArray[1] +" | Z: " +messageArray[2] +" | Strength: " +messageArray[3]);
      loadStrings(baseURL + publicKey + "?private_key=" + privateKey + "&xaxis=" +messageArray[0] + "&yaxis=" +messageArray[1] + "&zaxis=" +messageArray[2] + "&mag=" +messageArray[3]);
    }
  }
}

  void stop()
  {
    arduino.stop();
  }

  void scanForArduino()
  {
    try {
      for (int i=0; i<Serial.list ().length; i++) {
        if (Serial.list()[i].contains("tty.usb")) {
          arduino = new Serial(this, Serial.list()[i], 9600);
        }
      }
    } 
    catch(Exception e) {
      // println("Cannot connect to Arduino !");
    }
  }

