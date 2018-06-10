Character person;
Platform[] obstacles;

public void startGame() {
  clear();
  background(0);
  person = getPlayer();
  obstacles = person.getObstacles();
  fill(255);
  for (Platform obstacle : obstacles){
    obstacle.display();
  }
  person.display();
  person.move();
  text(millis() / 1000 - getTime(), 20, 20);
}
