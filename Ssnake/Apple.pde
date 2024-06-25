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
        rect(x * scale + scale, (y - 0) * scale + scale * 3, squareWidth, squareWidth);

        popStyle();
        popMatrix();
    }
    
    public void respawn(Snake snake){
        x = (int)(Math.random() * gameSize);
        y = (int)(Math.random() * gameSize);

        if(snake.collides(x, y))
            respawn(snake);
    }

    public int x(){
        return x;
    }

    public int y(){
        return y;
    }
}