

public int[] fields=new int[37];
public int cellSize=15;
UIButton b;
UIButton r;
int ballpos, rolls;
boolean isRolling=false;

int cash=100;

int bet=0;


void setup()
{
  size(1000, 600);

  fields=makeCells();

  r=new UIButton(700, 20, 80, 80, color(255, 0, 0));
  b=new UIButton(780, 20, 80, 80, color(0, 0, 0));
}


void draw()
{
  drawCells();
  fill(255);
  circle(ballpos*cellSize+10, cellSize, cellSize);
}

void drawCells()
{
  background(60);
  for (int i=0; i < fields.length; i++)
  {
    if (i==0)
    {
      fill(0, 255, 0);
    } else if (i%2==0)
    {
      fill(255, 0, 0);
    } else
    {
      fill(0, 0, 0);
    }
    rect(i*cellSize, 0, cellSize, cellSize);
    stroke(4);
    fill(0);
    text(i, i*cellSize+3, 40, 3);
  }
  if (isRolling) {

    if (rolls>0)
    {
      rolls-=1;
      ballpos+=1;
      if (ballpos>fields.length-1)
      {
        ballpos=0;
      }
    } else {
      isRolling=false;
      checkWin();
    }

    return;
  }
  b.drawButton();
  if (b.isPressed())
  {
    bet=0;
    roll();
  }
  r.drawButton();
  if (r.isPressed())
  {
    bet=1;
    roll();
  }
  text(cash, 400, 400, 40);
}

public void checkWin()
{
  if (ballpos==0)
  {
    cash/=2;
    return;
  }
  if (bet==1 &&ballpos%2==0)
  {
    cash*=2;
    return;
  }
  println(1+ballpos%2);
  if (bet==0 &&1+ballpos%2==2)
  {
    cash*=2;
    return;
  }
  if (bet==1&& 1+ballpos%2==2)
  {
    cash/=2;
    return;
  }
  if (bet==0&& ballpos%2==0)
  {
    cash/=2;
    return;
  }
}

public void roll()
{
  isRolling=true;
  ballpos=(int)random(37);
  rolls=(int)random(100);
}

int[] makeCells()
{
  int[] field=new int[37];
  for (int i=0; i <37; i++)
  {
    field[i]=i;
  }
  return field;
}
