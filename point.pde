class Point extends PointZ{
  float center;
  boolean hit;
  int counter;
  
  Point(float _x, float _y, float _z) {
    super(_x,_y,_z);
    center = width / 2;
    hit=false;
    counter=0;
    speed = _x > center ? -2 : 2;
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
      super.render();
    }    
  }
  
  void lineTo(Point anotherPoint) {
    stroke(220);
    strokeWeight(1);
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

