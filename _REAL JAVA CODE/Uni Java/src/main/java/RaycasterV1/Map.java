package RaycasterV1;

public class Map {


    public Object[][] data;
    public int width;
    public int height;

    public int displayWidth = 4;

    public Map(int x, int y){
        width = x;
        height = y;
        populateMap();
    }

    public void populateMap(){

        data = new Object[width][height];

        for (int y = 0; y < height; y++){
            for (int x = 0; x < width; x++){

                if (x == 0 || x == width-1 || y == 0 || y == height-1){
                    data[x][y] = new Wall();

                }else{
                    data[x][y] = new Air();

                }

            }
        }
    }

}
