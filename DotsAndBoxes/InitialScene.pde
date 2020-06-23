class InitialScene extends Scene{
  
  private String scene;
  
  InitialScene(String _scene){
    scene = _scene;
  }
  
  void initialize(){
    initialize = true;
    moveScene = false;
  }
  
  void drawScene(){
    background(0);
    text("Loading...", width / 2, height / 2);
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
