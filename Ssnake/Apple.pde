public class Apple{
    private int x, y;

    public Apple(){
        x = 15;
        y = 16;
    }

    public void display(){
        pushMatrix();
        pushStyle();

        strokeWeight(0);
        fill(255, 0, 0);
        rect(x * scale, y * scale, squareWidth, squareWidth);

        popStyle();
        popMatrix();
    }
    
    public void respawn(Snake snake){
        x = (int)(Math.random() * gameSize);
        y = (int)(Math.random() * gameSize);

        if(snake.collides(x, y))
            respawn(snake);
    }
}