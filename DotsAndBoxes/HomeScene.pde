Home homescene;

class HomeScene extends Scene{
  void drawScene(){
    homescene.run();
  }
  
  Scene nextScene(){
    if(moveScene) return new InitialScene("Play");
    return this;
  }
}

class Home{
  Home(){
    
  }
  
  void run(){
  }
}
