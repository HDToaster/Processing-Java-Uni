

void setup()
{
size(800,800);
cubePoints[0]=new PVector(0,0,0);
cubePoints[1]=new PVector(1,0,0);
cubePoints[2]=new PVector(1,1,0);
cubePoints[3]=new PVector(0,1,0);
cubePoints[4]=new PVector(0,0,1);
cubePoints[5]=new PVector(1,0,1);
cubePoints[6]=new PVector(1,1,1);
cubePoints[7]=new PVector(0,1,1);

cubeVertex[0]=new PVector(1,2);
cubeVertex[1]=new PVector(1,4);
cubeVertex[2]=new PVector(1,5);
cubeVertex[3]=new PVector(2,3);
cubeVertex[4]=new PVector(2,6);
cubeVertex[5]=new PVector(3,4);
cubeVertex[6]=new PVector(3,7);
cubeVertex[7]=new PVector(4,8);
cubeVertex[8]=new PVector(5,6);
cubeVertex[9]=new PVector(5,8);
cubeVertex[10]=new PVector(6,7);
cubeVertex[11]=new PVector(7,8);
stroke(255);
}
PVector[] cubePoints= new PVector[8];
PVector[] cubeVertex= new PVector[12];
PVector[] ProjCoords=new PVector[8];
float view = radians(90);

PVector pos= new PVector(0,0,-10);
float scale=30;
void draw()
{
  background(0);
  fill(255);
  ProjCoords=new PVector[8];
  for (int i=0; i < ProjCoords.length;i++)
  {
    ProjCoords[i]=new PVector(0,0);
    print("set to: "+ProjCoords[i].x);
  }
  for (int i=0; i < cubePoints.length;i++)
  {
    ProjCoords[i].x = (cubePoints[i].x+pos.x) / ((pos.z+cubePoints[i].z) * tan(view/2))*scale;
    ProjCoords[i].y = (cubePoints[i].y+pos.y) / ((pos.z+cubePoints[i].z) * tan(view/2))*scale;
    //ProjCoords[i].y = ;
    //ProjCoords[i] =new PVector((cubePoints[i].x*scale+pos.x*scale) / (cubePoints[i].z*scale+pos.z*scale) * tan(view/2),
    //  (cubePoints[i].y*scale+pos.y*scale) / (cubePoints[i].z*scale+pos.z*scale)  * tan(view/2)
    //);
    //PVector ProjPos= new PVector ();
    println("x"+ProjCoords[i].x);
    println("y"+ProjCoords[i].y);
    println("i"+i);
    
  }
  
  for (int j=0; j < cubeVertex.length;j++)
  {
    int cV1 = (int) cubeVertex[j].x -1 ;
    float x1 = ProjCoords[cV1].x*width/2+width/2;
    println("Point"+ProjCoords[cV1]);
    
    float y1 = ProjCoords[cV1].y*height/2+height/2;
    
    int cV2 = (int) cubeVertex[j].y -1 ;
     
    float x2 = ProjCoords[cV2].x*width/2+width/2;
    
   
    float y2 = ProjCoords[cV2].y*height/2+height/2;
    println("x"+x1);
    println("x"+x2);
    line(x1,y1,x2,y2);
  }
  rot(cubePoints,new PVector(0.01,0.02,0.03));
  if (keyPressed)
  {
    if (key=='w')
    {
      pos.z+=1;
    }
        if (key=='s')
    {
      pos.z-=1;
    }
        if (key=='d')
    {
      pos.x+=1;
    }
        if (key=='a')
    {
      pos.x-=1;
    }
    
    if (key=='r') 
    {
      rot(cubePoints,new PVector(0.1,0.2,0.3));
    }
    
  }
}

void rot(PVector[] arr,PVector angle)
{
  for (int i=0; i <arr.length;i++)
  {
    float x,y,z;
    x = arr[i].x;
    y = arr[i].y;
    z = arr[i].z;
    arr[i].y = (cos(angle.x)*y) - sin(angle.x)*z;
    arr[i].z = sin(angle.x)*y + cos(angle.x)*z;
    x = arr[i].x;
    y = arr[i].y;
    z = arr[i].z;
    arr[i].x = cos(angle.y)*x + sin(angle.y)*z;
    arr[i].z = -sin(angle.y)*x + cos(angle.y)*z;
    x = arr[i].x;
    y = arr[i].y;
    z = arr[i].z;
    arr[i].x = (cos(angle.z)*x) - sin(angle.z)*y;
    arr[i].y = sin(angle.z)*x + cos(angle.z)*y;
  }
  
}

/*

      --x=x
      y= cos(rx)*y-sin(rx)*z
      z= sin(rx)*y+cos(rx)*z
    
      x= cos(ry)*x +sin(ry)*z
      --y=y
      z=-sin(ry)*x+cos(ry)*z
      
      x= cos(rz)*x - sin(rz)*y
      y=  sin(rz)*x + cos(rz)*y

for o in all(objs) do
    projcoords={}
    local ox,oy,oz=o.pos[1],o.pos[2],o.pos[3]
    for p in all(o.points) do
      local xp=(cx+p[1]+ox)/(cz+p[3]+oz)*tan(fov/2)
      local yp=(cy+p[2]+oy)/(cz+p[3]+oz)*tan(fov/2)
      add(projcoords,{xp,yp})
    end
    local sc=64
    for v in all(o.vertex) do
      line(
      projcoords[v[1]][1]*sc+64,
      projcoords[v[1]][2]*sc+64,
      projcoords[v[2]][1]*sc+64,
      projcoords[v[2]][2]*sc+64)
      --v[1] 
      --v[2]
      --print(projcoords[v[2]][2])
      --print(projcoords[v[1]][1])
    end

rotq=nil
lookdir=0
function _init()
poke(0x5f2d,1)
cube={
  points=
  {
    {0,0,0},
    {1,0,0},
    {1,1,0},
    {0,1,0},
    {0,0,1},
    {1,0,1},
    {1,1,1},
    {0,1,1},
  },
  vertex=
  {
    {1,2},
    {1,4},
    {1,5},
    {2,3},
    {2,6},
    {3,4},
    {3,7},
    {4,8},
    {5,6},
    {5,8},
    {6,7},
    {7,8},
  },
  scale=5,
  pos={0.5,0.5,0.5},

}
objs={}

--add(objs,cube)
--add(objs,picospace(cube))
rotq=move(picospace(cube),{-2,0,50})
add(objs,rotq)

end

function rad(x)
  return (x/180)* 3.14
end
fov=rad(90)
function _update60()

  local b=stat(31)
  
  if b=="z" do
    lookdir+=0.4
  end
  
  
  --rotq=rot(rotq,1,1,1)
  --rotq=move(rotq,{0,0,0.1})
  

  if btn(⬆️) do
  cz+=1
  end
  if btn(⬇️) do
  cz-=1
  end
  if btn(⬅️) do
  cx-=1
  end
  if btn(➡️) do
  cx+=1  
  end
  
  if btn(❎)or b=="r" do
    objs[1]=rot(objs[1],0.02,0.0,0,{0,0,0})
  end
  if btn(🅾️)or b=="t" do
    objs[1]=rot(objs[1],0.02,0,0,{0,0,0})
  end
  
  if b=="1" do
    objs[1].pos[3]+=1
  end

end


cx=0
cy=0
cz=-2

function wait(x)
  for i=0,x do
    flip()
  end
end


function move(obj,vec)
  for p in all(obj.points)do
    p[1]+=vec[1]
    p[2]+=vec[2]
    p[3]+=vec[3]
  end
  return obj
end


function rot(obj,rx,ry,rz,origin)
  --if axis=="x" do
  local s=obj.scale
    --local ox,oy,oz=obj.pos[1],obj.pos[2],obj.pos[3]
  --print(s)
  --wait(10)
  local ox,oy,oz=0,5,5
    for p in all(obj.points)do
      local x,y,z=(p[1]-ox)*s,(p[2]-oy)*s,(p[3]-oz)*s
      --x=x
      y= cos(rx)*y-sin(rx)*z
      z= sin(rx)*y+cos(rx)*z
    
      x= cos(ry)*x +sin(ry)*z
      --y=y
      z=-sin(ry)*x+cos(ry)*z
      
      x= cos(rz)*x - sin(rz)*y
      y=  sin(rz)*x + cos(rz)*y

      p[1],p[2],p[3]=(x)/s+ox,(y)/s+oy,(z)/s+oz
    end
  --end
  
  return obj
end

function rotp(p,rx,ry,rz)

end

function _draw()
  cls()
  for o in all(objs) do
    projcoords={}
    local ox,oy,oz=o.pos[1],o.pos[2],o.pos[3]
    for p in all(o.points) do
      local xp=(cx+p[1]+ox)/(cz+p[3]+oz)*tan(fov/2)
      local yp=(cy+p[2]+oy)/(cz+p[3]+oz)*tan(fov/2)
      add(projcoords,{xp,yp})
    end
    local sc=64
    for v in all(o.vertex) do
      line(
      projcoords[v[1]][1]*sc+64,
      projcoords[v[1]][2]*sc+64,
      projcoords[v[2]][1]*sc+64,
      projcoords[v[2]][2]*sc+64)
      --v[1] 
      --v[2]
      --print(projcoords[v[2]][2])
      --print(projcoords[v[1]][1])
    end
    
  end
  
  
end

function picospace(obj)
  for p in all(obj.points) do
      p[1]*=10
      p[2]*=10
      p[3]*=10
  end
  return obj
end

function tan(a)
  return sin(a)/cos(a)
end
*/
