class Snowflake {
  float x, y, diameter;
  PImage img;
  int angle = 0;
  
  Snowflake(PImage img, float tempX, float tempY, float tempD) {
    x = tempX;
    y = tempY;
    diameter = tempD;
    this.img = img;
  }
  
  void descend() {
    if (y > 360) {
      y = -30;
    }
    y = y + random(1, 5);
    x = x + random(-2, 2);
  }
  
  void display() {
    stroke(0);
    fill(127);
    image(img, x, y, diameter, diameter);
  }
}
