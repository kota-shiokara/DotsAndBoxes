class InitialScene extends Scene{
  
  private String scene;
  private float timer;
  
  InitialScene(String _scene){
    scene = _scene;
    timer = millis() / 1000;
  }
  
  void initialize(){
    initialize = true;
    moveScene = false;
  }
  
  void drawScene(){
    if(millis() / 1000 - timer > 2) moveScene = true;
    else initialize();
    background(0);
    fill(255);
    text("Loading...", width / 2 - 30, height / 2 + 30);
  }
  
  Scene nextScene(){
    if(moveScene){
      initialize();
      return SceneTerminal(scene);
    }
    return this;
  }
  
  Scene SceneTerminal(String scene){
    switch(scene){
      case "Home":
        return new HomeScene();
      case "Play":
        return new PlayScene();
      default:
        return this;
    }
  }
}
