Character player;
Platform[] obstacles;
public void setup() {
  size(1000, 700);
  player = new Character();
  obstacles = player.getObstacles();
  //rectMode(CENTER);
}

public void draw() {
  background(0);
  fill(255);
  for (Platform obstacle : obstacles){
    obstacle.display();
  }
  player.display();
  player.move();
}
