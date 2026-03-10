void setup()
{
  size(1020, 720, P3D);
  camera(0,0,-(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1,0);
  
  background(0);
  
}

void draw()
{
  println(frameCount);
  
 if (frameCount % 300 == 0)
  {
    println("FLUSHING SCREEN");
    background(0); // flush screen
  }

  PaintSplatter();
}

void PaintSplatter() 
{
  
 
  float gaussian = randomGaussian();
  
  float standardDeviation = 300;
  float mean = 0;   // center of screen
  
  float x = standardDeviation * gaussian + mean;
  int y = (int)random(-height/2, height/2); 
  noStroke();
  
  float ScaleGauss = randomGaussian();
  float CircleSD = 50;
  float ScaleMean = 0; 
  float Scale = CircleSD * ScaleGauss + ScaleMean;
  
  
  int R = (int)random(256); 
  int G = (int)random(256); 
  int B = (int)random(256); 
  
  
  int RandomAlpha = (int)random(10,101);
  color RandomColor = color(R,G,B, RandomAlpha);
  
  fill (RandomColor);
  noStroke();
  circle(x, y, Scale);
  
}
