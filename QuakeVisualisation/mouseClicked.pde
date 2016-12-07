void mouseClicked() {

  //CHANGE VISUALISATION
  if (mouseX >= 60 && mouseX <= 107 && mouseY >= 635 && mouseY <= 655) {
    displayType = !displayType;
  }

  // SJ BUTTON

  if (mouseX >= 60 && mouseX <= 198 && mouseY >= 40 && mouseY <= 84) {
    irisStart = false;
    start = true;
    blue = true;
    orange = false;
    NetworkID = "SJ";

    i=0;
    db.query("SELECT * FROM Information WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      baseURL = db.getString("URL"); ///// get url
      station = db.getString("Station");
      readings = loadJSONArray(baseURL +".json");
    }

    db.query("SELECT * FROM Identification WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      channelX = db.getString("ChannelX");
      channelY = db.getString("ChannelY");
      channelZ = db.getString("ChannelZ");
      channelM = db.getString("ChannelM");
    }
    i++;
    if (i == readings.size()) {
      i = 0;
    }
  }

  // OS BUTTON
  if (mouseX >= 198 && mouseX <= 335 && mouseY >= 40 && mouseY <= 84 ) {
    irisStart = false;
    start = true;
    // background color
    orange = true;
    blue = false;
    green = false;
    purple = false;
    grey = false;
    NetworkID = "OS";
    i=0;
    db.query("SELECT * FROM Information WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      baseURL = db.getString("URL"); ///// get url
      station = db.getString("Station");
      readings = loadJSONArray(baseURL +".json");
    }

    db.query("SELECT * FROM Identification WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      channelX = db.getString("ChannelX");
      channelY = db.getString("ChannelY");
      channelZ = db.getString("ChannelZ");
      channelM = db.getString("ChannelM");
    }
    i++;
    if (i == readings.size()) {
      i = 0;
    }
  }

  // CP BUTTON
  if (mouseX >= 336 && mouseX <= 472 && mouseY >= 40 && mouseY <= 84) {
    irisStart = false;
    start = true;
    blue = false;
    orange = false;
    green = true;
    purple = false;
    grey = false;
    NetworkID = "CP";
    i=0;
    db.query("SELECT * FROM Information WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      baseURL = db.getString("URL"); ///// get url
      station = db.getString("Station");
      readings = loadJSONArray(baseURL +".json");
    }

    db.query("SELECT * FROM Identification WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      channelX = db.getString("ChannelX");
      channelY = db.getString("ChannelY");
      channelZ = db.getString("ChannelZ");
      channelM = db.getString("ChannelM");
    }
    i++;
    if (i == readings.size()) {
      i = 0;
    }
  }

  // SW BUTTON
  if (mouseX >= 473 && mouseX <= 611 && mouseY >= 40 && mouseY <= 84) {
    irisStart = false;
    start = true;
    blue = false;
    orange = false;
    green = false;
    purple = true;
    grey = false;
    NetworkID = "SW";
    i=0;
    db.query("SELECT * FROM Information WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      baseURL = db.getString("URL"); ///// get url
      station = db.getString("Station");
      readings = loadJSONArray(baseURL +".json");
    }

    db.query("SELECT * FROM Identification WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      channelX = db.getString("ChannelX");
      channelY = db.getString("ChannelY");
      channelZ = db.getString("ChannelZ");
      channelM = db.getString("ChannelM");
    }
    i++;
    if (i == readings.size()) {
      i = 0;
    }
  }

  // IU BUTTON
  if (mouseX >= 612 && mouseX <= 750 && mouseY >= 40 && mouseY <= 84) {
    irisStart = true;
    start = false;
    blue = false;
    orange = false;
    green = false;
    purple = false;
    grey = true;
    NetworkID = "IU";
    f = 1;
    db.query("SELECT * FROM Information WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      baseURL = db.getString("URL"); ///// get url
      station = db.getString("Station");
      irisData = loadStrings(baseURL);
    }
    db.query("SELECT * FROM Identification WHERE Network='"+ NetworkID +"';");
    while (db.next ()) {
      channelX = db.getString("ChannelX");
    }
    /*f++;
     if (f == irisData.length) {
     f = 1;
     }*/
  }
}
