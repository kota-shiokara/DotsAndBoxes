Home homescene;

class HomeScene extends Scene{
  
  void initialize(){
    initialize = false;
    homescene = new Home();
  }
  
  void drawScene(){
    if(initialize) initialize();
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
