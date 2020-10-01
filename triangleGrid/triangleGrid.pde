int speed = 0;
int step = 1;
float triangleSize = (width/height)/30;
float root3 = (float)Math.sqrt(3);
float triSide = triangleSize*2/root3;
float uR = root3/3 * (triSide);
float ir = (uR)/2;

void setup() {
  size(500, 500);
  strokeWeight(1);
  //angleMode(DEGREES);
}

void draw() {
  background(0);
  
  for (float i = triSide/2; i<width; i += triSide ) {
      for (float j = triSide/2+3; j<height; j += triSide ) {
          push();
          translate(i,j);
          rotate(speed);
          easyTri(0,0,triangleSize);
          pop();
      }
  }
  
  speed+=step;
  
  if (speed % 60 == 0 && speed != 0) {
      step *= -1;
  }
  
}


void easyTri(float x, float y, float height) {
    float root3 = (float)Math.sqrt(3);
    triangle(x, y - root3/3 * (height*2/root3),
    x - (height*2/root3/2), y + (root3/3 * (height*2/root3))/2,
    x + (height*2/root3/2), y + (root3/3 * (height*2/root3))/2);
}
