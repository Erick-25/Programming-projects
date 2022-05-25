class Car {
  //Member Variables
  color c;
  float x, y, speed;
  boolean right;

  //Constructor
  Car(float tempX, float tempY) {
    c = color(random(255), random(255), random(255));
    x=tempX;
    y=tempY;
    speed = random(-6,6);
  }
  //Method display
  void display() {
    fill(0);
    rect(x+4, y-3, 7, 4);
    rect(x+4, y+9, 7, 4);
    rect(x+22, y-3, 7, 4);
    rect(x+22, y+9, 7, 4);
    fill(c);
    rect(x, y, 30, 10);
  }
  //Method for move
  void move() {
    x = x + speed;
    if (x > width) {
      x = 0;
    }
  }
}
