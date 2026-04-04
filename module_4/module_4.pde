Walker myWalker = new Walker();
Walker[] walkers = new Walker[100]; 

void setup()
{
  size(1280,720, P3D);
  camera(0,0,Window.eyeZ,0,0,0,0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();

    // optional: spawn at random position
    walkers[i].position.x = random(-Window.windowWidth, Window.windowWidth);
    walkers[i].position.y = random(-Window.windowHeight, Window.windowHeight);
  }
}

//Vector Motion// 
  
  //1. Add velocity to position
  //2. Draw object at postion 

void draw()
{
  
  background(80); 
  
 
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].update();
    walkers[i].checkEdges();
    walkers[i].render();
  } 
  
  
}
