Object[] objects;
int size = 280;  // object size

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

void setup() {
  fullScreen();
  
  String path = sketchPath();

  String[] filenames = listFileNames(path + "/png/");
  
  // Create objects (init)
  int nObjects = filenames.length;
  objects = new Object[nObjects];
  for( int i = 0; i < nObjects; i++){
      print (filenames[i]);
      objects[i] = new Object(random(0, width-size*2), random(0,200), path + "/png/" + filenames[i], random(0, 2));
  }
}

class Object {
  PImage img;  // image of the object

  float xpos, ypos;    // Position of the object    

  float xspeed = 2.8;  // Speed of the object
  float yspeed = 3.2;  // Speed of the object

  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom
  
  String direction = "rise"; // object movement direction: fall, rise
  
  // constructor
  Object(float _x ,float _y, String image, float type) {
    
    xpos = _x;
    ypos = _y;
    
    // Load image
    img = loadImage(image);
    img.resize(0, size);
    
    if (random(0, 2) > 1){
      direction = "fall";
    }
    
  }

  void fall(){
     ypos += yspeed;
     image(img, xpos, ypos);
  }
  
  void rise(){
     ypos -= yspeed;
     image(img, xpos, ypos);
  }
  
}

void draw() {
  background(255);
  
  // Render all created objects
  for( int i = 0; i < objects.length; i++){
    if (objects[i].direction.equals("fall")){
      objects[i].fall();
      if (objects[i].ypos > height){
        objects[i].ypos = 0;
        objects[i].xpos = random(0, width-size*2);
      }
    }
    else{
      objects[i].rise();
      if (objects[i].ypos < 0){
        objects[i].ypos = height;
        objects[i].xpos = random(0, width-size*2);
      }
    }
  }
  
}