//Called at first frame
void setup()
{
  size(1280, 720, P3D); //Set window size to 1280 x 720
  camera(0,0, -(height/2.0) / tan(PI*30.0/ 180.0), 0, 0,0,0,-1,0);
}
//Called every frame
void draw()
{
  
   background(0); //Render every frame color as black for the background 
   
  //Basic draw line below 
 // ===========================================
 
  //circle(0,0,50);
  
  //strokeWeight(4); // changes thickness of line below it
  //color white = color(255,255,255); // declare color variable (R,G,B)
  //fill(white); // uses selected color
  //stroke(white); // uses selected color for the stroke 
  //line(-75, -75, 75, 75); //draws line (x1, y1, x2, y2)
  
  // ===========================================
  
  drawCartesianPlane(); //Call function
  //drawLinearFunction();
  //drawQuadraticFuntion();
  //drawCircle();
  
  drawQuestionNo1();
  drawQuestionNo2();
  drawSineWave();
}

void drawCartesianPlane() //Setup a function to keep draw function clean
{
  
   //Drawing cartesian plane base
  strokeWeight(3);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  // Main X & Y lines
  line(300,0,-300,0);
  line(0,300,0,-300); // x1, y1, x2, y2 
  
  // X & Y units
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -3, i, 3); // X units
  }
}

void drawLinearFunction()
{
  
  /*
  f(x) = x + 2
  let x be 4, then y = 6 (4,6)
  let x be -5, then y = -3 (-5,-3)
  */
  color white = color(255, 255, 255); 
  fill(white);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    
    circle(x, x + 2 , 3);
    
  }
}

void drawQuadraticFuntion()
{
  
  /*
  
  f(x) = x^2 + 2x - 5;
  Let x be 2, then y = 3
  Let x be - 1, then y = -6
  
  */
  
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    
    circle(x * 10, ((float)Math.pow(x,2) + (x * 2) - 5), 5);
    
  }
  
}

void drawCircle()
{
  
  color white = color(255,255,255);
  fill (white);
  stroke (white);
  
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
    
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 3);
  }
  
  
}


void drawQuestionNo1()
{
  
   
  
  //f(x) = x^2 - 15x - 3;
  color yellow = color (255, 255, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();
  
  for (float x = -200; x <= 200; x+=0.1f)
  {
    
    circle(x * 5, ((float)Math.pow(x,2) - (x * 15) - 3),  5);
    
  }
}

void drawQuestionNo2()
{
  //f(x) = -5x + 30 
  color purple = color(128, 0, 128);
  fill(purple);
  stroke(purple);
  noStroke();
  for (float x = -200; x <=200; x+=0.1f) // used float & x+= 0.1f for smoother line
  {
    
    circle(x, (-5 * x) + 30, 5);
    
  }
  
}
void drawSineWave()
{
  
  color pink = color(255,192,203);
  fill (pink);
  noStroke();
  
    float time = frameCount * 0.3;  // controls speed

 for (int x = -300; x <= 300; x++)
 {
   /* 
   
   
   formula for Sine wave: 
    y = Asin(Bx - C) + D
    
    A = Amplitude (Height of Peaks)
    B = Wavelength (Distance between peaks)
    C = Horizontal shift
    D =  vertical shift 
    try to sketch:
    
    y = 50sin(2x) + 1
    
   */
   
   float y = 50 * ((float)Math.sin(0.05 * x - time)) + 1;
   
   circle(x,y,5);
   
 }
  
  
}
