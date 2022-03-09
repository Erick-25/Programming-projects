class PowerUp {
  int x, y, speed, diam, rand;
  char type;

  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(1, 9));
    diam = int(random(30, 100));
    rand = int(random(3));
    if(rand == 0) {
      type = 'h'; 
    } else if(rand == 1) {
      type = 'l'; 
    } 
  }

  void display() {
    if(type == 'h') {
      fill(0,255,0);
    } else if(type == 'l') {
      fill(255,0,0);
    }
    ellipse(x, y, diam, diam);
    textAlign(CENTER, CENTER);
    textSize(8);
    fill(0);         
    text(diam, x, y);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }


boolean intersect(Ship s) {
    float distance = dist(x,y,s.x,s.y);
    if(distance < 50) {
      return true;
    } else {
      return false;
    }
  }
}
