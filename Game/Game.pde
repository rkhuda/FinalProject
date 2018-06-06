Mover mover;
Obstacle[] obstacles;
public void setup() {
  size(1000, 700);
  mover = new Mover();
  obstacles = mover.getObject();
  //rectMode(CENTER);
}

public void draw() {
  background(0);
  fill(255);
  for (Obstacle obstacle : obstacles){
    obstacle.display();
  }
  mover.display();
  mover.move();
  //mover.checkObject();
}
