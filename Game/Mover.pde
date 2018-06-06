public class Mover {
  float x, xspeed, xacc;
  float y, yspeed, yacc;
  float r;
  int numOfPlatforms;
  //color c;
  Obstacle[] platforms; //This is the platform 

  //constructs hopping square 
  public Mover() {
    x = 100;
    r = 20;
    y = height - r;
    //c = color(0, 255, 0);
    yspeed= -10;
    yacc = 0.5;
    numOfPlatforms = (int) (random(20) + 10);
    platforms = new Obstacle[numOfPlatforms];
    for (int x = 0; x < platforms.length; x++){
      float xcor = random(width - 100);
      float ycor = random(height - r) + 50;
      platforms[x] = new Obstacle(xcor + 50, ycor + 50);
    }
  }

  //makes square square
  public void move() {
    //change the position etc.
    y += yspeed; 
    yspeed += yacc;
    
    //check the rest of the world for interactions
    checkWalls();
    //keyboard input to control character
    if (keyCode == 37){
      back(); //moves circle back by pressing left arrow key
    }
    if (keyCode == 38){
      jumpHigher(); //makes circle jump higher by pressing up arrow key
    }
    if (keyCode == 39){
      forward(); //circle moves forward by pressing right arrow key
    }
    for (Obstacle p : platforms){
      if (nearPlatform(p)){
        checkObject(p);
      }
    }
  }
  
  public void jumpHigher(){
    //y += yspeed; 
    //yspeed += yacc;
    y--; 
  }
  
  public void back(){
    x--;
  }
  
  public void forward(){
    //System.out.println(numOfPlatforms);
    x++;
  }
  
  public void checkWalls() {
    if (x < r) {
      xspeed *= -1;
      x = r;//prevents 2 true in a row
    }
    if (x > width - r) {
      xspeed *= -1;
      x = width - r;//prevents 2 true in a row
    }
    if (y < r) {
      yspeed *= -.9;
      y = r;//prevents 2 true in a row
    }
    if (y > height - r) {
      yspeed *= -.9;
      y = height - r;//prevents 2 true in a row
    }
    
  }
  
  public boolean nearPlatform(Obstacle thing){
    if (
    y + 10 + thing.getLen() >= thing.getY() || y - 10 - thing.getLen() <= thing.getY() ||
    x + r + 10 >= thing.getX() || x - 10 <= thing.getX() + thing.getWid()
    ){
      return true;
    }
    else {
      return false;
    }
  }
  
  //make methods like these for detecting platform
  //public boolean isUp()
  
  //checks for obstacles
  public void checkObject(Obstacle o){
    if (o.getX() + o.getWid() > x && o.getX() < x + r && y < o.getY() + o.getLen() &&
    y + r > o.getY() ){
      yspeed *= -.9;
    }
    /*
    if ( (y < o.getY() - r) && (x > o.getX()) && (x < o.getX() + o.getWid()) ) {
      yspeed *= -1;
      y = o.getY() - r;//prevents 2 true in a row
    }
    else if ( (y < o.getY() + r) && (x > o.getX() - (o.getWid()/2)) && (x < o.getX() + (o.getWid()/2)) ) {
      yspeed *= -.9;
      y = o.getY() + r;//prevents 2 true in a row
    }
    */
  }
  
  
  public Obstacle[] getObject(){
    return platforms;
  }
  public void display() {
    //fill();
    rect(x, y, r, r);
  }
}
