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

public class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}

// mouse button clicked
void mousePressed()
{
  if (on_button.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    print("Clicked: ");
    println(clk++);
  }
}

Intro word1, word2, word3;

Button on_button;  // the button
int clk = 1;       // number of times the button is clicked


void setup() {
  size(1200, 700);
  smooth();
  
  // create the button object
  on_button = new Button("Click Me", 300, 100, 500, 500);
  
  textAlign(CENTER);
  textSize(75);
  word1 = new Intro("House", width/4);
  word2 = new Intro("of", width/2 - 13);
  word3 = new Intro("Illusions", 3*width/4 - 20);
  fill(255);
}

void draw() {
  background(0);
  
  // draw a square if the mouse curser is over the button
  if (on_button.MouseIsOver()) {
    rect(200, 20, 50, 50);
  }
  //else {
    // hide the square if the mouse cursor is not over the button
    //background(0);
  //}
  // draw the button in the window
  on_button.Draw();
  
  word1.move();
  word2.move();
  word3.move();
}
