import java.util.*;
import java.io.*;

void settings(){
    size(16*32, 16*32);
}

void setup(){
    squareWidth = 16;
    scale = 16;
    gameSize = 32;
    snake = new Snake();
    apple = new Apple();
    inputs = new LinkedList<Integer>();

    snake.reset();
    //apple.respawn(snake);
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
    println(snake.x() + " " + snake.y());

    findDeltaTime();
    if(deltaTime < 133.3333)
        return;
    
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

    snake.move();
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
}