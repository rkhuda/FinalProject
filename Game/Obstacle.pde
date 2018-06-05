public class Obstacle {
  float x, y, len, wid;
  
  public Obstacle(){
    x = width/2; //xcor of platform
    y = height/2; //ycor of platform
    wid = 60; //width of platform
    len = 10; //length of platform
  }
  public void display(){
    rect(x, y, wid, len);
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
    return y;
  }
  
  public float getLen(){
    return len;
  }
  
  public float getWid(){
    return wid;
  }
}
