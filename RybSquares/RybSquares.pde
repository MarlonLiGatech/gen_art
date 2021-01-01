color backgroundColor;
color[] primaryRyb;
int squareWidth = 100;
int gap = 20;
int squareCount = 8;

void setup() 
{
  size(1000, 1000);
  frameRate(1);
  colorMode(HSB, 360, 100, 100);
  backgroundColor = color(0, 0, 0);
  background(backgroundColor);
  color red = color(0, 100, 90);
  color yellow = color(60, 100, 90);
  color blue = color(240, 100, 90);
  primaryRyb = new color[] {red, yellow, blue};
  //color strokeColor = color(0,0,30);
  
  //noFill();
  //noStroke();
  //stroke(strokeColor);
  strokeWeight(10);
}

void draw() {
  translate(40, 40);
  for (int i = 0; i < squareCount; i++) {
    for (int j = 0; j < squareCount; j++) {
      push();
      fill(primaryRyb[int(random(3))]);
      square(-squareWidth/2, -squareWidth/2, random(40, 200));
      pop();
      translate(random(-50,50), squareWidth+gap+random(-50,50));
    }
    translate(squareWidth+gap+random(-50,50), -(squareWidth+gap)*squareCount+random(-50,50));
  }
} 
