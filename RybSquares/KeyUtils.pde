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
