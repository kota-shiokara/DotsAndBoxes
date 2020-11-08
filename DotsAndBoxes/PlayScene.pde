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
  private int[][] wLines;
  private int[][] hLines;
  Play(){
    gameTime = millis() / 1000;
    dotsSet(dotsMode);
  }
  
  void run(){
    if(millis() / 1000 - gameTime < 1){
      counter("3");
    }else if((millis() / 1000 - gameTime >= 1) && (millis() / 1000 - gameTime < 2)){
      counter("2");
    }else if((millis() / 1000 - gameTime >= 2) && (millis() / 1000 - gameTime < 3)){
      counter("1");
    }else if((millis() / 1000 - gameTime >= 3) && (millis() / 1000 - gameTime < 4)){
      counter("Start!");
    }else{
      playMain();
    }
  }

  // カウント文字用表示関数
  void counter(String cnt){
    fill(0);
    textSize(36);
    textAlign(CENTER);
    text(cnt, width/2,height/2);
    fill(255);
  }

   private void dotsSet(int dotsMode){
     switch (dotsMode) {
       case 0 : // 3*3のdots
        dots = new int[4][4];
        wLines = new int[3][4];
        hLines = new int[3][4];
       default :
        dots = new int[4][4];
        wLines = new int[3][4];
        hLines = new int[3][4];
     }
  }

  void playMain(){
    strokeWeight(8);
    
    float w = width / wLines[0].length;
    float h = height / hLines[0].length;
    //線
    for(int i = 0; i < wLines.length; i++){
      for(int j = 0; j < hLines[0].length; j++){
        stroke(0, 255, 0);
        //横
        line(i * w + w / 2, j * h + h / 2, i * w + w * 1.5, j * h + h / 2);
        //縦
        line(j * w + w / 2, i * h + h / 2, j * w + w / 2, i * h + h * 1.5);
      }
    }

    w = width / dots.length;
    h = height / dots.length;
    //点
    for(int i = 0; i < dots.length; i++){
      for(int j = 0; j < dots.length; j++){
        stroke(0, 0, 0);
        point(i * w + w / 2, j * h + h / 2);
      }
    }
    noStroke();
  }
}

class Player{

}
