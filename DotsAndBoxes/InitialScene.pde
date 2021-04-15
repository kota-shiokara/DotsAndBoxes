class InitialScene extends Scene{
  
  private String scene;
  private float timer;
  
  InitialScene(String _scene){
    scene = _scene;
    timer = millis() / 1000;
    moveScene = false;
    strokeWeight(1);
    stroke(0);
  }
  
  void initialize(){
    initialize = true;
    moveScene = false;
  }
  
  void drawScene(){
    if(millis() / 1000 - timer > 0.5) moveScene = true;
    background(0);
    fill(255);

    textSize(14);
    textAlign(CENTER);
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
      case "Result":
        return new ResultScene();
      default:
        return this;
    }
  }
}
