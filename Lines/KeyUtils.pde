Boolean isRunning = true;
void keyPressed() {
  if (key == ' ') {
    isRunning = !isRunning;
  }
  if (key == ENTER) {
    saveFrame("#######.png");
    //saveFrame("#######.tif");
    println("Saved image");
  }
  
  if (isRunning) {
    loop();
  } else {
    noLoop();
  }
}
