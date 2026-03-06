void setup()
{
  
  size(1020, 720, P3D);
  camera(0,0,-(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1,0);
  
   otherWalker.x = 100; 
}

Walker myWalker = new Walker(); //creates instance of walker class in sketch
Walker otherWalker = new Walker();

void draw()
{

   
  int rng = int(random(256)); // Generate random integer value between 2 given values  
  println(rng); //Debug log
  
  myWalker.render(); 
  myWalker.randomWalk(); 
  

  otherWalker.render();
  otherWalker.randomWalkBiased();
  
}
