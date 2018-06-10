  public void showWin(){
    clear();
    textAlign(CENTER);
    text("You won!!!", width/2, height/2);
    textSize(75);
  }
  
  public void showLose(){
    clear();
    game = false;
    textAlign(CENTER);
    text("Time Ran Out", width/2, height/2 - 30);
    text("Starting game over in " + ((frameCount/100)*(-1) + 23), width/2, height/2);
    textSize(75);
    if ( ((frameCount/100)*(-1) + 23) == 0){
      game = true;
      lose = false;
    }
  }
