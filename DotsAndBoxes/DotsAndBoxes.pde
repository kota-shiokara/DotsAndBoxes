/*----- import -----*/

/*----- 定数宣言 -----*/
//色宣言
final String BLACK = "#000000";
final String WHITE = "#FFFFFF";

/*----- 変数宣言 -----*/
boolean isClick = false;
boolean initialize = false;

/*----- オブジェクト -----*/
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

void mousePressed(){
  isClick = !isClick;
}
