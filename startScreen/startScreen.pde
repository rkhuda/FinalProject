public class Intro {
  String word;
  float xcor, ycor, xspeed, yspeed;
  
  Intro(String theWord, float x) {
    word = theWord;
    xcor=x;
    xspeed=0;
    ycor=height/2;
    yspeed=random(2, 7);
  }
  public void move() {
    ycor+=yspeed;
    if (ycor<height/9) {
      ycor=height/9;
      yspeed=-yspeed;
    }
    if (ycor>height/8) {
      ycor=height/8;
      yspeed=-yspeed;
    }
    text(word, xcor, ycor);
  }
}

Intro word1, word2, word3;

void setup() {
  size(1200, 700);
  textAlign(CENTER);
  //textSize(75);
  word1 = new Intro("House", width/4);
  word2 = new Intro("of", width/2);
  word3 = new Intro("Illusions", 3*width/4);
  fill(255);
  /*
  if (startGame){
    game.startGame();
  }
  */
}

//Game game = new Game();
//Character player;
//Platform[] obstacles;
void draw() {
  background(0);
  word1.move();
  word2.move();
  word3.move();
  /*
  if (startGame){
    //game.startGame();
    //noLoop();
    game.display();
    //player.display();
    //player.move();
  }
  */
}
/*
boolean startGame = false;
void mouseClicked(){ 
  startGame = true; 
}
*/
