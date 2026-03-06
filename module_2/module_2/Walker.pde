class Walker
{
  
  float x; 
  float y; 
  
   
  void render()
  {
   
    
  //randomize r,g,b values & assign them to new int variables
  int R = (int)random(256); // 0 - 255 range; it's 256 because it only goes until the given value minus 1 
  int G = (int)random(256);
  int B = (int)random(256); 
   
   //Custom alpha variable
   int RandomAlpha = (int)random(50,101); //alpha value from 50 to 100 
   
   
    color RandomColor = color(R, G, B, RandomAlpha); // Plug in custom variables in appropriate parameters 
    fill(RandomColor);
    noStroke();
    circle(x,y, 30);
    
    
  }
  
  void randomWalk()
  {
    
    int rng = int(random(8)); 
    int walkDistance = int(random(5,20)); //Randomize Walk distance between 5 & 20 
    
    if (rng == 0)
    {
        y+=walkDistance; //Up
    }
    
     else if (rng == 1)
    {
        y-=walkDistance; //Down
    }
    
       else if (rng == 2)
    {
        x+=walkDistance; //Right
    }
    
       else if (rng == 3)
    {
        x-=walkDistance; //Left 
    }
    
       else if (rng == 4)
    {
       x+=walkDistance; //upper right
       y+=walkDistance;
       
    }
    
       else if (rng == 5)
    {
       x-=walkDistance; //upper left
       y+=walkDistance;
    }
    
       else if (rng == 6)
    {
       x+=walkDistance; //lower right
       y-=walkDistance;
    }
    
       else if (rng == 7)
    {
       x-=walkDistance; //lower left 
       y-=walkDistance;
    }
 
  }
  
   void randomWalkBiased()
{
  int BiasRng = int(random(4));
  int walkDistance = int(random(5,20));

  int RightChance = 1;

  if (BiasRng <= RightChance)
  {
    x += walkDistance; // move right
  }

  else
  {
    int Rng2 = int(random(3));

    if (Rng2 == 0)
    {
      x -= walkDistance; // left
    }

    else if (Rng2 == 1)
    {
      y += walkDistance; // up
    }

    else if (Rng2 == 2)
    {
      y -= walkDistance; // down
    }
  }
}
}
