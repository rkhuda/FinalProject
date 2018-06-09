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
  text(frameCount/10, 20, 20);
  win();
  lose();
  if (win) {
    showWin();
  }
  if (lose){
    showLose();
  }
}

boolean win = false;
public void win(){
  if (person.getY() <= height/8){
    win = true;
  }
}

boolean lose = false;
public void lose(){
  if (frameCount/10 == 100){
    lose = true;
  }
}
