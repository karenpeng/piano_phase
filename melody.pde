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
      if(n.position.y==location.y && !n.hit && n.position.x<width/2+2 && n.position.x>width/2-2){
        on = true;
        /*
        OscMessage myMessage = new OscMessage("/test");
        myMessage.add(location.y);
        oscP5.send(myMessage,myRemoteLocation); 
        */
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
      fill(255,255,255,120);
      sphere(5.0);
    }
    popMatrix();
  }

}
