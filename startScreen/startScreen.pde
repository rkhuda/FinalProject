public class Intro {
  String word;
  float xcor, ycor, xspeed, yspeed;
  
  Intro(String theWord, float x) {
    word = theWord;
    xcor=x;
    xspeed=1;
    ycor=height/2 + 50;
    yspeed=2;
  }
  public void move() {
    ycor+=yspeed;
    if (ycor<height/7) {
      ycor=height/7;
      yspeed=-yspeed;
    }
    if (ycor>height/5) {
      ycor=height/5;
      yspeed=-yspeed;
    }
    text(word, xcor, ycor);
  }
}

int timePassed;
boolean game = false;
// mouse button clicked
void mousePressed()
{
  if (on_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    //print("Clicked: ");
    //println(clk++);
    timePassed = millis() / 1000;
    game = true;
  }
}

public int getTime(){
  return timePassed;
}
public void setTime(int time){
  timePassed = time;
}

Intro word1, word2, word3;

Button on_button;  // the button
//int clk = 1;// number of times the button is clicked

Character player;

public Character getPlayer(){
  return player;
}

void setup() {
  size(1200, 700);
  smooth();
  
  // create the button object
  on_button = new Button("Click Me", width/2 - 175, height/2, 300, 100);
  
  textAlign(CENTER);
  //textSize(75);
  word1 = new Intro("House", width/4);
  word2 = new Intro("of", width/2 - 13);
  word3 = new Intro("Illusions", 3*width/4 - 20);
  fill(255);
  player = new Character();
}

void draw() {
  background(0);
  
  // draw a square if the mouse curser is over the button
  //if (on_button.MouseIsOver()) {
    //rect(200, 20, 50, 50);
  //}
  //else {
    // hide the square if the mouse cursor is not over the button
    //background(0);
  //}
  textSize(75);
  word1.move();
  word2.move();
  word3.move();
  textSize(30);
  // draw the button in the window
  on_button.Draw();
  if (game){
    startGame();
  }
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
  if (millis() / 1000 - getTime() == 5){
    lose = true;
  }
}
