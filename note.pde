class note{
  float y;
  boolean on;
  int count; 
  
  void render() {
      pushMatrix();
      //translate(position.x, position.y, 0);
      noStroke();
      lights();
      sphere(10.0);
      popMatrix();   
       
  }
}
