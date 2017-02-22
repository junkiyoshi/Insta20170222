ArrayList<Tower> towers;
float angle;
float radius;
float size;

PImage img;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  
  angle = 0;
  radius = 256;
  size = 4;
  
  img = loadImage("Lenna.png");
  image(img, 0, 0);
  loadPixels();
  
  towers = new ArrayList<Tower>(); 
  
  for(int z = 0; z < height; z += size)
  {
    for(int x = 0; x < width; x += size)
    {
      color c = pixels[x + width * z];
      towers.add(new Tower(new PVector(x - height / 2, height, z - width / 2), 0, size, c));
    }
  }

  background(255);
}

void draw()
{
  background(255);
  
  angle = (angle + 0.5) % 360;
  float x = radius * cos(radians(angle));
  float z = radius * sin(radians(angle));
  radius += 1;

  camera(z, -400 - frameCount / 2, x, 
         0.0, 0.0, 0.0, 
         0.0, 1.0, 0.0);
  
  for(Tower t : towers)
  {
    t.update();
    t.display();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}