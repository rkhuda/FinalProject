public class Mover {
  float x, xspeed, xacc;
  float y, yspeed, yacc;
  float r;
  color c;
  Obstacle o; //This is the platform 

  //constructs hopping square 
  public Mover() {
    x = 100;
    r = 10;
    y = height - r;
    c = color(0, 255, 0);
    yspeed= -10;
    yacc = 0.5;
    o = new Obstacle();
  }

  //makes square square
  public void move() {
    //change the position etc.
    y += yspeed; 
    yspeed += yacc;
    
    //check the rest of the world for interactions
    checkWalls();
    if (keyCode == 37){
      back(); //moves circle back by pressing left arrow key
    }
    if (keyCode == 38){
      jumpHigher(); //makes circle jump higher by pressing up arrow key
    }
    if (keyCode == 39){
      forward(); //circle moves forward by pressing right arrow key
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
  
  
  //checks for obstacles
  public void checkObject(){
    if (o.getX() + o.getWid() > x && o.getX() < x + (r*2) && y < o.getY() + o.getLen() &&
    y + (r*2) > o.getY() ){
      yspeed *= -1;
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
  
  public Obstacle getObject(){
    return o;
  }
  public void display() {
    fill(c);
    rect(x, y, r * 2, r * 2);
  }
}
