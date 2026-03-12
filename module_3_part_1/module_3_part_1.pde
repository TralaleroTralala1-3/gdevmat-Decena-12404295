void setup()
{
  size(1280, 720, P3D);
  camera(0, 0,Window.eyeZ, 0, 0, 0, 0, -1, 0);
  VectorRandomWalker.position.x = 100; // offset Starting position of VectorRandomWalker
}

Walker VectorBouncingWalker = new Walker(); 
Walker VectorRandomWalker = new Walker();
  
void draw()
{
  
 //Update Background constantly to remove afterimages
 background(255);
 
 //Render and apply Move & bounce to VectorBouncingWalker
 VectorBouncingWalker .renderBouncingWalker();
 VectorBouncingWalker .moveAndBounce();
 
 //Render and apply revised randomWalk to VectorRandomWalker
 VectorRandomWalker.renderRandomWalker();
 VectorRandomWalker.randomWalk();
 
}
