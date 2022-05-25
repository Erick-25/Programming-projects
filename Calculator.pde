//Erick Guarneros Calcultor | Oct 2021 | Calculator

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal = "0"; // used for dispay
String op = ""; //This will hold the operator symbol
boolean left = true; //used to deicde which float to occupy
float r, l, result;


void setup() {
  size(550, 800);
  numButtons[0]= new Button(40, 610, 80, 80, "0", color(#79B6FF), color(#006CFF));
  numButtons[1]= new Button(40, 515, 80, 80, "1", color(#79B6FF), color(#006CFF));
  numButtons[2]= new Button(130, 515, 80, 80, "2", color(#79B6FF), color(#006CFF));
  numButtons[3]= new Button(220, 515, 80, 80, "3", color(#79B6FF), color(#006CFF));
  numButtons[4]= new Button(40, 415, 80, 80, "4", color( #79B6FF), color(#006CFF));
  numButtons[5]= new Button(130, 415, 80, 80, "5", color(#79B6FF), color(#006CFF));
  numButtons[6]= new Button(220, 415, 80, 80, "6", color(#79B6FF), color(#006CFF));
  numButtons[7]= new Button(40, 315, 80, 80, "7", color(#79B6FF), color(#006CFF));
  numButtons[8]= new Button(130, 315, 80, 80, "8", color(#79B6FF), color(#006CFF));
  numButtons[9]= new Button(220, 315, 80, 80, "9", color(#79B6FF), color(#006CFF));
  opButtons[0]= new Button(310, 315, 80, 80, "%", color(#FFD27E), color(#FFAF00));
  opButtons[1]= new Button(310, 415, 80, 80, "π", color(#FFD27E), color(#FFAF00));
  opButtons[2]= new Button(310, 515, 80, 80, "^", color(#FFD27E), color(#FFAF00));
  opButtons[3]= new Button(130, 610, 80, 80, "±", color(#FFD27E), color(#FFAF00));
  opButtons[4]= new Button(220, 610, 80, 80, ".", color(#FFD27E), color(#FFAF00));
  opButtons[5]= new Button(310, 610, 80, 80, "=", color(#FFD27E), color(#FFAF00));
  opButtons[6]= new Button(400, 610, 80, 80, "÷", color(#FFD27E), color(#FFAF00));
  opButtons[7]= new Button(400, 515, 80, 80, "*", color(#FFD27E), color(#FFAF00));
  opButtons[8]= new Button(400, 415, 80, 80, "-", color(#FFD27E), color(#FFAF00));
  opButtons[9]= new Button(400, 315, 80, 80, "+", color(#FFD27E), color(#FFAF00));
  opButtons[10]= new Button(400, 220, 80, 80, "del", color(#FFD27E), color(#FFAF00));
  opButtons[11]= new Button(310, 220, 80, 80, "√", color(#FFD27E), color(#FFAF00));
  opButtons[12]= new Button(40, 220, 260, 80, "clear", color(200), color(127));
}


void draw() {
  background(100);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (int i =0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length()<35) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i = 0; i<opButtons.length; i++)
    if (opButtons[i].on) {
      handleEvent(opButtons[i].val, false);
    }
  println(" L:" + l + " Op:" + op + " R:" + r + " Result:" + result + " Left:" + left);
}


void clearCalc() {
  dVal= "0";
  op = "";
  left = true;
  r = 0.0;
  l = 0.0 ;
  result = 0.0;
}

void updateDisplay() {
  fill(255);
  rect(50, 125, 410, 80);
  fill(0);
  textAlign(RIGHT);
  //textSize(40);
  if (dVal.length()<20) {
    textSize(40);
  } else if (dVal.length() <26) {
    textSize(25);
  } else if (dVal.length() <30) {
    textSize(20);
  }

  text(dVal, width-100, 185);
}


void preformCalc() {
  if (op.equals("+")) {
    result = l+r;
  } else if (op.equals("-")) {
    result = l-r;
  } else if (op.equals("*")) {
    result = l*r;
  } else if (op.equals("÷")) {
    result = l/r;
  } else if (op.equals("^")) {
    result = pow(l, r);
  } 
  dVal = str(result);
  left = true;
  l = result;
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyPressed) {
    if (keyCode == 97 || keyCode == 49) {
      handleEvent("1", true);
    } else if (keyCode == 98 || keyCode == 50) {
      handleEvent("2", true);
    } else if (keyCode == 99 || keyCode == 51) {
      handleEvent("3", true);
    } else if (keyCode == 100 || keyCode == 52) {
      handleEvent("4", true);
    } else if (keyCode == 101 || keyCode == 53) {
      handleEvent("5", true);
    } else if (keyCode == 102 || keyCode == 54) {
      handleEvent("6", true);
    } else if (keyCode == 103 || keyCode == 55) {
      handleEvent("7", true);
    } else if (keyCode == 104 || keyCode == 56) {
      handleEvent("8", true);
    } else if (keyCode == 105 || keyCode == 57) {
      handleEvent("9", true);
    } else if (keyCode == 96 || keyCode == 48) {
      handleEvent("0", true);
    } else if (keyCode == 110) {
      handleEvent(".", true);
    } else if (keyCode == 107) {
      handleEvent("+", false);
    } else if (keyCode == 106) {
      handleEvent("*", false);
    } else if (keyCode == 109) {
      handleEvent("-", false);
    } else if (keyCode == 111) {
      handleEvent("/", false);
    } else if (keyCode == 10) {
      preformCalc();
    }
  }
}

void handleEvent(String val, boolean num) {
  if (num) {
    //all number event logic
    if (dVal.equals("0")) {
      dVal = val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    } else if (dVal.length()<35) {
      dVal = dVal + val;
      if (left) {
        l = float (dVal);
      } else if (!left) {
        r = float(dVal);
      }
    }
  } else if (val.equals("clear")) {
    clearCalc();
  } else if (val.equals("+")) {
    left = false;
    op = "+";
    dVal = "" ;
  } else if (val.equals("-")) {
    left = false;
    op = "-";
    dVal = "" ;
  } else if (val.equals("*")) {
    left = false;
    op = "*";
    dVal = "" ;
  } else if (val.equals("÷")) {
    left = false;
    op = "÷";
    dVal = "" ;
  } else if (val.equals("=")) {
    preformCalc();
  } else if (val.equals("±")) {
  if (left) {
      l*=-1;
      dVal = str(l);
    } else if (!left) {
      r*=-1;
      dVal = str(r);}
    } else if (val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal = dVal + ".";
      }
    }
   else if (val.equals("^")) {
    left = false;
    op = "^";
    dVal = "" ;
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else if (!left) {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("π")) {
    dVal = str(PI);
  }
}
