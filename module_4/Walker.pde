public class Walker
{
  public PVector position = new PVector();
  public PVector acceleration = new PVector(); 
  public PVector velocity = new PVector();
  
  public float velocityLimit = 10; 
  public float scale;
  public color walkerColor; 
  
  public Walker()
  {
    scale = random(10, 60); 
    
    int R = (int)random(256); // 0 - 255 range; it's 256 because it only goes until the given value minus 1 
    int G = (int)random(256);
    int B = (int)random(256); 

   walkerColor = color(R,G,B); 

  }
  
public void update()
{
  // Random movement
  PVector randomAcc = PVector.random2D().mult(0.1);

  // Mouse attraction
  PVector mouse = new PVector(
    mouseX - width/2,
    -(mouseY - height/2)
  );

  PVector dir = PVector.sub(mouse, position);
  dir.normalize();
  dir.mult(0.2); // strength of attraction

  // Combine both
  acceleration = new PVector();
  acceleration.add(randomAcc);
  acceleration.add(dir);

  // Apply motion
  velocity.add(acceleration);
  velocity.limit(velocityLimit);
  position.add(velocity);
}
  public void render()
  {
    
    fill(walkerColor);
    circle(position.x, position.y, scale);
    
  }
  
  public void checkEdges()
  {
    
    if (this.position.x > Window.right)
    {
      
      this.position.x = Window.left;
      
    }
    else if (this.position.x < Window.left)
    {
      
      this.position.x = Window.right; 
    }
    
     if (this.position.y > Window.top)
    {
      
      this.position.y = Window.bottom;
      
    }
    else if (this.position.y < Window.bottom)
    {
      
      this.position.y = Window.top; 
    }
    
  }
}
