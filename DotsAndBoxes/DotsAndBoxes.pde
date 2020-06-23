/* memo
- 基本色は白
  - fill(255);
- オブジェクトの前に色変の関数をつけること
*/

/*----- import -----*/

/*----- 定数宣言 -----*/
//色宣言
final String BLACK = "#000000";
final String WHITE = "#FFFFFF";
final float WINDOW_X = 800; // ウィンドウの横幅
final float WINDOW_Y = 450; // ウィンドウの縦幅

/*----- 変数宣言 -----*/
boolean isClick = false; // クリック判定用変数
boolean initialize = false; // 初期化用変数
boolean moveScene = false; // シーン移動用変数
float currentTime;
float sceneTime;
float gameTime;

/*----- オブジェクト -----*/
Scene g;

void setup(){
  size(800, 450);
  g = new InitialScene("Home");
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
