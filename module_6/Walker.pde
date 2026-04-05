public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float mass = 1;
  public float scale = 20;

  public color walkerColor;

  // Friction coefficient
  public float mu = 0.01f;

  public void applyForce(PVector force)
  {
    //include mass in acceleration (F = ma -> a = F/m)
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void applyFriction()
  {
    // Change friction when beyond midpoint
     if (position.x > 0)
      mu = 0.4f;
    else
      mu = 0.01f;

    if (velocity.mag() > 0)
    {
      PVector friction = velocity.copy();
      friction.normalize();
      friction.mult(-1);

      float normal = mass; 
      friction.mult(mu * normal);

      applyForce(friction);
    }
  }

  public void update()
  {
    velocity.add(acceleration);
    position.add(velocity);

    acceleration.mult(0);
  }

  public void render()
  {
    fill(walkerColor);
    noStroke();
    circle(position.x, position.y, scale);
  }
}
