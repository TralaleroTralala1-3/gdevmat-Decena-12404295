public class Walker
{
  //move PVector variables to Walker class
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);

  void renderBouncingWalker()
  {
    
    fill(182, 52, 100);
    circle(position.x, position.y, 50);
    
  }
  
  void renderRandomWalker() //Made a separate render to add color to the other walker
  {
    color Pink = color(255, 0, 255); 
    fill(Pink);
    noStroke();
    circle(position.x, position.y, 30);

  }
  
 
  void moveAndBounce()
  {
    
  position.x += speed.x;
  position.y += speed.y;
  
  if ((position.x > Window.right) || (position.x < Window.left))
  {
    
    speed.x *= -1;
    
  }
  
   if ((position.y > Window.top) || (position.y < Window.bottom))
  {
    
    speed.y *= -1;
    
  }
    
  }
  
   void randomWalk()
   {
     
    int rng = int(random(4)); 
    int walkDistance = int(random(5,20)); //Randomize Walk distance between 5 & 20 
    
    if (rng == 0)
    {
        position.y+=walkDistance; //Up
    }
    
     else if (rng == 1)
    {
        position.y-=walkDistance; //Down
    }
    
       else if (rng == 2)
    {
        position.x+=walkDistance; //Right
    }
    
       else if (rng == 3)
    {
        position.x-=walkDistance; //Left 
    }

     
   }
}
