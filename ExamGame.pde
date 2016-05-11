//git add . 
//git commit -m ""
//git push

void setup() 
{
  size(600, 600);
}

//plane
float planeX = 0 - 150;
float planeY = 100;
float planeLength = 60;
float planeHeight = 30;
float planeSpeed = 3;
//box
float box_Y = planeY + planeHeight;
float box_X = planeX + planeLength * 0.5f;
float boxLength = 10;
float boxHeight = 10;
float boxSpeed = 5;
//ground
float groundX = 0;
float groundY = 400;
float groundLength = 600;
float groundHeight = 200;
//person
float personX = 20;
float personY = 480;
float personWidth = 15;
float personHeight = 40;
float personSpeed = 3;
//clouds
float cloudX = 300;
float[] cloudY = {100, 150, 200};
float cloudSpeed = 4;

void draw()
{
  frameRate(60);
  layoutBG();
  clouds();
  plane();
  boxDisplay();
  person();
}

void layoutBG()
{
  background(121, 167, 245);
  noStroke();
  fill(122, 237, 142);
  rect(groundX, groundY, groundLength, groundHeight);
}

void plane()
{
  //drawing plane
  rectMode(CORNER);
  fill(211, 211, 211);
  rect(planeX, planeY, planeLength, planeHeight);
  triangle(planeX, planeY, planeX - 30, planeY - 30, planeX, planeY + planeHeight);
  triangle(planeX + planeLength, planeY, planeX + planeLength + 30, planeY + planeHeight, planeX + planeLength, planeY + planeHeight);
  rectMode(CENTER); 
  rect(planeX + planeLength * 0.5f, planeY + planeHeight * 0.5f, 25, 70);
  rectMode(CORNER);
  //windows
  for (int i = 0; i < 3; i ++)
  {
    fill(0);
    rect(planeX + i * 22, planeY + 8, 13, 13);
  }
  //movement
  if (planeX < 600 + planeLength)
  {
    planeX += planeSpeed;
  }
  //circling
  if (planeX >= 600 + planeLength)
  {
    planeX = 0 - planeLength - 40;
  }
} 

void boxDisplay()
{
  float box_X = planeX + planeLength * 0.5f;

  if (key == ' ') 
  {
    fill(255, 0, 0);
    rect(box_X, box_Y, boxLength, boxHeight);
    box_Y += boxSpeed;
    //impact
    if (box_Y > groundY + groundHeight * 0.5f)
    {

      boxSpeed = 0;
      personX += personSpeed;
      //contact with box
      if (personX >= box_X)
      {
        personSpeed *= -1;
      }
    }
  }
}

void person()
{
  fill(237, 153, 216);
  rectMode(CENTER);
  rect(personX, personY, personWidth, personHeight);
  ellipse(personX, personY - 35, 20, 20);
  stroke(237, 153, 216);
  line(personX, personY, personX - 20, personY - 30);
  line(personX, personY, personX + 20, personY - 30);
  line(personX - 5, personY, personX - 5, personY + 50);
  line(personX + 5, personY, personX + 5, personY + 50);
  rectMode(CORNER);
  //standing still
  if (personX < 20)
  {
    personSpeed *= 0;
  }
}

void clouds()
{
  //draw the clouds
  fill(255);
  for (int i = 0; i < cloudY.length; i++)
  {
    ellipse(cloudX + i * 200, 50 + i * 70, cloudY[i], 50);
  }
  cloudX -= cloudSpeed;
  //circling
  if (cloudX + 500 < 0)
  {
    cloudX = 600 + 50;
  }
}