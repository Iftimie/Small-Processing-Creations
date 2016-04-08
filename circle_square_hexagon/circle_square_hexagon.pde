Circle c;
Square s;
void setup(){
  frameRate(120);
size(480,360);
c=new Circle();
s=new Square();
}

void draw(){
background(255);
line(width/4,0,width/4,height);
line(0,height/3,width,height/3);
line(0,height*2/3,width,height*2/3);
c.run();
s.run();
}
