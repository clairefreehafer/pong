boolean ballbounce;

int P1Y;

int speedX = -2;
int speedY = -2;
// ball starting position
int ballX = 500;
int ballY = 250;

void setup() {
  size(1000,500);

}

void draw() {
  background(0);
  noStroke();
  P1paddle();
  P2paddle();
  ball();
  //P1bounce();
}

void P1paddle() {
  fill(255);
  int P1X = 20;
  int P1Y = mouseY - 50;
  rect(P1X,P1Y,20,100);
}

void P2paddle() {
  fill(255);
  rect(960,ballY - 50,20,100);
}

void ball() {
  fill(255);
  ellipseMode(CENTER);
  ellipse(ballX,ballY,30,30);
  ballX = ballX + speedX;

  // y movement
  if (ballY >= 0) {
    ballY = ballY + speedY;
  }
  // y bounce
  if (ballY > 500) {
    speedY = speedY * (-1);
  }
  else if (ballY == 0) {
    speedY = speedY * (-1);
  }
  // x bounce
  if (ballX > 960) {
    speedX = speedX * (-1);
  }
  
  // P1 paddle bounce
  int P1Y = mouseY - 50;
  if (ballX == 40 && ballY >= P1Y - 100 && ballY <= P1Y + 100) {
    speedX = speedX * (-1);
    ballX = ballX + speedX;
  }
  
  // game over
  if (ballX <= 0) {
    speedX = 0;
    speedY = 0;
    fill(255);
    textSize(50);
    text("YOU LOSE",400,250);
  }
}
