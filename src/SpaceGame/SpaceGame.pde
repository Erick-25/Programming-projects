Ship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer, puTimer;
int score, level, rockTime;
boolean play;
PImage gameOver, startScreen;

void setup() {
  size(1000, 1000);
  s1 = new Ship();
  score = 0;
  level = 1;
  rockTime = (1500);
  rockTimer = new Timer(rockTime);
  rockTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  play = false;
}

void draw() {
  startScreen ();
  background(0);
  noCursor();

  if (!play) {
    startScreen();
  } else {
    if (frameCount % 1000 == 10) {
      level++;
    }



    stars.add(new Star());
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }
    if (puTimer.isFinished()) {
      powerUps.add(new PowerUp(int(random(width)), -100));
      puTimer.start();
    }
    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp pu = powerUps.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1)) {
        powerUps.remove(pu);
      }
      if (pu.intersect(s1)) {
        //find out what type pf powerup
        if (pu.type == 'h') {
          s1.health+=100;
          powerUps.remove(pu);
        } else if (pu.type == 'l') {
          s1.laserCount+=100;
          powerUps.remove(pu);
        }
      }
    }

    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -100));
      rockTimer.start();
    }
    //Display laser and detect collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          score = score +rock.diam;
          lasers.remove(laser);
          rock.health = rock.health - 100;
          if (rock.health < 10) {
            rocks.remove(rock);
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    //Display rock and detect rock collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (rock.intersect(s1)) {
        rocks.remove(rock);
        score+=rock.diam;
        s1.health -= rock.diam;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    infoPanel();
    s1.display(mouseX, mouseY);

    if (s1.health <1) {
      gameOver();
      noLoop();
    }
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 40);
  fill(255, 200);
  textSize(16);
  textAlign(CENTER);
  text("Score:  " + score + "      Level:  " +   + level +  "      Health:  " + s1.health + "      Ammo:  " + s1.laserCount, width/2, 30);
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(46);
  text("Welcome to space game!", width/2, height/2+20);
  text("by Erick Meraz", width/2, height/2+125);
  text("Click anywhere to play...", width/2, height/2+200);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0); // or load image
  textAlign(CENTER);
  fill(255);
  textSize(46);
  text("Game Over", width/2, height/2);
  text("Level:" + level, width/2, height/2+70);
  text(" Score:" + score, width/2, height/2+125);
  if (keyPressed) {
    if (key == 32 ) {
      startScreen();
    }
  }
}
void ticker() {
}

void mousePressed() {
  if (s1.fire()) {
    lasers.add(new Laser(s1.x, s1.y));
  }
  s1.laserCount--;
}

void keyPressed () {
  if (s1.fire()) {
    if (keyPressed) {
      if (key == ' ') {
        lasers.add(new Laser(s1.x, s1.y));
      }
    }
  }
  s1.laserCount--;
}
