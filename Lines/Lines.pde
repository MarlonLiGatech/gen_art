final int CIRCLE_COUNT = 5;

CircleManager circManager;

void setup() 
{
  size(1000, 1000);
  pixelDensity(2);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
  noStroke();
  circManager = new CircleManager();
  circManager.setupCircles(CIRCLE_COUNT);
}

void draw() {
  circManager.update();
} 
