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
    if(gray <= 255) gray+=2;
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
  }
  
  void run(){
    fill(0);
    textSize(35);
    text("Dots And Boxes",width / 3, height / 4); // 仮タイトル
    button();
  }

  void button(){ // 仮のボタン用関数
    if((mouseX > bx - 75) && (mouseX < bx + 75) && (mouseY > by - 25) && (mouseY < by + 25)){
      fill(124);
      ellipse(bx, by, 150, 50);
      if(mousePressed){
        moveScene = true;
      }
    }else{
      fill(255);
      ellipse(bx, by, 150, 50);
    }
  }
}
