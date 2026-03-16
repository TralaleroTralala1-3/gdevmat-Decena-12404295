public class Walker
{
  //PVector variables 
  PVector position = new PVector();
  PVector speed = new PVector(10, 10);
  
   public float ScalePerlin;
   public float tScale = random(1000);
   
 //Randomize Starting colors 
   public float tColor_R = random(256), tColor_G = random(256), tColor_B = random(256); 
   public float ColorPerlin_R, ColorPerlin_G, ColorPerlin_B;


  void render()
  {
    fill(255); 
    circle(position.x, position.y, 50);
  }
  
void renderParticles()
{
  // Color via Perlin
  ColorPerlin_R = map(noise(tColor_R), 0, 1, 0, 255);
  ColorPerlin_G = map(noise(tColor_G), 0, 1, 0, 255);
  ColorPerlin_B = map(noise(tColor_B), 0, 1, 0, 255);

  // Size via Perlin
  ScalePerlin = map(noise(tScale), 0, 1, 5, 150);


  color PerlinColor = color(ColorPerlin_R , ColorPerlin_G, ColorPerlin_B);

  fill(PerlinColor);
  noStroke();
  circle(position.x, position.y, ScalePerlin);

  tScale += 0.01f;
 
  tColor_R += 0.01f;
  tColor_G += 0.01f;
  tColor_B += 0.01f;
}
  
  void gravitate(PVector target)
{
  PVector direction = PVector.sub(target, position); // vector toward black hole
  direction.normalize(); // keep direction but remove magnitude
  direction.mult(6.5);   // gravity strength

  position.add(direction);
}

void MouseLock()
{
  //Connect Target X & Y to Cursor
  
  Target.position.x = lerp(Target.position.x, mouseX - Window.windowWidth, 0.1);
  Target.position.y = lerp(Target.position.y, -(mouseY - Window.windowHeight), 0.1);
  
}

}
