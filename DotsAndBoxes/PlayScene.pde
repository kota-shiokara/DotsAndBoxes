Play playscene;

class PlayScene extends Scene{
  
  private float gray;
  
  void initialize(){
    gray = 0;
    initialize = false;
    playscene = new Play();
  }
  
  void drawScene(){
    if(initialize) initialize();
    background(gray);
    if(gray <= 255) gray+=2;
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
