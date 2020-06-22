class InitialScene extends Scene{
  private String scene;
  InitialScene(String _scene){
    scene = _scene;
  }
  
  void drawScene(){
    
  }
  
  Scene nextScene(){
    if(moveScene) return SceneTerminal(scene);
    return this;
  }
  
  void initialize(){
    initialize = false;
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
