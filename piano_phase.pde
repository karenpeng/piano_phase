import oscP5.*;
import netP5.*;
/*
OscP5 oscP5;
NetAddress myRemoteLocation;
*/

ArrayList noteL;
ArrayList noteR;
ArrayList melodyPlay;
float horizon;
float intervalL;
float intervalR;
float sliderX;
boolean drag;
float alpha;

float[] melody = {-100, -60, 40, 80, 100, -60, -100, 80, 40, -60, 80};
int melodySize = melody.length;

void setup(){
  size(1200,660,P3D);
  //oscP5 = new OscP5(this,8000);
  smooth();
  
  horizon = height/2;
  intervalL = 10;
  intervalR = 10;
  drag=false;
  sliderX=width/6;
  alpha=120;
  
  noteL = new ArrayList <Note>();
  noteR = new ArrayList <Note>();
  melodyPlay = new ArrayList <Melody>();
  
  for(int i=0;i<melodySize;i++){
    melodyPlay.add(new Melody( horizon + i*20 - 100));
  }
}

void generateNote(float _interval, float _x, ArrayList _note, boolean _direction, color _look){
  if(frameCount % _interval == 0){
    float number = (frameCount/_interval) % melodySize;
    for(int i=0; i<melodySize; i++){
      if(number == i){
        float positionY = horizon + melody[i];
        _note.add(new Note(_x,positionY,0.0,_direction,_look));
      }
    }
  }
}

void update(ArrayList _note){
  Note preNote = null;
  for (int j=0; j<_note.size(); j++){
    Note n = (Note) _note.get(j);
    if(n.position.z > 700){
      _note.remove(j);
    }else{
      n.check();
      n.move();
      n.render();
      if( preNote != null){
        n.lineTo(preNote);
      }
      preNote = n;
    }
  }
}

void draw(){
  background(0,0,0);
  if(!mousePressed){
    camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  }
    
  stroke(50);
  strokeWeight(1);
  line(0, height/2, 0, width, height/2, 0);
  line(width/2, 0, 0, width/2, height, 0);
  line(width/2, height/2, 600, width/2, height/2, 0);
  /*
  noStroke();
  fill(255,255,255,20);
  beginShape();
  vertex(width/2,height/4,0);
  vertex(width/2,height/4,600);
  vertex(width/2,height*3/4,600);
  vertex(width/2,height*3/4,0);
  endShape();
  */
  
  stroke(100);
  line(width/16,height/6,width*3/16,height/6);
  
  pushMatrix(); 
  translate(sliderX, height/6, 0.0);
  lights();
  noStroke();
  if(drag){
    fill(255,255,255,alpha);
  }else{
    fill(255,255,255,alpha);
  }
  sphere(8.0);
  popMatrix();  
  
  generateNote(intervalL,0.0,noteL,true,color(0,255,0));
  generateNote(intervalR,width,noteR,false,color(255,0,0));
  
  update(noteL);
  update(noteR);
  
  for(int i=0;i<melodySize;i++){   
    Melody m = (Melody)melodyPlay.get(i);
    ArrayList allNotes= new ArrayList<Note>(noteL);
    for(int j=0;j<noteR.size();j++){
      allNotes.add((Note)noteR.get(j));
    }
    m.detect(allNotes);
    m.display();
  }

}

void mouseDragged(){
  if(mouseX>width/16 && mouseX<width*3/16 && mouseY<height/6+40 && mouseY>height/6-40){
    drag=true;
    alpha=200;
    sliderX=mouseX;
    intervalL = round(map(mouseX,width/16,width*3/16,60,1)); 
  }
}
