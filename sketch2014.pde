/*
ODE-TO-SHIBORI
==============

A coded tribute to the traditional Japanese tie-dyeing technique, this is a processing sketch.




SHIBORI is about: mathematical patterns, constraint, 
subtle imperfections and experimentation.

This is an (C)ODE to SHIBORI.
*/


/*
CLICK TO MAKE A PATTERN

press 0 or 1 or 2 or 3 to get different sizes and results

press (g)reen or (p)ink  or (w)hite to change color

(s) to save


VARIABLES:
_

SIZE OF RADIAL SHAPE
NUMBER OF SPOKES
SHAPE USED
DISSIPATION
LOCATION

*/



int trepetition = 24;
int clicks;
int photo;
float scalar;

shibori[] inks = new shibori[trepetition];

shibori[] inks1 = new shibori[trepetition];

shibori[] inks2 = new shibori[trepetition];

shibori[] inks3 = new shibori[trepetition];


void setup () {

  size (1000, 800);
  background(5,5, 30);
  //background(220);

  for (int i = 0; i<inks.length; i++) {

    inks[i] = new shibori();

    inks1[i] = new shibori();

    inks2[i] = new shibori();

    inks3[i] = new shibori();
  }
}


void draw () {



  if (mousePressed == true) {


    float angle = (TWO_PI/(trepetition/scalar));

    pushMatrix();

    translate(mouseX, mouseY);


    //inks
    if (clicks==0) {
      scalar=8;
      for (int i = 0; i<inks.length/scalar; i++) {
        rotate(angle+(random(0.2)));
        inks[i].ink(2);
      }
    }

    //inks1
    if (clicks==1) {
      scalar=6;
      for (int i = 0; i<inks.length/scalar; i++) {
        rotate(angle+(random(0.2)));
        inks1[i].ink(2);
      }
    }

    //inks2
    if (clicks==2) {
      scalar = 3;
      for (int i = 0; i<inks.length/scalar; i++) {
        rotate(angle+(random(0.2)));
        inks2[i].ink(random(2, 4));
      }
    }

    //inks3
    if (clicks==3) {
      scalar = 2;
      for (int i = 0; i<inks.length/scalar; i++) {
        rotate(angle+(random(0.2)));
        inks3[i].ink(3);
      }
    }



    popMatrix();
  }
  if (keyPressed) {
    if (key=='S'||key=='s') {
      
      text("_shiborized",20, height-30);
      saveFrame("shibori-######.jpeg");
      photo++;
      
      
    }


    if (key=='0') {
      clicks = 0;
    }

    if (key=='1') {
      clicks = 1;
    }

    if (key=='2') {
      clicks = 2;
    }

    if (key=='3') {
      clicks = 3;
    }
  }


  println(clicks);
}




class shibori {
  float diam = 20;
  //float speed = 0.5; 
  float x;
  float y;
  int counter=0;
  float freedomX;
  float freedomY;
  int opacity;
  float size;
  shibori() {
    //x = tempX;

    x=0;
    y =10;
  }
  void ink(float tempsize) {
    size = tempsize;
    int control = 200;
    if (counter<control) {
      freedomX = map(counter, 0, control, 0, 0.5);

      opacity = int(map(counter, 0, control, 200, 0));
      x+=random(-freedomX, freedomX)*size;

      y+=0.5*size;
      strokeWeight(5*(size/2));
      color green= color(random(200, 255), random(210, 255), random(2, 255));
      color pink= color(random(250, 255), random(0, 255), random(127, 255));
      color white= color(random(180, 255), random(180, 255), random(180, 255));
      
     
    if (key=='G'||key=='g') {
      stroke(green, opacity);
    }
      if (key=='P'||key=='p') {
      stroke(pink, opacity);
    }
    if (key=='W'||key=='w') {
      stroke(white, opacity);
    }
    
      line(x-size, y, x+size, y);
    }
    counter++;
  }
}
