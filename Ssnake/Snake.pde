public class Snake{
    private int x, y;
    private int xDir, yDir;
    private ArrayList<Integer> xPositions, yPositions;

    public Snake(){
        x = y = -1000;
        xPositions = yPositions = new ArrayList<Integer>();
    }

    public void changeDirection(String newDirection){
        xDir = yDir = 0;

        if(newDirection.equals("up"))
            yDir = -1;
        if(newDirection.equals("down"))
            yDir = 1;
        if(newDirection.equals("left"))
            xDir = -1;
        if(newDirection.equals("right"))
            xDir = 1;
    }

    public void move(){
        x += xDir;
        y += yDir;
    }

    public void grow(){
        for(int i = 0; i < 3; i++){
            xPositions.add(x);
            yPositions.add(y);
        }
    }

    public boolean collides(int x, int y){
        if(this.x == x && this.y == y)
            return true;

        for(int i = 0; i < xPositions.size(); i++)
            if(xPositions.get(i) == x && yPositions.get(i) == y)
                return true;
        
        return false;
        
    }

    public void display(){
        pushMatrix();
        pushStyle();
        
        strokeWeight(0);

        fill(50, 255, 50);
        rect(x * scale, y * scale, squareWidth, squareWidth);

        fill(0, 255, 0);
        for(int i = 0; i < xPositions.size(); i++)
            rect(xPositions.get(x) * scale, xPositions.get(y) * scale, squareWidth, squareWidth);

        popStyle();
        popMatrix();
    }

    public void reset(){
        xDir = yDir = 0;
        x = y = (int)(gameSize / 2);
    }

    public String direction(){
        if(xDir == 1)
            return "right";
        if(xDir == -1)
            return "left";
        if(yDir == 1)
            return  "down";
        if(yDir == -1)
            return  "up";
        return "";
    }

    public int x(){
        return x;
    }
    public int y(){
        return y;
    }
    public ArrayList<Integer> xPositions(){
        return xPositions;
    }
    public ArrayList<Integer> yPositions(){
        return yPositions;
    }
}