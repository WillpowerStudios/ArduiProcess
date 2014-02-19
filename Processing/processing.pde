/* ArduiProcess -- PROCESSING
   
   created 30 Aug 2011
   by WillPower

   Basic UltraSound - Arduino 
   The farther my hand it the bigger the circle
 
   This example code is in the public domain.

 */
  
import processing.serial.*;
import cc.arduino.*;

Serial myPort;  // Create object from Serial class
int val;     // Data received from the serial port
String valu;
float howBig;


PFont mono;

void setup() {
  size( 800,800 );
  background( 0 );
  smooth();
  cursor( CROSS );
  
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  
  

  
}

void draw() {
  
  fill( 0,21 );
  rect( 0,0,width,height);
  
  if ( myPort.available() > 0) 
  {  // If data is available,
  //val = myPort.read();
  valu = myPort.readStringUntil('\n');   // read it and store it in val
  
    //println(valu);
   if(valu != null)
    val = int(trim(valu));
    println( val );
} 
 
    
  noStroke();
  
  if ( val > 1 ) howBig = 1;
  if ( val > 10 ) howBig = 20;
  if ( val > 20 ) howBig = 40;
  if ( val > 30 ) howBig = 60;
  if ( val > 40 ) howBig = 80;
  if ( val > 50 ) howBig = 100;
  if ( val > 60 ) howBig = 120;
  if ( val > 70 ) howBig = 140;
  if ( val > 80 ) howBig = 160;
  if ( val > 90 ) howBig = 180;
  if ( val > 100 ) howBig = 200;
  if ( val > 110 ) howBig = 220;
  if ( val > 120 ) howBig = 240;
  if ( val > 130 ) howBig = 260;
  if ( val > 140 ) howBig = 280;
  if ( val > 150 ) howBig = 300;
  if ( val > 160 ) howBig = 320;
  if ( val > 170 ) howBig = 340;
  if ( val > 180 ) howBig = 360;
  if ( val > 190 ) howBig = 380;
  if ( val > 200 ) howBig = 400;
  if ( val > 210 ) howBig = 600;
  
  fill( #02F2F0 );
  ellipse( width/2,height/2,howBig,howBig );
  
  //println( val ); //print it out in the console
  //println( valu ); //print it out in the console
  
  
  
  fill( 255 );
  textSize(27);
  text( val,10,30 );
  
  
 }
 
 