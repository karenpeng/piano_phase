class Melody{
  PVector location;
  boolean on;
  int counter;
  
  Melody(float _y){
    location = new PVector(width/2, _y, 0.0);
    on = false;
    counter=0;
  }
  
  void detect(Note someNote){
    if(someNote.hit==true && someNote.position.y==location.y){
      on = true;
      counter++;
    }
    if(counter>3){
      on = false;
      counter=0;
    }
  }
  
  void display(){
    pushMatrix();
    translate(location.x, location.y, location.z);
    noStroke();
    lights();
    if(on){
      fill(255,255,255);   
      sphere(12.0);
    }else{
      fill(255,255,255,100);
      sphere(8.0);
    }
    popMatrix();
  }

}
