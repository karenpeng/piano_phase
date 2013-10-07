ArrayList movingPoints0;
ArrayList movingPoints1;
ArrayList movingPoints2;
ArrayList movingPoints3;
float Y = 330.0;

int interval = 40;
int intervalN = 40;

float[] notes = {-100,-60,40,80,100,-60,-100,80,40,-60,80}; 
int size = notes.length;

void genPoint() {   
  float num1 = (frameCount/interval)%size; 
  for(int i=0;i<size;i++){    
    if(num1==i){
      float positionY = Y+ notes[i];  
      movingPoints0.add(new Point(0.0, positionY,0.0));
    }
  }
}

void genPointN() {
  float num2 = (frameCount/intervalN)%size; 
  for(int j=0;j<size;j++){    
    if(num2==j){
      float positionY = Y+ notes[j];  
      movingPoints1.add(new Point(1100.0, positionY,0.0));
    }
  }
}

void setup() {
  background(0, 0, 0);
  size(1100, 660, P3D);
  frameRate(40);
  smooth();  
  movingPoints0 = new ArrayList<Point>();
  movingPoints1 = new ArrayList<Point>();
  movingPoints2 = new ArrayList<PointZ>();
  movingPoints3 = new ArrayList<PointZ>();
}

void numberControl(ArrayList points,int gap, ArrayList newArray) {
  Point prePoint = null;
  for (int i = 0; i < points.size(); i++) {
    Point p = (Point)points.get(i);
    if (p.counter>gap) {
      points.remove(i);
      newArray.add(new PointZ(0.0,p.position.y,p.position.x));
    } else {
      p.move();
      p.check();    
      p.render();

      if (prePoint != null) {
        p.lineTo(prePoint);
      }
      prePoint = p;      
    }
  }  
}

void numberControlZ(ArrayList points){
  PointZ prePoint = null;
  for(int i=0; i<points.size();i++){
    PointZ p = (PointZ)points.get(i);
    if(p.position.z>1000.0){
      points.remove(i);
    }else{
      println("draw sth");
      p.move();
      p.render();
      if (prePoint != null) {
        p.lineTo(prePoint);
      }
      prePoint = p; 
    }
  }
}

void draw() {
  background(0, 0, 0);
 
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  stroke(100);
  strokeWeight(1);
  line(width/2, 0, 0, width/2, height, 0);
  line(0, height/2, 0, width, height/2, 0);
  line(width/2, height/2, 600, width/2, height/2, 0);
  
  if (frameCount % interval == 0) {
    genPoint();
  }
  if (frameCount % intervalN == 0) {
    genPointN();
  }
  numberControl(movingPoints0,interval,movingPoints2);
  numberControl(movingPoints1,intervalN,movingPoints3);
  numberControlZ(movingPoints2);
  println(movingPoints2.size());
}
