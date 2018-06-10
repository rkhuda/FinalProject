  public void showWin(){
    clear();
    textAlign(CENTER);
    text("You won!!!", width/2, height/2);
    textSize(75);
  }
  
  boolean checkTime = true;
  public void showLose(){
    clear();
    game = false;
    textAlign(CENTER);
    text("Time Ran Out", width/2, height/2 - 30);
    //setTime(millis() / 1000);
    text("Starting game over in ", width/2, height/2);
    if (checkTime){
      setTime(millis() / 1000);
      checkTime = false;
    }
    text( (millis() / 1000 - getTime())*(-1) + 3, width/2 + 170, height/2);
    textSize(75);
    if ( (millis() / 1000 - getTime())*(-1) + 3 == 0){
      game = true;
      lose = false;
    }
  }
