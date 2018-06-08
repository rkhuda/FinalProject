public class Platform {
  float x, y, len, wid;
  
  public Platform(float xcor, float ycor){
    x = xcor; //xcor of platform
    y = ycor; //ycor of platform
    wid = 80; //width of platform
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
