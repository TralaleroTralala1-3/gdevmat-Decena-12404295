
public class Walker
{
  
 public float x; 
 public float y; 
 public float tx = 0, ty = 10000;
 
 public float ScalePerlin;
 public float tScale = 1;
 
 //Randomize Starting colors 
 public float tColor_R = random(256), tColor_G = random(256), tColor_B = random(256); 
 public float ColorPerlin_R, ColorPerlin_G, ColorPerlin_B;

  void render()
  {
    
    //Randomize Color via Perlin w/ mapped range of 0 - 255
    ColorPerlin_R = map(noise(tColor_R), 0, 1, 0, 255);
    ColorPerlin_G = map(noise(tColor_G), 0, 1, 0, 255);
    ColorPerlin_B = map(noise(tColor_B), 0, 1, 0, 255);
    
    ScalePerlin = map(noise(tScale), 0, 1, 5, 150); //Randomize Scale via Perlin w/ mapped range of 5 - 150
 
    color PerlinColor = color(ColorPerlin_R , ColorPerlin_G,  ColorPerlin_B);
     
    fill(PerlinColor);
    noStroke();
    circle(x, y, ScalePerlin);
    
  tScale += 0.01f;
  tColor_R += 0.01f;
  tColor_G += 0.01f;
  tColor_B += 0.01f;
  }
  
  void perlinWalk()
  {
    
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360); 
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
}
