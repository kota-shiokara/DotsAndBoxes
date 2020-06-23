Play playscene;

class PlayScene extends Scene{
  
  void initialize(){
    initialize = false;
    playscene = new Play();
  }
  
  void drawScene(){
    if(initialize) initialize();
    playscene.run();
  }
  
  Scene nextScene(){
    return this;
  }
}

class Play{
  Play(){
    
  }
  
  void run(){
    
  }
}
