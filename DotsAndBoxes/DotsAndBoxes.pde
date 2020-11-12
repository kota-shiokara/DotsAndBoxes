/* memo
- 大体の基本色は白
  - fill(255);
- 基本の輪郭は無し
  - noStroke();
- 線の太さ
  - strokeWeight(1);
- オブジェクトの前に色変の関数をつけること
- 新しいシーンにいくときはInitialScene("Hoge");でInitialSceneを経由していく
  - 新しいシーンを作成する場合はInitialSceneのSceneTerminal()に行先を記述していく
*/

/*----- import -----*/

/*----- 定数宣言 -----*/
// 色宣言
final String BLACK = "#000000";
final String WHITE = "#FFFFFF";

// ウィンドウサイズ
final float WINDOW_X = 800; // 横幅
final float WINDOW_Y = 450; // 縦幅

/*----- 変数宣言 -----*/
boolean isClick = false; // クリック判定用変数
boolean initialize = false; // 初期化用変数
boolean moveScene = false; // シーン移動用変数
float currentTime;
float sceneTime; // シーンに入った時間
float gameTime; // ゲーム開始の時間
int winner = 0; // 勝者ID 

// ドットの量 0:9*9
int dotsMode = 0;

/*----- オブジェクト -----*/
Scene g;

void setup(){
  smooth(32);
  noStroke();
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
