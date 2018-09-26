import processing.video.*;

Capture video;
boolean on = false;
PImage[] snowIMG = new PImage[15];
Snowflake[] snowStorm = new Snowflake[15];
PImage flake;
PImage sm;
int counter = 0;
float tempX;

void setup() {
  size(640, 360);
  video = new Capture(this, 640, 480, 30);
  video.start();
  startSnow();
}

void mousePressed() {
  if (on) {
    startSnow();
  }
  on = !on;
}

void draw() {
  if(video.available()) {
    video.read();
  }
  background(0);
  if (on) {
    image(video, 320, 180);
  } else {
    imageMode(CORNER);
    image(video, 0, 0); //must make case like this since the rotation needs imageMode(CENTER)
  }
  if (on) {
    snowFall();
  } else {
    noTint();
  }
}

void snowFall() {
  if (on) {
    tint(0,120,128);
    for (int i = 0; i < snowStorm.length; i++ ){
      snowStorm[i].descend();
      snowStorm[i].display();
    }
    
    sm = loadImage("snowman.png");
    sm.resize(100, 80);
    image(sm, 500, 300);
  }
}

void startSnow() {
  for (int i = 0; i < snowIMG.length; i++) {
    int index = int(random(1, 5));
    snowIMG[i] = loadImage("snowflake" + index + ".png");
  }
  
  for (int i = 0; i < snowStorm.length; i++) {
    if (100 + i *100 > 640) {
      tempX = 100.0 + (i%4 * 100.0);
    } else {
      tempX = 100.0+i*100.0;
    }
    snowStorm[i] = new Snowflake(snowIMG[i], tempX, random(0, 250), random(32,72));
  }
}
