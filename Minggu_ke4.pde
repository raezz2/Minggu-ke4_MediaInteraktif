ArrayList<Objek> objekList = new ArrayList<Objek>();
PImage kecoakImg;

void setup() {
  size(800, 600);
  frameRate(60);
  
  kecoakImg = loadImage("kecoa.png"); 
  kecoakImg.resize(40, 40);
}

void draw() {
  background(#FFFFFF);
  
  for (int i = objekList.size()-1; i >= 0; i--) {
    Objek o = objekList.get(i);
    o.update();
    o.display();
  }
}

void mouseClicked() {
  Objek baru = new Objek();
  baru.pos.x = mouseX;
  baru.pos.y = mouseY;
  objekList.add(baru);
}

class Objek {
  PVector pos;
  PVector vel;
  float angle;
  
  Objek() {
    pos = new PVector(width / 2, height / 2);
    vel = PVector.random2D();
    vel.mult(random(1, 3));
    angle = PI/2; // Orientasi awal menghadap ke atas
  }
  
  void update() {
    pos.add(vel);
    
    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }
  
  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    angle = atan2(vel.y, vel.x); // Mengubah sudut rotasi berdasarkan arah gerakan
    rotate(angle); // Rotasi berdasarkan arah gerakan
    imageMode(CENTER);
    image(kecoakImg, 0, 0);
    popMatrix();
  }
}
