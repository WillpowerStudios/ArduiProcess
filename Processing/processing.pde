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
int dist01,dist02;     // Data received from the serial port
String valu;
float howBig01,howBig02;
PFont mono;


void setup() {
  size( 800,800 );
  background( 0 );
  smooth();
  cursor( CROSS );
  
  // List all the available serial ports:
  println(Serial.list());
  //change the 0 to a 1 or 2 etc. to match your port
  String portName = Serial.list()[2]; 
  myPort = new Serial(this, portName, 9600);  
  // don't generate a serialEvent() until you get a newline character:
  myPort.bufferUntil('\n');
}


void draw() {
  
  fill( 0,11 );
  rect( 0,0,width,height);
  
  if ( myPort.available() > 0) {  // If data is available,
    //dist01 = myPort.read();
    valu = myPort.readStringUntil('\n');   // read it and store it in val 

    //println(valu);
    if(valu != null) {
     //dist01 = int(trim(valu));

    if(valu.indexOf("c1:") != -1) 
      dist01 = int(trim(valu.substring(3)));
      println("yo");
      println(dist01);


    if(valu.indexOf("c2:") != -1)
      dist02 = int(trim(valu.substring(3)));
      println("it works !");
      println(dist02);

    //println( valu );

    }
    
  }

  noStroke();

  howBig01 = dist01 * 2.5;
  
  fill( #02F2F0,100 );
  ellipse( width/2,height/2,howBig01,howBig01 );

  ////

  howBig02 = dist02 * 2.5;

  fill( #ff004f,100 );
  ellipse( width/2,height/2,howBig02,howBig02 );
  
  //println( val ); //print it out in the console
  //println( valu ); //print it out in the console
  
  fill( 255 );
  textSize(27);
  text( dist01,10,30 );
  text( dist02,100,30 );
  
 } 