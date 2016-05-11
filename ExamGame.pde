//git add . 
//git commit -m ""
//git push

void setup() 
{
  size(600, 600);
}
//plane
float planeX = 300;
float planeY = 100;
float planeLength = 60;
float planeHeight = 30;
float planeSpeed = 3;
//box
float box_Y = planeY + planeHeight;
float boxLength = 10;
float boxHeight = 10;
float boxSpeed = 5;
//ground
float groundX = 0;
float groundY = 400;
float groundLength = 600;
float groundHeight = 200;

void draw()
{
  layoutBG();
  plane();
  boxDisplay();
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
  fill(211, 211, 211);
  rect(planeX, planeY, planeLength, planeHeight);
  //movement
  if (planeX < 600)
  {
    planeX += planeSpeed;
  }
  //circling
  if (planeX >= 600)
  {
    planeX = 0 - planeLength;
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
      box_X = boxSpeed;
    }
  }
}