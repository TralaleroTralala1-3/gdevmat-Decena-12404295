Liquid ocean;
Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0,0, Window.eyeZ, 0,0,0,0,-1, 0);

  // Create liquid
  ocean = new Liquid(0, 0, Window.right, Window.bottom, 0.1f);

  float spacing = (Window.right - Window.left) / (float)walkers.length;

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();

    // spaced equally side-by-side
    walkers[i].position = new PVector(
      Window.left + spacing * i + spacing/2,
      Window.top + 50 // slightly above screen
    );

    // random mass
    walkers[i].mass = random(4, 20);

    // scale according to mass
    walkers[i].scale = walkers[i].mass * 10;

    // random color
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
  }
}

void draw()
{
  background(255);

  ocean.render();

for (Walker w : walkers)
{
  
  PVector wind = new PVector(0.1f, 0);
  w.applyForce(wind);

 
  PVector gravity = new PVector(0, -0.15f * w.mass);
  w.applyForce(gravity);

  // DRAG (only in liquid)
  if (ocean.isCollidingWith(w))
  {
    PVector drag = ocean.calculateDragForce(w);
    w.applyForce(drag);
  }

  
  w.update();

  // FLOOR COLLISION
  if (w.position.y <= Window.bottom)
  {
    w.position.y = Window.bottom;
    w.velocity.y = 0;
  }

  // FRICTION at bottom 
  if (abs(w.position.y - Window.bottom) < 0.1f)
  {
    float frictionCoeff = 0.05f;
    PVector friction = w.velocity.copy();
    if (friction.mag() > 0)
    {
      friction.normalize();
      friction.mult(-frictionCoeff);
      w.applyForce(friction);
    }
  }

  // SIDE WALLS
  if (w.position.x >= Window.right)
  {
    w.position.x = Window.right;
    w.velocity.x *= -0.5;
  }

  if (w.position.x <= Window.left)
  {
    w.position.x = Window.left;
    w.velocity.x *= -0.5;
  }
  
float frictionCoeff = 0.05f;

if (w.position.y <= Window.bottom + 0.1f)
{
  PVector friction = w.velocity.copy();
  friction.normalize();
  friction.mult(-frictionCoeff);
  w.applyForce(friction);
}
  w.render();
}

}
