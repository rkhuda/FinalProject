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
    if (numLives == 1){
      text("Game Over", width/2, height/2);
    }
    text("Time Ran Out", width/2, height/2 - 30);
    if (checkTime){
      setTime(millis() / 1000);
      checkTime = false;
    }
    //setTime(millis() / 1000);
    if (numLives == 3){
      text("You have " + (getNumLives() - 1) + " lives left", width/2, height/2);
      text("Starting game over in ", width/2, height/2 + 30);
      text( (millis() / 1000 - getTime())*(-1) + 3, width/2 + 170, height/2 + 30);
    }
    if (numLives == 2){
      text("You have " + (getNumLives() - 1) + " life left", width/2, height/2);
      text("Starting game over in ", width/2, height/2 + 30);
      text( (millis() / 1000 - getTime())*(-1) + 3, width/2 + 170, height/2 + 30);
    }
    //textSize(75);
    if ( (millis() / 1000 - getTime())*(-1) + 3 == 0 && numLives > 1){
      numLives--;
      setTime(millis() / 1000);
      checkTime = true;
      game = true;
      lose = false;
    }
  }
