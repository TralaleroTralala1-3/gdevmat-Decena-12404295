
Walker Target = new Walker();
ArrayList<Walker> particles = new ArrayList<Walker>(); 


void setup()
{
   camera(0, 0,Window.eyeZ, 0, 0, 0, 0, -1, 0);
   size(1280, 720, P3D);
   
  
   for (int i = 0; i < 100; i++)
{
   Walker w = new Walker();

 w.position.x = (float)randomGaussian() * (Window.windowWidth / 2);
 w.position.y = (float)randomGaussian() * (Window.windowHeight / 2);
 
   particles.add(w);
}

   Target.position.x = random(-Window.windowWidth, Window.windowWidth); 
   Target.position.y = random(-Window.windowHeight, Window.windowHeight); 
 
}

void draw()
{
  float n = 150; //number of frames till screen flushes
  
   background(0);


if (frameCount % n == 0)
{
   println("FLUSHING SCREEN");
   background(0);

   //Reset Particle Positions 
   for (Walker p : particles)
   {
      p.position.x = random(Window.left, Window.right);
      p.position.y = random(Window.bottom, Window.top);
   }
   
   //Spawns Target randomly within the screen
   Target.position.x = random(-Window.windowWidth, Window.windowWidth); 
   Target.position.y = random(-Window.windowHeight, Window.windowHeight); 
}

  //Lock Target X & Y to mouse
   Target.MouseLock();

   // draw black hole
   Target.render();

   // update particles
   for (Walker p : particles)
   {
      p.gravitate(Target.position);
      p.renderParticles();
   }
}
