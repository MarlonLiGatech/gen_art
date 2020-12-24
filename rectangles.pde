Boolean isRunning = true;
void keyPressed() {
  if (key == ' ') {
    isRunning = !isRunning;
  }
  
  if (isRunning) {
    loop();
  } else {
    noLoop();
  }
}

/***************
* START HERE
***************/
color backgroundColor = color(255, 255, 255);
void setup() 
{
  size(2000, 2000);
  frameRate(1);
  
  background(backgroundColor);

}

void draw() {
  colorMode(HSB, 360, 100, 100);
  color squareColor = color(random(360), random(100), random(100));
  color strokeColor = color(180 - hue(squareColor), saturation(squareColor), brightness(squareColor));
  for (int i = 40; i < width - 40; i = i + 200) {
    for (int j = 40; j < height - 40; j = j + 200) {
      push();
      fill(squareColor);
      stroke(strokeColor);
      rotate(random(-0.2, 0.2));
      square(i, j, 180);
      pop();
    }
  }
} 
