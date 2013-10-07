ArrayList movingPoints;
ArrayList movingPointsN;
ArrayList movingPointsM;
float Y = 300.0;

int interval = 30;
int intervalN = 60;

float [] notes = [1,2,3,4,5]; 

void genPoint() {
  float positionY = Y + (((frameCount / interval) % 2 == 0) ? 100.0 : -100.0);  
  movingPoints.add(new Point(0.0, positionY));
}

void genPointN() {
  float positionY = Y + (((frameCount / intervalN) % 2 == 0) ? 100.0 : -100.0);  
  movingPointsN.add(new Point(800.0, positionY));
}

void setup() {
  background(0, 0, 0);
  size(800, 600, P3D);
  frameRate(60);
  smooth();  
  movingPoints = new ArrayList<Point>();
  movingPointsN = new ArrayList<Point>();
}

void numberControl(ArrayList points,int gap) {
  Point prePoint = null;
  for (int i = 0; i < points.size(); i++) {
    Point p = (Point)points.get(i);
    if (p.counter>gap) {
      points.remove(i);
      //movingPointsM.add(new Point(p));
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

void draw() {
  camera(mouseX, mouseY, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  background(0, 0, 0);
  stroke(122);
  strokeWeight(1);
  line(400, 0, 0, 400, 600, 0);
  line(0, 300, 0, 800, 300, 0);
  line(400, 300, 1000, 400, 300, -1000);
  if (frameCount % interval == 0) {
    genPoint();
  }
  if (frameCount % intervalN == 0) {
    genPointN();
  }
  numberControl(movingPoints,interval);
  numberControl(movingPointsN,intervalN);
}
