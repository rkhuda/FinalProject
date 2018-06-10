public class Character {
  float x, xspeed, xacc;
  float y, yspeed, yacc;
  float r;
  int CT;
  float max;
  Platform[] platforms; //This is the platform 

  //constructs hopping square 
  public Character() {
    x = 100; //xcor of square
    r = 20; //square dimension
    y = height - r; //ycor of square
    yspeed= -10;
    yacc = 0.5;
    CT = (int) (random(20) + 10); //random number of platforms
    platforms = new Platform[CT]; //array of platforms 
    for (int x = 0; x < platforms.length; x++){
      //random placement of platforms
      float xcor = random(width - 150); 
      float ycor = random(height - 100) + 50;
      platforms[x] = new Platform(xcor + 50, ycor + 50);
    }
  }

  //makes square move
  public void move() {
    //change the position
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
    
    for (Platform p : platforms){
      if (nearPlatform(p)){
        checkObstacles(p);
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
  
  public boolean nearPlatform(Platform thing){
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
  public void checkObstacles(Platform o){
    if (o.getX() + o.getWid() > x && o.getX() < x + r && y < o.getY() + o.getLen() &&
    y + r > o.getY() ){
      yspeed *= -.9;
    }
  }
  
  public Platform[] getObstacles(){
    return platforms;
  }
  
  public void display() {
    //fill();
    rect(x, y, r, r);
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public float getMax(){
    for (Platform object : platforms){
      if (max > object.getY()){
        max = object.getY();
      }
    }
    return max;
  }
}
