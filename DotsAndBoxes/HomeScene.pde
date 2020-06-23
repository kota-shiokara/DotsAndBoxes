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
  private float bx, by;
  Home(){
    bx = width / 2;
    by = height / 2;
  }
  
  void run(){
    if((mouseX > bx - 25) && (mouseX < bx + 25) && (mouseY > by - 25) && (mouseY < by + 25)){
      fill(124);
      ellipse(bx, by, 50, 50);
      if(mousePressed){
        moveScene = true;
      }
    }else{
      fill(255);
      ellipse(bx, by, 50, 50);
    }
  }
}
