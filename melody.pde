class Melody{
  PVector location;
  boolean on;
  
  Melody(float _y){
    location = new PVector(width/2, _y, 0.0);
    on = false;
  }
  
  void detect(Note someNote){
    if(someNote.hit==true && someNote.position.z==0){
      on = true;
    }
  }
  
  void display(){
    pushMatrix();
    translate(location.x, location.y, location.z);
    noStroke();
    lights();
    if(on){
      fill(255,255,255);   
      sphere(20.0);
    }else{
      fill(255,255,255,100);
      sphere(10.0);
    }
    popMatrix();
  }

}
