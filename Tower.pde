class Tower
{
  PVector location;
  float h; // height
  float w; // width
  float d; // depth
  float speed;
  float angle;
  float direction;
  color bodyColor;
  
  Tower(PVector l, float _h, float size, color c)
  {
    location = l.copy();
    h = _h;
    w = size;
    d = size;
    bodyColor = c;
    speed = random(2, 3);
   }
    
  void update()
  {
    float direction = PVector.dist(new PVector(0, height, 0), location);
    if(direction < frameCount)
    {
      if(h < 768)
      {
        h += speed;
      }
    }
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y - h / 2, location.z);
    fill(bodyColor);
    noStroke();
    if(h > 0)
    {
      box(w, h, d);
    }
    popMatrix();
  }
}