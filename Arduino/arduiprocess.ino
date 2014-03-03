/* ArduiProcess -- PROCESSING
   
   Created 30 Aug 2011
   by WillPower

   Basic UltraSound - Arduino 
   The farther my hand it the bigger the circle
 
   This example code is in the public domain.

 */
 
 
 
 // knock
 
// these constants won't change:

const int knockSensor = A1; // the piezo is connected to analog pin 0
const int threshold = 150;  // threshold value to decide when the detected sound is a knock or not
const int micro = A0;

// these variables will change:
int sensorReading = 0;      // variable to store the value read from the sensor pin


 
 
 // ping

// this constant won't change.  It's the pin number
// of the sensor's output:
const int pingPin01 = 8;
const int pingPin02 = 4;

void setup() {
  // initialize serial communication:
  Serial.begin(9600);
}

void loop()
{
  // establish variables for duration of the ping, 
  // and the distance result in inches and centimeters:
  long duration, inches, cm;

  // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
  // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
  pinMode(pingPin01, OUTPUT);
  digitalWrite(pingPin01, LOW);
  delayMicroseconds(2);
  digitalWrite(pingPin01, HIGH);
  delayMicroseconds(5);
  digitalWrite(pingPin01, LOW);
  
  //
  
  // The same pin is used to read the signal from the PING))): a HIGH
  // pulse whose duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  pinMode(pingPin01, INPUT);
  duration = pulseIn(pingPin01, HIGH);
  
  // convert the time into a distance
  inches = microsecondsToInches(duration);
  cm = microsecondsToCentimeters(duration);

  //Serial.print("c1:");
  //Serial.println(cm);

  ///
  
  pinMode(pingPin02, OUTPUT);
  digitalWrite(pingPin02, LOW);
  delayMicroseconds(2);
  digitalWrite(pingPin02, HIGH);
  delayMicroseconds(5);
  digitalWrite(pingPin02, LOW);

  
  
  pinMode(pingPin02, INPUT);
  duration = pulseIn(pingPin02, HIGH);

  // convert the time into a distance
  inches = microsecondsToInches(duration);
  cm = microsecondsToCentimeters(duration);
  
  Serial.print("c2:");
  Serial.println(cm);

  
  //Serial.print(inches);
  //Serial.print("in, ");
  Serial.print(cm);
  //Serial.print("cm");
  Serial.println();
  
  delay(100);
  
  
  ///// KNOCK / FLASH
   // read the sensor and store it in the variable sensorReading:
  sensorReading = analogRead(knockSensor);  

  
  // if the sensor reading is greater than the threshold:
  if (sensorReading >= threshold) {

    // send the string "Knock!" back to the computer, followed by newline
    //Serial.println("Flash!");         
  }


  ///// KNOCK / MICROPHONE
   // read the sensor and store it in the variable sensorReading:
  sensorReading = analogRead(micro);    


  delay(100);  // delay to avoid overloading the serial port buffer
}



long microsecondsToInches(long microseconds) {
  // According to Parallax's datasheet for the PING))), there are
  // 73.746 microseconds per inch (i.e. sound travels at 1130 feet per
  // second).  This gives the distance travelled by the ping, outbound
  // and return, so we divide by 2 to get the distance of the obstacle.
  // See: http://www.parallax.com/dl/docs/prod/acc/28015-PING-v1.3.pdf
  return microseconds / 74 / 2;
}

long microsecondsToCentimeters(long microseconds) {
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}
