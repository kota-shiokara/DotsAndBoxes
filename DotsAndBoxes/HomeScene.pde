Home homescene;

class HomeScene extends Scene{

  private float gray;

  void initialize(){
    gray = 0;
    initialize = false;
    homescene = new Home();
  }
  
  void drawScene(){
    if(initialize) initialize();
    background(gray);
    if(gray <= 255) gray+=3;
    else homescene.run();
  }
  
  Scene nextScene(){
    if(moveScene) return new InitialScene("Play");
    return this;
  }
}

class Home{

  private float bx, by; // 仮のボタン用変数

  Home(){
    bx = width / 2;
    by = height / 2;

    sceneTime = millis() / 1000;
  }
  
  void run(){
    fill(0);
    textSize(35);
    text("Dots And Boxes",width / 2, height / 4); // 仮タイトル
    button();
  }

  // 仮のボタン用関数
  void button(){
    if((mouseX > bx - 75) && (mouseX < bx + 75) && (mouseY > by - 25) && (mouseY < by + 25)){
      fill(124);
      stroke(0);
      ellipse(bx, by, 150, 50);
      noStroke();
      if(mousePressed){
        moveScene = true;
      }
    }else{
      fill(255);
      stroke(0);
      ellipse(bx, by, 150, 50);
      noStroke();
    }
  }
}

// ホーム設置用ボタン
class HomeButton{
  int[] boxLine = {1,2,1,2};
  HomeButton(){
    boxLine[floor(random(4))] = 0;
  }
  void display(){

  }
}
