Result resultscene;

class ResultScene extends Scene{
  
  void initialize(){
    initialize = false;
    resultscene = new Result();
  }
  
  void drawScene(){
    if(initialize) initialize();
    background(255);
    resultscene.run();
  }
  
  Scene nextScene(){
    if(moveScene && resultscene.next == 0) return new InitialScene("Home");
    else if(moveScene && resultscene.next == 1) return new InitialScene("Play");
    return this;
  }
}

class Result{
    int next; // 0 = Home, 1 = Play
    float bx , by;
    Result(){
        this.bx = width / 2;
        this.by = height / 2;
        sceneTime = millis() / 1000;
        this.next = 0;
        strokeWeight(1);
    }

    void run(){
        if(winner == 1) fill(255, 0, 0);
        else fill(0, 0, 255);
        textSize(35);
        text( "Winner! " + (winner == 1 ? "Red" : "Blue"), width / 2, height / 4);
        button(0);
    }

    // 仮のボタン用関数
    void button(int _next){
        if((mouseX > bx - 75) && (mouseX < bx + 75) && (mouseY > by - 25) && (mouseY < by + 25)){
            fill(124);
            stroke(0);
            ellipse(bx, by, 150, 50);
            noStroke();
            if(mousePressed){
                this.next = _next;
                moveScene = true;
            }
        }else{
            fill(255);
            stroke(0);
            ellipse(bx, by, 150, 50);
            noStroke();
        }
    }
}