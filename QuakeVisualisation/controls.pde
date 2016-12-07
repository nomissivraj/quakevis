boolean SJHover = false;
boolean OSHover = false;
boolean CPHover = false;
boolean SWHover = false;
boolean IUHover = false;

PImage SJstate1;
PImage SJstate2;
PImage OSstate1;
PImage OSstate2;
PImage CPstate1;
PImage CPstate2;
PImage SWstate1;
PImage SWstate2;
PImage IUstate1;
PImage IUstate2;

void controlUI() {
  imageMode(CORNER);

  //image(SJstate1, -30, -30, 138, 44);
  // SJ BUTTON
  if (mouseX >= 60 && mouseX <= 198 && mouseY >= 40 && mouseY <= 84 ) {
    cursor(HAND);
    SJHover = true;
    image(SJstate1, 60, 40, 138, 44);
  } else {
    cursor(CROSS);
    image(SJstate2, 60, 40, 138, 44);
  }

  // OS BUTTON
  if (mouseX >= 198 && mouseX <= 335 && mouseY >= 40 && mouseY <= 84 ) {
    cursor(HAND);
    OSHover = true;
    image(OSstate1, 198, 40, 138, 44);
  } else {
    image(OSstate2, 198, 40, 138, 44);
  }

  //CP BUTTON
  if (mouseX >= 336 && mouseX <= 472 && mouseY >= 40 && mouseY <= 84 ) {
    cursor(HAND);
    CPHover = true;
    image(CPstate1, 335, 40, 138, 44);
  } else {
    image(CPstate2, 335, 40, 138, 44);
  }

  //SW BUTTON
  if (mouseX >= 473 && mouseX <= 611 && mouseY >= 40 && mouseY <= 84 ) {
    cursor(HAND);
    SWHover = true;
    image(SWstate1, 473, 40, 138, 44);
  } else {
    image(SWstate2, 473, 40, 138, 44);
  }

  //IU BUTTON
  if (mouseX >= 612 && mouseX <= 750 && mouseY >= 40 && mouseY <= 84 ) {
    cursor(HAND);
    IUHover = true;
    image(IUstate1, 611, 40, 138, 44);
  } else {
    image(IUstate2, 611, 40, 138, 44);
  }
}

