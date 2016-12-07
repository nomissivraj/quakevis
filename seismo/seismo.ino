int xMax = 335;
int xrest = 330;
int xMin = 325; 

int yMax = 272;
int yrest = 267;
int yMin = 262;

int zMax = 350;
int zrest = 343;
int zMin = 338;

void setup() {
  pinMode(0, INPUT);    // Set pin 0 to be an input
  pinMode(1, INPUT);    // Set pin 0 to be an input
  pinMode(2, INPUT);    // Set pin 0 to be an input
  Serial.begin(9600);   // Start up serial communication at 9600 speed
}

void loop() {
  int readingX = analogRead(0);    // Read the current value of X from accelerometer
  int readingY = analogRead(1);    // Read the current value of Y from accelerometer
  int readingZ = analogRead(2);    // Read the current value of Z from accelerometer
  
  int diffX = readingX - xrest; // Try as if statement if ( diffX is minus then etc)
  diffX = abs(diffX);
  int diffY = readingY - yrest;
  diffY = abs(diffY);
  int diffZ = readingZ - zrest;
  diffZ = abs(diffZ);
  int diff = diffX + diffY +diffZ;
  
  if (readingX > xMax || readingX < xMin || readingY > yMax || readingY < yMin || readingZ > zMax || readingZ < zMin ){
    Serial.print(readingX);
    Serial.print(",");
    Serial.print(readingY);
    Serial.print(",");
    Serial.print(readingZ);
    Serial.print(",");
    Serial.print(diff); //Serial.print(readingY + readingY + readingZ);
    Serial.print("\n");
    delay(50);// Wait for a short time, just to slow things a little
  }
}
