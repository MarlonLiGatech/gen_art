Boolean isRunning = true;
void keyPressed() {
  if (key == ' ') {
    isRunning = !isRunning;
  }
  if (key == ENTER) {
    saveFrame("ex.png");
    saveFrame("ex.tif");
    println("Saved image");
  }
  
  if (isRunning) {
    loop();
  } else {
    noLoop();
  }
}
