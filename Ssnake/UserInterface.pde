import processing.sound.*;

public class UserInterface{
    
    public UserInterface(int scale_) {

    }
    
    public void display() {
        displayBackground();
        currentGUI.display();
        checkGoto("");
    }
    
    private void checkGoto(String goTo) {
        if (goTo == "")
            goTo = currentGUI.goTo();
        
        if (goTo.equals(""))
            return;
        if (goTo.equals("main")) 
            currentGUI = main;
    }
    
    public void displayBackground() {

    }
    
    public void pause() {
        if (!(inGame || currentGUI.equals(pause)))
            exit();
        
        inPause = !inPause;
        inGame = !inGame;
        currentGUI = pause;
    }
    
    public void keyPressed() {
        currentGUI.keyPressed();
    }
    
    public void mousePressed() {
        currentGUI.mousePressed();
    }
    
    public void mouseReleased() {
        currentGUI.mouseReleased();
    }
}