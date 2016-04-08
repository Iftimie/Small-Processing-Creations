class Target{
PVector loc;
PVector vel;

Target(){
loc=new PVector(width-10,height/2);
vel=new PVector(0,3);
}

void update(){
loc.add(vel);
checkLocation();
display();
}

void checkLocation(){
if(loc.y>height/2+100)vel.mult(-1);
else if(loc.y<height/2-100)vel.mult(-1);
}

void display(){
fill(100);
ellipse(loc.x,loc.y,20,80);
}

}
