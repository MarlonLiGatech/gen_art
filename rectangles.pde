Boolean isRunning = true;
void keyPressed() {
  if (key == ' ') {
    isRunning = !isRunning;
  }
  if (key == ENTER) {
    saveFrame();
    println("Saved image");
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
  colorMode(HSB, 360, 100, 100);
  color squareColor = color(random(360), 80, 100);
  //color strokeColor = color((180 + hue(squareColor)) % 360, saturation(squareColor), brightness(squareColor));
  fill(squareColor);
  noStroke();
  //stroke(strokeColor);
  //strokeWeight(10);
  translate(150, 150);
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      push();
      rotate(random(-0.1 * (i + j), -0.1 * (i + j)));
      square(-90, -90, 180);
      pop();
      translate(0, 200);
    }
    translate(200, -1800);
  }
}

void draw() {

} 
