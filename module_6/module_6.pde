
Walker[] walkers = new Walker[8];

PVector wind = new PVector(0.2, 0); //constant acceleration to the right

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  initializeWalkers();
}

void draw()
{
  background(255);
  
    stroke(0);
  strokeWeight(2);
  line(0, Window.bottom, 0, Window.top);

  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];

   
    w.applyForce(wind);
    w.applyFriction();

    w.update();
    w.render();
  }
}

// Reset on mouse click
void mousePressed()
{
  initializeWalkers();
}


void initializeWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();

    // Mass increases (1 - 8)
    walkers[i].mass = i + 1;

    // Scale depends on mass
    walkers[i].scale = walkers[i].mass * 15;

    // Position from top to bottom
    float spacing = Window.heightPx / walkers.length;

    float posY = 2 * spacing * (i - walkers.length / 2);

    walkers[i].position = new PVector(Window.left, posY);

    // Random color
    walkers[i].walkerColor = color(random(256), random(256), random(256));
  }
}
