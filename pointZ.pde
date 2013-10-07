class PointZ{
   PVector position;  
   float radius;
   int speed;
  
  PointZ(float _x, float _y, float _z){
    position = new PVector(_x, _y, _z);
    radius = 5.0;
    speed=3;
  }

  void move() {
    position.z += speed;
  }
  
  void render() {
      pushMatrix();
      translate(position.x, position.y, position.z);
      noStroke();
      lights();
      sphere(radius);
      popMatrix();   
  }
  
  void lineTo(PointZ anotherPoint) {
    stroke(220);
    strokeWeight(1);
    line(position.x, position.y, position.z, anotherPoint.position.x, anotherPoint.position.y, anotherPoint.position.z);
  }

}
