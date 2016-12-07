void draw() {  

  translate(50, 130);
  r = int(random(50));
  if (blue == true) {
    fill(186, 204, 227, 20);
  }  
  if (orange == true) {
    fill(242, 170, 87, 20);
  }
  if (green == true) {
    fill(138, 219, 154, 20);
  }
  if (purple == true) {
    fill(187, 155, 196, 20);
  }
  if (grey == true) {
    fill(214, 214, 214, 20);
  }
  if (r < 25) {
    noStroke();
  } else {
    stroke(255, 90);
    noFill();
  }

  noStroke();
  rect(0, 0, 900, 500 ); // window


  imageMode(CENTER);


  if (start == true) { // if Source is JSON
    next = readings.getJSONObject(i);

    if (displayType == true) {
      if (millis() - time1 >= delayTime1) {
        magnitude = next.getFloat("mag");
        x = next.getFloat("xaxis");
        y = next.getFloat("xaxis");
        z = next.getFloat("xaxis");
        time1 = millis();
      }
    } else if (displayType == false) {
      magnitude = next.getFloat("mag")*2;
    }
  }


  if (irisStart == true) {
    if (f < irisData.length-1) {
      f++;
    } else {
      f=1;
    }

    irisDataSplit = irisData[f].split("  "); 
    if (displayType == true) {
      if (millis() - time2 >= delayTime2) {
        magnitude = abs(float(irisDataSplit[1])/1000);
        time2 = millis();
      }
    } else if (displayType == false) {
      magnitude = abs(float(irisDataSplit[1])/1000);
    }
    //println(irisData[i]);
  }

  /////////////////////////////// Draw visualisation below

  if (displayType == true) {

    if (magnitude < 100 && magnitude > 0 ) {
      fill(127, 138, 220, 90);
    } 
    if (magnitude < 200 && magnitude > 100 ) {
      fill(127, 138, 220, 110);
    } 
    if (magnitude < 300 && magnitude > 200 ) {
      fill(127, 138, 230, 150);
    } 
    if (magnitude < 400 && magnitude > 300 ) {
      fill(127, 138, 255, 200);
    } else if (NetworkID == "IU") {
      fill(255);
    }


    if (millis() - time >= delayTime) {

      ellipse(random(900), random(500), magnitude/2, magnitude/2);
      //println(magnitude);
      time = millis();
    }// end millis
  }
  if (start == true) {
    i++;
    if (i == readings.size()) {
      i = 0;
    }
  }


  if (NetworkID == "SJ") {
    networkFull = "Simon Jarvis Net";
    stationFull = " Great Yarmouth";
  }
  if (NetworkID == "OS") {
    networkFull = "Oliver Smith Net";
    stationFull = " Cheltenham";
  }
  if (NetworkID == "CP") {
    networkFull = "Charlotte Price Net";
    stationFull = " Shrewsbury";
  }
  if (NetworkID == "SW") {
    networkFull = "Sam Wheeler Net";
    stationFull = " Plymouth";
  }
  if (NetworkID == "IU") {
    networkFull = "IRIS Net";
    stationFull = " Scott Base";
  }


  //overlay and text
  translate(-50, -130);

  //MAKE FRAME
  fill(90);
  rect(0, 0, 1280, 130); // top frame
  rect(950, 130, 330, 590); // right frame
  rect(50, 630, 1230, 90); //bottom frame
  rect(0, 130, 50, 590); //left frame


  controlUI(); // BUTTONS

  // TEXT AND STUFF
  if (start == true) {
    source = "Arduino";
  } else {
    source = "IRIS Data";
  }

  if (start == false && irisStart == false) {
    chooseNet = "PLEASE SELECT A NETWORK";
    dataSize = "Sample data size: no data";
    fill(255);
    textSize(20);
    text(chooseNet, 90, 30);
  } 



  if (start == true || irisStart == true) {
    fill(255);
    textSize(20);
    text("Network: " +networkFull, 970, 150);
    text("Quake strength: " +magnitude, 970, 180);
    text("Data origin: " +source, 970, 210);
    text("Station: " +station +" - " +stationFull, 970, 240);
    if (start == true && irisStart == false) {
      text("Channels: " +channelX +", " +channelY +", "+channelZ +", "+channelM, 970, 270);
    } else if (start == false && irisStart == true) {
      text("Channels: " +channelX, 970, 270);
    }

    if (start == true && irisStart == false) {
      text("X: " +x +" | Y: " +y +" | Z: " +z, 970, 300);
    }

    fill(200);
    chooseNet = "TRY ANOTHER NETWORK";
    text(chooseNet, 90, 30);
    if (start == true && irisStart == false) {
      dataSize = "Sample data size: " +readings.size() +" readings";
    } else if (irisStart == true && start == false) {
      dataSize = "Sample data size: " +irisData.length +" readings";
    }

    textSize(14);

    if (mouseX >= 60 && mouseX <= 107 && mouseY >= 635 && mouseY <= 655) {
      cursor(HAND);
      fill(255);
    } else {
      fill (50);
    }
    rect(50, 635, 47, 20); // display type change button
    fill(200);
    text("CLICK OR PRESS 'T' KEY TO CHANGE VISUALISATION", 54, 650);
    text(dataSize, 720, 650 );
    translate(495, 360);
    fill(80);
    rotate(millis() * 0.0001 * PI);
    rectMode(CENTER);
    if (displayType == false) {
      fill(255);
      rect(0, 0, magnitude, 2);
    }
    fill(200);
    rectMode(CORNER);
    translate(-450, -350);
  }
}
