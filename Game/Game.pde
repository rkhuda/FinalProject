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
  if (player.getY() <= height/8){
    win = true;
  }
}

boolean lose = false;
public void lose(){
  if (frameCount/10 == 100){
    lose = true;
  }
}
