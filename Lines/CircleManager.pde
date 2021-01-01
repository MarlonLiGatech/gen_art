class CircleManager {
  private static final float DIAMETER_DECREASE_RATIO = 0.994f;
  ArrayList<Circle> circles;
  private PVector[] directions = new PVector[] {PVector.fromAngle(PI/3), PVector.fromAngle(PI*2/3), PVector.fromAngle(PI), PVector.fromAngle(PI*4/3), PVector.fromAngle(PI*5/3), PVector.fromAngle(0)};
  private int updateCount = 0;
  private int splitTimer = 210;
  private color[] approvedColors = new color[] {color(197, 54, 33), color(173, 73, 62), color(43, 55, 91), color(27, 60, 96), color(12, 65, 91)};
  private float colorCount = 0;
  private color darkBlue = color(233, 100, 100);
  
  CircleManager() {
    circles = new ArrayList<Circle>();
  }
  
  public void setupCircles(int newCircleCount) {
    //.setPos(new PVector(width/2, height/2))
    for (int i = 0; i < newCircleCount; i++) {
      circles.add(new Circle().setDiameter(random(2,6)).setDirection(PVector.random2D()).setBearingRate(random(-0.02, 0.02)).setCircleColor(darkBlue).setPos(new PVector(width/2, height/2)).setSpeed(random(0.3,1)));
    }
  }
  
  public void explode(Circle circleToExplode) {
    PVector currPos = circleToExplode.getPos();
    for (int i = 0; i < int(random(8)); i++) {
      circles.add(new Circle().setPos(new PVector(currPos.x, currPos.y)).setDiameter(circleToExplode.getDiameter())
                      .setCircleColor(circleToExplode.getCircleColor()));
    }
  }
  
  public void divide() {
    ArrayList<Circle> newCircles = new ArrayList<Circle>();
    for (int i = 0; i < circles.size(); i++) {
      Circle circleToSplit = circles.get(i);
      PVector currPos = circleToSplit.getPos();
      newCircles.add(new Circle().setPos(new PVector(currPos.x, currPos.y)).setDiameter(circleToSplit.getDiameter()).setCircleColor(circleToSplit.getCircleColor())
                      .setDirection(new PVector(circleToSplit.getDirection().x, circleToSplit.getDirection().y).rotate(-PI*2/3)));
      newCircles.add(new Circle().setPos(new PVector(currPos.x, currPos.y)).setDiameter(circleToSplit.getDiameter()).setCircleColor(circleToSplit.getCircleColor())
                      .setDirection(new PVector(circleToSplit.getDirection().x, circleToSplit.getDirection().y).rotate(PI*2/3)));
    }
    circles = newCircles;
  }
  
  public void duplicate() {
    ArrayList<Circle> newCircles = new ArrayList<Circle>();
    //ArrayList<Circle> toBeRemovedCircles = new ArrayList<Circle>();
    for (int i = 0; i < int(random(circles.size())); i++) {
      Circle circleToSplit = circles.get(int(random(circles.size())));
      //toBeRemovedCircles.add(circleToSplit);
      PVector currPos = circleToSplit.getPos();
      newCircles.add(new Circle().setPos(new PVector(currPos.x, currPos.y)).setDiameter(circleToSplit.getDiameter()).setCircleColor(circleToSplit.getCircleColor())
                      .setDirection(new PVector(circleToSplit.getDirection().x, circleToSplit.getDirection().y)).setSpeed(random(0.3,1)));
      newCircles.add(new Circle().setPos(new PVector(currPos.x, currPos.y)).setDiameter(circleToSplit.getDiameter()).setCircleColor(circleToSplit.getCircleColor())
                      .setDirection(new PVector(circleToSplit.getDirection().x, circleToSplit.getDirection().y)).setSpeed(random(0.3,1)));
    }
    circles.addAll(newCircles);
  }
  
  public void update() {
    //if(splitTimer <= 0) {
    //  return;
    //}
    
    //if(updateCount > 0 && updateCount % splitTimer == 0) {
    //  //explode(circles.remove(int(random(circles.size()))));
    //  //divide();
    //  updateCount = 0;
    //  splitTimer *= 0.7;
    //}
    
    if(random(1) > 0.98) {
      //setupCircles(1);
      //circles.remove(random(circles.size()));
      duplicate();
    }
    
    for (Circle circ : circles) {
      if(random(1) > 0.99) {
        circ.setBearingRate(random(-0.02, 0.02));
      }
      
      circ.rotate();
      color currColor = circ.getCircleColor();
      
      circ.setCircleColor(lerpColor(darkBlue, color(233,0,100), colorCount));
      
      circ.updatePos();
      circ.drawCircle();
    }
    colorCount = colorCount + 0.002;
    updateCount++;
  }
}
