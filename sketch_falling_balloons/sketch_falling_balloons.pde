Object[] objects = new Object[5];

void setup() {
  fullScreen();
  
  // Create objects (init)
  for( int i = 0; i < objects.length; i++){
      objects[i] = new Object(random(0, width), random(0,200), "balloon.png");
  }
}

class Object {
  PImage img;  // image of the object

  float xpos, ypos;    // Position of the object    

  float xspeed = 2.8;  // Speed of the object
  float yspeed = 3.2;  // Speed of the object

  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom
    
  // constructor
  Object(float _x ,float _y, String image) {
    
    xpos = _x;
    ypos = _y;
    
    // Load image
    img = loadImage(image);
    img.resize(0, 280);
  }

  void fall(){
     ypos += yspeed;
     image(img, xpos, ypos);
  }
  
}

void draw() {
  background(255);
  
  // Render all created objects
  for( int i = 0; i < objects.length; i++){
      objects[i].fall();
  }
  
}