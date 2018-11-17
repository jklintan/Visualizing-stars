float xpos;
float ypos;
float drag = 30.0;
float eyeX, eyeY, eyeZ;
int dz = 0;
  int width = 1500, height = 800;
int times = 2;
 
class Star {
  float x;
  float y;
  float z;
  float pz;

  Star() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    z = random(width/2);
    pz = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = width/2;
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      pz = z;
    }
  }

  void show() {
    fill(255);
    noStroke();
    float sx = map(x / z, 0, 1, 0, width/2);
    float sy = map(y / z, 0, 1, 0, height/2);;
    float r = map(z, 0, width/2, 16, 0);
    ellipse(sx, sy, r, r);
    float px = map(x / pz, 0, 1, 0, width/2);
    float py = map(y / pz, 0, 1, 0, height/2);
    pz = z;

    stroke(255);
    line(px, py, sx, sy);

  }
}

Star[] stars = new Star[1000];
float speed;

void setup(){

  size(1500,800,P3D);  
  eyeX = width/2;

eyeY = height/2;
for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}


void draw(){
  background(0);
  translate(width/2, height/2);
  int rw = int(random(0,width));
  int rh = int(random(0, height));
  int rd = int(random(0, dz));
  int col = int(random(200,255));
  
  camera(width, height, dz, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  
  //translate(rw, rh, rd);
  fill(col);
  stroke(col);
    //sphere(1);
  if(times%2 == 0)
  {
    if(dz >= 4500)
    {
      dz +=1;
      times++;
    }
    else if(dz <= 300)
      dz +=100;
    else
      dz+=10;
  }
  else{
    if(dz <= -5000)
    {
      dz -=1;
      times++;
    }
    else if(dz <= 300)
      dz -=50;
    else
      dz-=10;
  }
}
