class Rock {
  int x, y, speed, diam, rand, health;
  PImage rock;

  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(1, 6));
    diam = int(random(50, 200 ));
    health = diam;
    rand = int(random(3));
    rock = loadImage ("Rock.png");
  }

  void display () {
    //fill(#957D38);
    rock.resize(diam, diam);
    image(rock, x, y, diam, diam);
    //ellipse(x, y, diam, diam);
    textAlign(CENTER, CENTER);
    textSize(8);
    fill(0);
    text(diam, x, y);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom () {
    if (y>height+25) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Ship s) {
    float distance = dist(x, y, s.x, s.y);
    if (distance < 50) {
      return true;
    } else {
      return false;
    }
  }
}
