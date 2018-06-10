Character person;
Platform[] obstacles;
int numLives = 3;

public void startGame() {
  clear();
  background(0);
  if (numLives == 3){
    image(heart, width - 100, 40, 20, 20);
    image(heart, width - 70, 40, 20, 20);
    image(heart, width - 40, 40, 20, 20);
  }
  else if (numLives == 2){
    image(heart, width - 70, 40, 20, 20);
    image(heart, width - 40, 40, 20, 20);
  }
  else if (numLives == 1){
    image(heart, width - 40, 40, 20, 20);
  }
  person = getPlayer();
  obstacles = person.getObstacles();
  fill(255);
  for (Platform obstacle : obstacles){
    obstacle.display();
  }
  person.display();
  person.move();
  line(0, height/8, width, height/8);
  textSize(20);
  text(millis() / 1000 - getTime(), 20, 20);
  text("Level One", width/2, 20);
  text("Number of Lives", width - 100, 20);
}

public int getNumLives(){
  return numLives;
}
