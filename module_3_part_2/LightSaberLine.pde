public class LightSaberLine
{
   PVector mousePos1()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  
  return new PVector(x,y);
}

  PVector mousePos2()
{
  float x = -(mouseX - Window.windowWidth / 2);
  float y = mouseY - (Window.windowHeight / 2);
  
  return new PVector(x,y);
}
  
  void RenderSaber1()
  {
    
   PVector mouse = mousePos1();

  mouse.normalize().mult(400);
  line(0,0, mouse.x, mouse.y);
  
   // Red outer glow
  stroke(255,0,0);
  strokeWeight(14);
  line(0,0, mouse.x, mouse.y);

  // White inner core
  stroke(255);
  strokeWeight(4);
  line(0,0, mouse.x, mouse.y);
  
  // Black handle 
  PVector handle = mouse.copy().normalize().mult(50);
  stroke(0);
  strokeWeight(14);
  line(-handle.x, -handle.y, handle.x, handle.y);
  
   println(mouse.mag());
    
  }
  
  void RenderSaber2()
  {
    
  PVector mouse = mousePos2();

  mouse.normalize().mult(400);
  line(0,0, mouse.x, mouse.y);

  // Red outer glow
  stroke(255,0,0);
  strokeWeight(14);
  line(0,0, mouse.x, mouse.y);

  // White inner core
  stroke(255);
  strokeWeight(4);
  line(0,0, mouse.x, mouse.y);
  
  // Black handle 
  PVector handle = mouse.copy().normalize().mult(50);
  stroke(0);
  strokeWeight(14);
  line(-handle.x, -handle.y, handle.x, handle.y);
  }
  
  
} 
