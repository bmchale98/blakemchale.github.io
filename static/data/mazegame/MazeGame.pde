/* @pjs preload="/data/mazegame/key.png","/data/mazegame/gate.png","/data/mazegame/charactersprite.png"; */
//import processing.serial.*;

//static final int PORT_INDEX = 2, BAUDS = 9600;

//int[] vals;
import java.util.Arrays;

int[] exclude = {2,3,4,5};

PImage KeyPhoto;
PImage GatePhoto;
PImage WallPhoto;
PImage SpritePhoto;
int cols = 41;
int rows = 41;
int vision = 3;
//int[][] walls = new int[cols][rows];
int[][] walls = {
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
{1,0,1,8,1,0,1,0,1,1,1,1,1,0,1,1,1, 1 ,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1},
{1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,1},
{1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1},
{1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0, 8 ,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,1},
{1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1},
{1,0,1,0,1,0,0,0,1,0,1,6,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,1},//
{1,0,1,1,1,0,1,0,1,0,1,7,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1},
{1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1},
{1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1},
{1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1},
{1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1},
{1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1},
{1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1},
{1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1},
{1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1},
{1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1},
{1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1},
{1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,1},
{1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1},
{1,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1},
{1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1},
{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1},
{1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,0,1},
{1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1},
{1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1},
{1,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1},
{1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,7,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1},//
{1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1},
{1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1},
{1,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,1,0,1},
{1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1},
{1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1},
{1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1},
{1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,1},
{1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1},
{1,0,0,0,0,0,0,0,8,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1},
{1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,8,1,1,1,0,1},
{5,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,4},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
};
int[][] tempWalls = {
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
{0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
{1,0,1,8,1,0,1,0,1,1,1,1,1,0,1,1,1, 1 ,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1},
{1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,1},
{1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1},
{1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0, 8 ,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,1},
{1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1},
{1,0,1,0,1,0,0,0,1,0,1,6,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,1},//
{1,0,1,1,1,0,1,0,1,0,1,7,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1},
{1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1},
{1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1},
{1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,1},
{1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1},
{1,0,0,0,1,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1},
{1,1,1,1,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1},
{1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1},
{1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1},
{1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,1},
{1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1},
{1,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,1,0,1},
{1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1},
{1,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1},
{1,0,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,1,1},
{1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1},
{1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,0,1,1,1,1,1,1,1,0,1},
{1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1},
{1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,1,1},
{1,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1},
{1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,7,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1},//
{1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1},
{1,1,1,0,1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1},
{1,0,1,0,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,1,0,1},
{1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1},
{1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1},
{1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,0,1,1,1},
{1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,1},
{1,0,1,0,1,0,1,1,1,1,1,0,1,1,1,0,1,0,1,1,1,0,1,1,1,0,1,0,1,0,1,0,1,1,1,1,1,0,1,0,1},
{1,0,0,0,0,0,0,0,8,0,0,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1},
{1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,8,1,1,1,0,1},
{5,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,4},
{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
};
char Left = 'a';
char Right = 'd';
char Up = 'w';
char Down = 's';
char Reset = '1';
char Lights = '2';
//float width = 1000;
//float height = 1000;
boolean placed = false;
boolean light = false;
boolean GameState = true;
boolean AI1 = false;
boolean AI2 = false;
boolean Key1 = false;
boolean god = false;
int count =0;
boolean TimeOn = false;
int startTime = 0;
Sprite sprite = new Sprite(0,1);  //Starting position for sprite (0,1), end 1 (35,38), end 2 (4,39)


void setup()
{
  //fullScreen();
  background(255,255,255);
  size(750,750);
  frameRate(60);
  //noLoop();
  //final String[] ports = Serial.list();
  //printArray(ports);
  //new Serial(this, ports[PORT_INDEX], BAUDS).bufferUntil(ENTER);
  KeyPhoto = loadImage("/data/mazegame/key.png");
      KeyPhoto.resize(width/rows,height/cols);
  GatePhoto = loadImage("/data/mazegame/gate.png");
      GatePhoto.resize(width/rows,height/cols);
  //WallPhoto = loadImage("wallsprite2.jpg");
      //WallPhoto.resize(width/rows,height/cols);
  SpritePhoto = loadImage("/data/mazegame/charactersprite.png");
      SpritePhoto.resize(width/rows,height/cols);
}
void myDelay(int delay) {
  
  if (TimeOn == false)
  {
    TimeOn = true;
    startTime = millis();
  }
  if ((millis() >= startTime + delay) & TimeOn)
  {
    TimeOn = false;
  }
}
void draw()
{
  if (TimeOn == false)
  {
    if (GameState)
    {
      sprite.move();
      if (light)
      {
        sprite.Light();
      }
      else
      {
        sprite.shadow();
      }
      
    }
    else //user reaches end
    {
      //background(0,0,0);
      sprite.move();
      if (AI1)
      {
        textSize(width/10);
        fill(255,255,255);
        textAlign(CENTER);
        text("1 2 3 4",width/2,height/2);
        textSize(width/50);
        text("AI 1 has been chosen",width/2,(height/2)+(height/10));
      }
      else if (AI2)
      {
        textSize(width/10);
        fill(255,255,255);
        textAlign(CENTER);
        text("4 3 2 1",width/2,height/2);
        textSize(width/50);
        text("AI 2 has been chosen",width/2,(height/2)+(height/10));
      }
      god = true;
      //println("You won");
    }
  }
  myDelay(100);
}
/*
void serialEvent(final Serial s) {
  vals = int(splitTokens(s.readString()));
  //vals = float(splitTokens(s.readString()));
  redraw = true;
}
*/
int CheckBox(int x, int y, int xpos, int ypos)
{
  if (tempWalls[y][x] == 1)//Solid Wall
  {        
    fill(150,150,150);
    rect(x*(width/rows),y*(height/cols),width/rows,height/cols);
    //image(KeyPhoto, x*(width/rows),y*(height/cols));
  }
  else if (tempWalls[y][x]==0)//No wall
  {
    fill(255,255,255);
  }
  else if (tempWalls[y][x]==3)//light block
  {
    fill(0,255,0);
  }
  else if (tempWalls[y][x]==4)//AI 1
  {
    fill(135,206,250);
  }
  else if (tempWalls[y][x]==5)//AI 2
  {
    fill(255,165,0);
  }
  else if (tempWalls[y][x]==6)//Key
  {
    //fill(255,165,165);
    fill(255,255,255);
    rect(x*(width/rows),y*(height/cols),width/rows,height/cols);
    image(KeyPhoto, x*(width/rows),y*(height/cols));
  }
  else if (tempWalls[y][x]==7)//Key wall
  {
    //fill(255,100,165);
    fill(255,255,255);
    rect(x*(width/rows),y*(height/cols),width/rows,height/cols);
    image(GatePhoto, x*(width/rows),y*(height/cols));
  }
  else if (tempWalls[y][x]==8)//fake wall
  {
    if ( ((x-1)==xpos && (/*(y-1)==ypos || (y+1)==ypos ||*/ y==ypos)) || ((x+1)==xpos && (/*(y+1)==ypos || (y-1)==ypos || */y==ypos)) || (x==xpos && ((y+1)==ypos || (y-1)==ypos /*|| y==ypos*/)) )
    {
      fill(255,255,255);
    }
    else
    {
      fill(130);
      rect(x*(width/rows),y*(height/cols),width/rows,height/cols);
      //image(WallPhoto, x*(width/rows),y*(height/cols));
    }
  }
  if (tempWalls[y][x] == 6)
  {}
  else if (tempWalls[y][x] == 7)
  {}
  else
  {
    rect(x*(width/rows),y*(height/cols),width/rows,height/cols);
  }
    
  return tempWalls[y][x];
}

void generateMaze()
{
    int MazeWalls[rows][cols];
    for (int i = 0; i < rows; i++)
    {
        MazeWalls[i][0] = 1;
        MazeWalls[i][cols-1] = 1;
    }
    for (int i = 0; i < cols; i++)
    {
        MazeWalls[0][i] = 1;
        MazeWalls[rows - 1][i] = 1;
    }
    int startSide = random(0,1);
    int startLoc;
    if (startSide == 0)
    {
        startLoc = random(1,rows-2);
        MazeWalls[startLoc][0] = 0;
    }
    else if (startSide == 0)
    {
        startLoc = random(1,cols-2);
        MazeWalls[0][startLoc] = 0;
    }

}

class Sprite
{
  int xpos;
  int ypos;
  int possibleX;
  int possibleY;
  Sprite(int xposin, int yposin)
  {
    xpos = xposin;
    ypos = yposin;
  }
  void move()
  {
    if (keyPressed == true)
    {
      if (key == Reset)
      {
        xpos = 0; ypos = 1; Key1 = false; AI1 = false; AI2 = false; GameState = true;
        for (int i = 0; i < walls.length;i++)
        {
          arrayCopy(walls[i], 0, tempWalls[i], 0, tempWalls[0].length);
        }
      }
      possibleX = xpos;
      possibleY = ypos;
      /*
      if (key == Lights && !light)
      {
        light = true;
      }
      else if (key == Lights && light)
      {
        light = false;
      }
      */
      if(key == Left){
        possibleX = xpos - 1;
      }
      else if (key == Right){
        possibleX = xpos + 1;
      }
      else if (key == Up){
        possibleY = ypos - 1;
      }
      else if (key == Down)
      {
        possibleY = ypos + 1;
      }
      else{}
      if (possibleX < 0)
      {
        possibleX = 0;
      }
      else if (possibleX >= rows)
      {
        possibleX = rows - 1;
      }
      if (possibleY < 0)
      {
        possibleY = 0;
      }
      else if (possibleY >= cols)
      {
        possibleY = cols - 1;
      }
      if (tempWalls[possibleY][possibleX]==1)
      {
        //println("BOOOOOOOO");
      }
      else if (tempWalls[possibleY][possibleX]==0)
      {
        //CheckBox(xpos,ypos);
        if (tempWalls[ypos][xpos]==3)
        {
          light = false;
        }
        xpos = possibleX;
        ypos = possibleY;
      }
      else if (tempWalls[possibleY][possibleX]==3)
      {
        //CheckBox(xpos,ypos);
        xpos = possibleX;
        ypos = possibleY;
        light = true;
      }
      else if (tempWalls[possibleY][possibleX]==4)
      {
        GameState = false;
        AI1 = true;
      }
      else if (tempWalls[possibleY][possibleX]==5)
      {
        GameState = false;
        AI2 = true;
      }
      else if (tempWalls[possibleY][possibleX]==6)
      {
        Key1 = true;
        xpos = possibleX;
        ypos = possibleY;
        tempWalls[possibleY][possibleX] = 0;
      }
      else if (tempWalls[possibleY][possibleX]==7)
      {
        if(Key1)
        {
          //CheckBox(xpos,ypos);
          xpos = possibleX;
          ypos = possibleY;
        }
      }
      else if (tempWalls[possibleY][possibleX]==8)
      {
        xpos = possibleX;
        ypos = possibleY;
      }
      else{ }
      
      if (key == 'f' && !god)
      {
        god = true;
      }
      else if (key == 'f' && god)
      {
        god = false;
      }
      if (god)
      {
        xpos = possibleX;
        ypos = possibleY;
      }
      if (!GameState)
      {
        background(0,0,0);
        fill(255,0,0);
        rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
        image(SpritePhoto, xpos*(width/rows),ypos*(height/cols));
      }
      //println("X pos: ", xpos + 1, "Y pos:", ypos + 1,"            Wall: ", tempWalls[possibleY][possibleX]);
    }
  }
  void shadow()
  {
    background(0,0,0);
    int sightX = xpos - vision;
    int sightY = ypos - vision;
    if(sightX < 0)
    {
      sightX = 0;
    }
    else if (sightX + (vision*2) >= rows)
    {
      sightX = rows - (vision*2 + 1);
    }
    if (sightY < 0)
    {
      sightY = 0;
    }
    else if (sightY + vision*2 >= cols)
    {
      sightY = cols - (vision*2 + 1);
    }
    
    fill(135,206,250);
    rect(40*(width/rows),39*(height/cols),width/rows,height/cols);
    fill(255,165,0);
    rect(0*(width/rows),39*(height/cols),width/rows,height/cols);
    
    for (int i = 0; i < vision*2+1; i++)
    {
      for(int j = 0; j < vision*2+1; j++)
      {
        int x = sightX+j;
        int y = sightY+i;
        CheckBox(x, y, xpos, ypos);
      }
    }
    
    //fill(255,0,0);
    //rect(xpos*(width/rows), ypos*(height/cols),width/rows,height/cols);
    fill(255,0,0);
    rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
    image(SpritePhoto, xpos*(width/rows),ypos*(height/cols));
  }
  void Light()
  {
    
    for(int i = 0; i < cols; i++)
    {
      for(int j = 0; j < rows; j++)
      {

        /*
        if (count==i)
        {
          Arrays.sort(exclude);
          //tempWalls[i][j] = (int)random(9);
          do {
              tempWalls[i][j] = (int) random(0, 8);
          } 
          while (Arrays.binarySearch(exclude, tempWalls[i][j]) >= 0);
        }
       */
        CheckBox(j, i, xpos, ypos);
      }
    }
    count++;
    if (count == 40)
    {
      count = 0;
    }
    
    //fill(255,0,0);
    //rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
    fill(255,0,0);
    rect(xpos*(width/rows),ypos*(height/cols),width/rows,height/cols);
    image(SpritePhoto, xpos*(width/rows),ypos*(height/cols));
  }
}
        
