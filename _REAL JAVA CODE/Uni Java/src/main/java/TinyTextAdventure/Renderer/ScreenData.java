package TinyTextAdventure.Renderer;


public class ScreenData{


    boolean holdsNum;
    char valueChar = '.';
    int valueNum = 0;


    public ScreenData(){
        this.holdsNum = true;
        this.valueNum =  1;
    }
    public ScreenData(char value){
        this.holdsNum = false;
        valueChar = value;
    }

    public ScreenData(int index){
        this.holdsNum = true;
        this.valueNum = index;
    }

    public char GetValue(){
        if (holdsNum){
            return ASCIIRenderer.GetCharFromIndex(valueNum) ;
        }else
        {
            return valueChar;
        }
    }

    public void SetNumber(int number){
        holdsNum = true;
        valueNum = number;
    }

    public void SetChar(char c){
        holdsNum = false;
        valueChar = c;
    }

}