class Point {
  PVector position;  
  float radius;
  float center;
  boolean hit;
  int counter;
  Point(float _x, float _y) {
    position = new PVector(_x, _y, 0.0);
    radius = 5.0;
    center = width / 2;
    hit=false;
    counter=0;
  }
  
  void move() {
    position.x += position.x >= center ? -1 : 1;
    position.x += position.x <= center ?
    //return position.x == center;
    
  }
  
  void check(){
    hit = position.x == center;
    if(hit){
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
    line(position.x, position.y, position.z, anotherPoint.position.x, anotherPoint.position.y, anotherPoint.position.z);
  }
}

