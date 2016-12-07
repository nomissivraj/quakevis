void keyReleased() {
  switch (key) {
  case 't':
    if (displayType) displayType = false;
    else if (!displayType) displayType = true;
  }


  if (key == 'p') {
    if (looping) noLoop();
    else        loop();
  }
}// This is on memory stick
