class Ship {
  // Member Variables
  int x, y, w, health, laserCount;
  boolean active;
  PImage ship;

  //Constructor
  Ship() {
    x = 0;
    y = 0;
    w = 50;
    health = 100;
    laserCount = 500;
    active = true;
    ship = loadImage("Ship.png");
  }

  //member Methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    imageMode(CENTER);
    ship.resize(40,40);
   image(ship, x, y);
  }

  void move() { //designed for keyboard
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r ) {
    return true;
  }
}
