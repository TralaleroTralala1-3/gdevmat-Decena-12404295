void setup()
{
  camera(0, 0,Window.eyeZ, 0, 0, 0, 0, -1, 0);
   size(1080, 720, P3D);
 
}

LightSaberLine TwinSaber = new LightSaberLine();


void draw()
{
  
  background(130);
  
  TwinSaber.RenderSaber1();
  TwinSaber.RenderSaber2();
}
