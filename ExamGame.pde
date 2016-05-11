//git add . 
//git commit -m ""
//git push

void setup() 
{
  size(600, 600);

  box_X = planeX + planeLength * 0.5f;
}
//plane
float planeX = 300;
float planeY = 100;
float planeLength = 60;
float planeHeight = 30;
float planeSpeed = 3;
//box
float box_Y = planeY + planeHeight;
float box_X;
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

void draw()
{
  layoutBG();
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
    }
  }
}

void person()
{
  fill(237, 153, 216);
  rect(personX, personY, personWidth, personHeight);
  //contact with box
  if (personX >= box_X)
  {
    personSpeed *= -1;
  }
  if (personX < 20)
  {
    personSpeed *= 0;
  }
}