package Renderer;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ObjectCreator {

    public static Object createNewObject(String filepath){
        Object newObject = new Object(0,0,0);

        newObject.triangles = getTriangles(filepath);

        return  newObject;
    }


    public static ArrayList<Face> getTriangles(String filepath){

        ArrayList<Point> points = new ArrayList<>();
        ArrayList<Face> triangles = new ArrayList<>();



        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(filepath))){

            String line;

            while ((line = bufferedReader.readLine()) != null){

                if (line.charAt(0)=='#'){
                    continue;
                }
                if (line.charAt(0)=='v' && line.charAt(1)==' '){
                    String[] tokens = line.split(" ");

                    Point newPoint = new Point();

                    newPoint.x = Float.parseFloat(  tokens[1]);
                    newPoint.y = Float.parseFloat(  tokens[2]);
                    newPoint.z = Float.parseFloat(  tokens[3]);

                    points.add(newPoint);

                }


                if (line.charAt(0)=='f' && line.charAt(1)==' ') {
                    String[] tokens = line.split(" ");

                    for (int i = 1; i < tokens.length; i++){
                        String[] smallTokens = tokens[i].split("/");

                        

                        for (int y = 0; y < smallTokens.length; y++){

                        }
                    }
                }

            }


        }catch (IOException e){
            e.printStackTrace();
        }

        return triangles;

    }


}
