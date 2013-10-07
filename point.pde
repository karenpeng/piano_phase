class Point {
  PVector position;  
  float radius;
  float center;
  boolean hit;
  int counter;
  int speed;
  Point(float _x, float _y) {
    position = new PVector(_x, _y, 0.0);
    radius = 5.0;
    center = width / 2;
    hit=false;
    counter=0;
    speed = _x > center ? -1 : 1;
  }
  
  void move() {
      position.x += speed;
  }
  
  void check(){
    if (!hit) {
      hit = position.x == center;
    } else {
      counter++;
    }
  }
  
  void render() {
    if(!hit){
      pushMatrix();
      translate(position.x, position.y, 0);
      noStroke();
      lights();
      sphere(radius);
      popMatrix();   
    }    
  }
  
  void lineTo(Point anotherPoint) {
    stroke(255);
    strokeWeight(2);
    if (hit) {
      return;
    }
    if (anotherPoint.hit) {
      //get point(center, y) in the line
      float y = (center - position.x) * (anotherPoint.position.y - position.y) / (anotherPoint.position.x - position.x) + position.y;
      line(position.x, position.y, position.z, center, y, anotherPoint.position.z);
    } else {
      line(position.x, position.y, position.z, anotherPoint.position.x, anotherPoint.position.y, anotherPoint.position.z);
    }
  }
}

