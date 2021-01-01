import java.util.Random;

class Circle {
  Random rand;
  private PVector pos;
  private float diameter;
  private PVector direction;
  private float speed;
  private PVector updateVector;
  private color circleColor;
  private float bearingRate;

  Circle() {
    rand = new Random();
    this.pos = new PVector(int(random(width)), int(random(height)));
    this.diameter = rand.nextFloat()*150;
    this.direction = PVector.random2D();
    //this.speed = rand.nextFloat()*3;
    this.speed = 1.3;
    this.circleColor = color(rand.nextInt(255), 0, 0);
  }
  
  public void updatePos() {
    updateVector = PVector.mult(direction, speed);
    pos.add(updateVector);
  }
  
  private void rotate() {
    direction.rotate(bearingRate);
  }
  
  public void drawCircle() {
    fill(circleColor);
    circle(pos.x, pos.y, this.diameter);
  }
  
  // SETTERS AND GETTERS
  public Circle setPos(PVector pos) {
    this.pos = pos;
    return this;
  }
  
  public PVector getPos() {
    return this.pos;
  }
  
  public Circle setDiameter(float newDiameter) {
    this.diameter = newDiameter;
    return this;
  }
  
  public float getDiameter() {
    return this.diameter;
  }
  
  public Circle setDirection(PVector direction) {
    this.direction = direction;
    return this;
  }
  
  public PVector getDirection() {
    return this.direction;
  }
  
  public Circle setSpeed(float speed) {
    this.speed = speed;
    return this;
  }
  
  public float getSpeed() {
    return this.speed;
  }
  
  public Circle setCircleColor(color circleColor) {
    this.circleColor = circleColor;
    return this;
  }
  
  public color getCircleColor() {
    return this.circleColor;
  }
  
  public Circle setBearingRate(float bearingRate) {
    this.bearingRate = bearingRate;
    return this;
  }
  
  public float getBearingRate() {
    return this.bearingRate;
  }
}
