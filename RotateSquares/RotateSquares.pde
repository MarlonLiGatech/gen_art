int squareWidth = 280;
int gap = 30;
int squareCount = 9;

void setup() 
{
  size(3000, 3000);
  frameRate(1);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  background(0,0,100);
  color fillColor = color(49, 100, 100);
  float ROTATE_BY = 0;
  float ROTATE_BY_INC = -(PI/4/(squareCount-1));
  translate(squareWidth, squareWidth);
  for (int i = 0; i < squareCount; i++) {
    ROTATE_BY = ROTATE_BY_INC*i;
    for (int j = 0; j < squareCount; j++) {
      push();
      fill(fillColor);
      rotate(ROTATE_BY);
      square(-squareWidth/2, -squareWidth/2, squareWidth);
      pop();
      translate(0, squareWidth+gap);
      ROTATE_BY += ROTATE_BY_INC;
    }
    translate(squareWidth+gap, -(squareWidth+gap)*squareCount);
  }
}

void draw() {

} 
