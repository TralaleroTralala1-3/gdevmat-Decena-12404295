

Walker[] walkers = new Walker[10];

PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);
void setup()
{
  size(1280,720, P3D);
  camera(0,0,Window.eyeZ,0,0,0,0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();

    // mass from 1 to 10
    walkers[i].mass = i + 1;

    // scale based on mass
    walkers[i].scale = walkers[i].mass * 15;

    
    walkers[i].position = new PVector(-500, 200);

    // random color
    walkers[i].walkerColor = color(random(256), random(256), random(256));
  }
  
}



void draw()
{
  background(80);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].applyForce(gravity);
    walkers[i].applyForce(wind);

    walkers[i].update();
    checkEdgesBounce(walkers[i]);
    walkers[i].render();
  }
  
}

void checkEdgesBounce(Walker w)
{
  if (w.position.x > Window.right || w.position.x < Window.left)
  {
    w.velocity.x *= -1;
  }

  if (w.position.y > Window.top || w.position.y < Window.bottom)
  {
    w.velocity.y *= -1;
  }
}
