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
    if(moveScene) return new InitialScene("Result");
    return this;
  }
}

class Play{
  private int[][] dots;
  private int[][] wLines;
  private int[][] hLines;
  private Player p;
  Play(){
    gameTime = millis() / 1000;
    switch (dotsMode) {
      case 0 : // 4*4のdots
        p = new Player(3, 3);
      default :
        p = new Player(3, 3);
    }
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
      case 0 : // 4*4のdots
        dots = new int[4][4];
        wLines = new int[3][4];
        hLines = new int[3][4];
      default :
        dots = new int[4][4];
        wLines = new int[3][4];
        hLines = new int[3][4];
    }
  }

  void colorMake(int playerId, boolean active){
    int colPow = active ? 150 : 255;
    if(playerId == 0){
      stroke(0, colPow, 0);
    }else if(playerId == 1){
      stroke(colPow, 0, 0);
    }else if(playerId == 2){
      stroke(0, 0, colPow);
    }
  }

  boolean colorCheck(int line){
    if(line == 0 && mousePressed){
      return true;
    }else{
      return false;
    }
  }

  void playMain(){
    strokeWeight(8);
    /*if(frameCount % 60 == 0){
      wLines[int(random(0, 3))][int(random(0, 4))] = int(random(0, 3));
      hLines[int(random(0, 3))][int(random(0, 4))] = int(random(0, 3));
    }*/
    
    float w = width / wLines[0].length;
    float h = height / hLines[0].length;
    boolean wActive = false;
    boolean hActive = false;
    boolean getBox = false;
    // ボックス
    noStroke();
    for(int j = 0; j < p.boxes[0].length; j++){
      for(int i = 0; i < p.boxes.length; i++){
        if(p.boxes[i][j].getStatus() != 0){
          if(p.boxes[i][j].getStatus() == 1) fill(150, 0, 0);
          else fill(0, 0, 150);
          rect(i * w + w / 2, j * h + h / 2, w, h);
          fill(255);
        }
      }
    }
    //横線
    for(int j = 0; j < wLines[0].length; j++){
      for(int i = 0; i < wLines.length; i++){
        if(i * w + w / 2 + 5 < mouseX && mouseX < i * w + w * 1.5 - 5 && j * h + h / 2 - 5 < mouseY && mouseY < j * h + h / 2 + 5){
          wActive = true;
          if(colorCheck(wLines[i][j])){
            wLines[i][j] = p.getTurn();
            p.setTurn();
            if(0 < j && j < wLines[0].length - 1){
              // 上と下にボックスがあるとき
              // 上のボックス
              p.boxes[i][j-1].setLines(2);
              if(p.boxes[i][j-1].getLines(0) && p.boxes[i][j-1].getLines(1) && p.boxes[i][j-1].getLines(2) && p.boxes[i][j-1].getLines(3)){
                // ボックスが取られた時
                p.boxes[i][j-1].setStatus(wLines[i][j]);
                getBox = true;
                if(p.gameSetCheck() != -1) moveScene = true;
              }
              //下のボックス
              p.boxes[i][j].setLines(0);
              if(p.boxes[i][j].getLines(0) && p.boxes[i][j].getLines(1) && p.boxes[i][j].getLines(2) && p.boxes[i][j].getLines(3)){
                // ボックスが取られた時
                p.boxes[i][j].setStatus(wLines[i][j]);
                getBox = true;
                if(p.gameSetCheck() != -1) moveScene = true;
              }
            }else if(j == 0){
              // 下のみボックス
              p.boxes[i][j].setLines(0);
              if(p.boxes[i][j].getLines(0) && p.boxes[i][j].getLines(1) && p.boxes[i][j].getLines(2) && p.boxes[i][j].getLines(3)){
                // ボックスが取られた時
                p.boxes[i][j].setStatus(wLines[i][j]);
                getBox = true;
                if(p.gameSetCheck() != -1) moveScene = true;
              }
            }else if(j == hLines[0].length - 1){
              // 上のみボックス
              p.boxes[i][j-1].setLines(2);
              if(p.boxes[i][j-1].getLines(0) && p.boxes[i][j-1].getLines(1) && p.boxes[i][j-1].getLines(2) && p.boxes[i][j-1].getLines(3)){
                // ボックスが取られた時
                p.boxes[i][j-1].setStatus(wLines[i][j]);
                getBox = true;
                if(p.gameSetCheck() != -1) moveScene = true;
              }
            }
          }
        }
        colorMake(wLines[i][j], wActive);
        line(i * w + w / 2, j * h + h / 2, i * w + w * 1.5, j * h + h / 2);
        wActive = false;
      }
    }
    //縦線
    for(int j = 0; j < hLines[0].length; j++){
      for(int i = 0; i < hLines.length; i++){
        if(j * w + w / 2 - 5 < mouseX && mouseX < j * w + w / 2 + 5 && i * h + h / 2 + 5 < mouseY && mouseY < i * h + h * 1.5 - 5){
          hActive = true;
          if(colorCheck(hLines[i][j])){
            hLines[i][j] = p.getTurn();
            p.setTurn();
            if(0 < j && j < hLines[0].length - 1){
              // 右と左にボックスがあるとき
              // 左のボックス
              p.boxes[j-1][i].setLines(1);
              if(p.boxes[j-1][i].getLines(0) && p.boxes[j-1][i].getLines(1) && p.boxes[j-1][i].getLines(2) && p.boxes[j-1][i].getLines(3)){
                // ボックスが取られた時
                p.boxes[j-1][i].setStatus(hLines[i][j]);
                getBox = true;
                if(p.gameSetCheck() != -1) moveScene = true;
              }
              //右のボックス
              p.boxes[j][i].setLines(3);
              if(p.boxes[j][i].getLines(0) && p.boxes[j][i].getLines(1) && p.boxes[j][i].getLines(2) && p.boxes[j][i].getLines(3)){
                // ボックスが取られた時
                p.boxes[j][i].setStatus(hLines[i][j]);
                getBox = true;
                if(p.gameSetCheck() != -1) moveScene = true;
              }
            }else if(j == 0){
              // 右のみボックス
              p.boxes[j][i].setLines(3);
              if(p.boxes[j][i].getLines(0) && p.boxes[j][i].getLines(1) && p.boxes[j][i].getLines(2) && p.boxes[j][i].getLines(3)){
                // ボックスが取られた時
                p.boxes[j][i].setStatus(hLines[i][j]);
                getBox = true;
                if(p.gameSetCheck() != -1) moveScene = true;
              }
            }else if(j == hLines[0].length - 1){
              // 左のみボックス
              p.boxes[j-1][i].setLines(1);
              if(p.boxes[j-1][i].getLines(0) && p.boxes[j-1][i].getLines(1) && p.boxes[j-1][i].getLines(2) && p.boxes[j-1][i].getLines(3)){
                // ボックスが取られた時
                p.boxes[j-1][i].setStatus(hLines[i][j]);
                getBox = true;
                if(p.gameSetCheck() != -1) moveScene = true;
              }
            }
          }
        }
        colorMake(hLines[i][j], hActive);
        line(j * w + w / 2, i * h + h / 2, j * w + w / 2, i * h + h * 1.5);
        hActive = false;
      }
    }
  
    strokeWeight(16);
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
    if(getBox) p.setTurn();
    getBox = false;
  }
}

class Player{
  private int turn;
  Boxes[][] boxes;
  Player(int x, int y){
    turn = 1;
    boxes = new Boxes[x][y];
    for(int j = 0; j < y; j++){
      for(int i = 0; i < x; i++){
        boxes[i][j] = new Boxes(i, j);
      }
    }
  }

  int getTurn(){
    return this.turn;
  }

  void setTurn(){
    this.turn++;
    if(this.turn == 3) this.turn = 1;
  }

  String getPlayer(){
    if(this.turn == 1){
      return "Red";
    }else{
      return "Blue";
    }
  }

  int gameSetCheck(){
    int[] cnt = new int[]{0, 0, 0};
    for(int j = 0; j < boxes[0].length; j++){
      for(int i = 0; i < boxes.length; i++){
        if(boxes[i][j].status == 0) return -1;
        cnt[boxes[i][j].status]++;
      }
    }
    winner = cnt[1] > cnt[2] ? 1 : 2;
    return winner;
  }
}

class Boxes{
  int x;
  int y;
  private int status;
  private boolean[] lines;
  Boxes(int _x, int _y){
    x = _x;
    y = _y;
    status = 0;
    lines = new boolean[]{false, false, false, false};
  }

  void setStatus(int _status){
    this.status = _status;
  }

  int getStatus(){
    return this.status;
  }

  void setLines(int index){
    this.lines[index] = true;
  }

  boolean getLines(int index){
    return this.lines[index];
  }
}
