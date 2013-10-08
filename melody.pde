class Melody{
  PVector location;
  boolean on;
  
  Melody(float _y){
    location = new PVector(width/2, _y, 0.0);
    on = false;
  }
  
  void detect(ArrayList notes){
    on = false;
    for(int i=0; i<notes.size();i++){
      Note n = (Note)notes.get(i);
      if(n.position.y==location.y && !n.hit && n.position.x<width/2+4 && n.position.x>width/2-4){
        on = true;
        break;
      }
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
      sphere(5.0);
    }
    popMatrix();
  }

}
