ArrayList noteL;
ArrayList noteR;
ArrayList melodyPlay;
float horizon;
int intervalL;
int intervalR;
float[] melody = {-100, -60, 40, 80, 100, -60, -100, 80, 40, -60, 80};
int melodySize = melody.length;

void setup(){
  size(1200,660,P3D);
  //blendMode(BLEND);
  frameRate(40);
  smooth();
  
  horizon = height/2;
  intervalL = 10;
  intervalR = 20;
  
  noteL = new ArrayList <Note>();
  noteR = new ArrayList <Note>();
  melodyPlay = new ArrayList <Melody>();
  
  for(int i=0;i<melodySize;i++){
    melodyPlay.add(new Melody(melody[i]));
  }
}

void generateNote(int _interval, float _x, ArrayList _note, boolean _direction, color _look){
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
    if(n.position.z > 1000){
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
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  stroke(50);
  strokeWeight(1);
  line(0, height/2, 0, width, height/2, 0);
  line(width/2, 0, 0, width/2, height, 0);
  line(width/2, height/2, 600, width/2, height/2, 0);
  /*
  noStroke();
  fill(255,0,0,20);
  beginShape();
  vertex(0, height/4, 0);
  vertex(width/2,height/4,0);
  vertex(width/2,height*3/4,0);
  vertex(0,height*3/4,0);
  endShape();
  
  fill(255,0,255,20);
  beginShape();
  vertex(width/2, height/4, 0);
  vertex(width,height/4,0);
  vertex(width,height*3/4,0);
  vertex(width/2,height*3/4,0);
  endShape();
  
  fill(255,255,255,20);
  beginShape();
  vertex(width/2,height/4,0);
  vertex(width/2,height/4,600);
  vertex(width/2,height*3/4,600);
  vertex(width/2,height*3/4,0);
  endShape();
  */ 
  generateNote(intervalL,0.0,noteL,true,color(0,255,0));
  generateNote(intervalR,width,noteR,false,color(0,100,255));
  
  update(noteL);
  update(noteR);
  
  for(int i=0;i<melodySize;i++){
    
    int sizeL=noteL.size();
    for(int j=0;j<sizeL;j++){
      melodyPlay.get(i).detect(noteL.get(j));
    }
    
    int sizeR=noteR.size();
    for(int k=0;k<sizeR;k++){
      melodyPlay.get(i).detect(noteR.get(k));
    }
    
    melodyPlay.get(i).display();
  }

}
