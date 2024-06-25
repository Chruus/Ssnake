import java.util.*;
import java.io.*;

void settings(){
    size(16*32 + 16*2, 16*32 + 16*4);
}

void setup(){
    squareWidth = 14;
    scale = 16;
    gameSize = 32;
    snake = new Snake();
    apple = new Apple();
    inputs = new LinkedList<Integer>();

    snake.reset();
    apple.respawn(snake);
}

Snake snake;
Apple apple;
//UserInterface UI;
int squareWidth, scale, gameSize;
int timeOfLastFrame, deltaTime;
boolean inGame, inPause;
Queue<Integer> inputs;

void draw(){
    background(0);

    apple.display();
    snake.display();
    displayHUD();

    findDeltaTime();
    if(deltaTime < 133.3333)
        return;
    
    handleInputs();

    if(snake.collides(apple.x(), apple.y())){
        snake.grow();
        apple.respawn(snake);
    }

    snake.move();
    if(snake.collidesWithTail() || snake.collidesWithWall()){
        snake.display();
        stop();
    }
}

private void displayHUD(){
    pushMatrix();
    pushStyle();
    
    strokeWeight(0);
    fill(125);
    rect(0, 0, gameSize * scale + scale * 2, scale * 3);
    rect(0, 0, scale, gameSize * scale + scale * 4);

    popStyle();
    popMatrix();
}

private void handleInputs(){
    int currentKeyCode = -1;
    while(!isValidInput(currentKeyCode) && !inputs.isEmpty())
        currentKeyCode = inputs.remove();
    
    if(isValidInput(currentKeyCode)){
        if(currentKeyCode == LEFT)
            snake.changeDirection("left");
        if(currentKeyCode == RIGHT)
            snake.changeDirection("right");
        if(currentKeyCode == UP)
            snake.changeDirection("up");
        if(currentKeyCode == DOWN)
            snake.changeDirection("down");
    }
}

private boolean isValidInput(int code){
    if(code != LEFT && code != RIGHT && code != DOWN && code != UP)
        return false;

    if(snake.direction().equals("right") && code == LEFT)
        return false;
    if(snake.direction().equals("left") && code == RIGHT)
        return false;
    if(snake.direction().equals("down") && code == UP)
        return false;
    if(snake.direction().equals("up") && code == DOWN)
        return false;

    return true;
}

private void findDeltaTime(){
    deltaTime = millis() - timeOfLastFrame;
    if(deltaTime > 133.3333)
        timeOfLastFrame = millis();
}

public void keyPressed(){
    inputs.add(keyCode);
    if(key == ' ')
        snake.grow();
}