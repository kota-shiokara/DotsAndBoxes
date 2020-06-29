Play playscene;

class PlayScene extends Scene{
  
  void initialize(){
    initialize = false;
    playscene = new Play();
  }
  
  void drawScene(){
    if(initialize) initialize();
    background(255);
    playscene.run();
  }
  
  Scene nextScene(){
    return this;
  }
}

class Play{
  private int[][] dots;
  Play(){
    gameTime = millis() / 1000;
    dots = dotsSet(dotsMode);
  }
  
  void run(){
    if(millis() / 1000 - gameTime < 1){
      counter("3");
    }else if((millis() / 1000 - gameTime >= 1) && (millis() / 1000 - gameTime < 2)){
      counter("2");
    }else if((millis() / 1000 - gameTime >= 2) && (millis() / 1000 - gameTime < 3)){
      counter("1");
    }else if((millis() / 1000 - gameTime >= 3) && (millis() / 1000 - gameTime < 4)){
      counter("0");
    }else{
      playMain();
    }
  }

  // カウント文字用表示関数
  void counter(String cnt){
    fill(0);
    textSize(36);
    text(cnt, width/2,height/2);
    fill(255);
  }

   private int[][] dotsSet(int dotsMode){
     switch (dotsMode) {
       case 0 : // 3*3のdots
        return new int[3][3];
       default :
        return new int[3][3];
     }
  }

  void playMain(){
    
  }
}
