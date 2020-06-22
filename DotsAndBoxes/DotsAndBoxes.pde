Scene g;

void setup(){
  
}

void draw(){
  g = g.run();
}

abstract class Scene{
  Scene(){
  }
  
  Scene run(){
    drawScene();
    return nextScene();
  }
  
  abstract void drawScene();
  abstract Scene nextScene();
}
