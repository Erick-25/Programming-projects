class Button {
  //Member variables
  float X, Y, W, H;
  boolean on;
  String val;
  color c1, c2;
  // Constructor
  Button(float tempX, float tempY, float tempW, float tempH, String tempVal, color tempC1, color tempC2) {
    X = tempX;
    Y = tempY;
    W = tempW;
    H = tempH;
    val = tempVal;
    c1 = tempC1;
    c2 = tempC2;
    on = false;
  }
  //Method to Display the button
  void display() {
    if (on) {
      fill(c1);
    } else {
      fill(c2);
    }
    rect(X, Y, W, H, 5);
    fill(0);
    textSize(20);
    textAlign(LEFT);
    text(val, X+30, Y+45);
  }
  // Method for Hovering over Button
  void hover(int mx, int my) {
    on = (mx>X && mx<X+W && my>Y && my<Y+H);
  }
}
