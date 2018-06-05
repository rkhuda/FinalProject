Mover mover;
Obstacle obstacle;
public void setup() {
  size(600, 300);
  mover = new Mover();
  obstacle = mover.getObject();
  rectMode(CENTER);
}

public void draw() {
  background(255);
  fill(0);
  obstacle.display();
  mover.display();
  mover.move();
  mover.checkObject();
}
