class Particle{
PVector loc;
PVector vel;
PVector acc;
float life;
float angle;
float angle_vel;

Particle(PVector loc_){
loc=loc_.get();
vel=new PVector(0,0);
acc=new PVector(random(-4,4),random(-10));
life=250;
angle=random(-10,10);
angle_vel=random(-0.1,0.1);
}

void update(){
applyForce(new PVector(0,1));
vel.add(acc);
vel.limit(7);
checkSpeed();
loc.add(vel);
vel.mult(0.999);
angle+=angle_vel;

acc.mult(0);
display();
checkEdges();
life--;
}

void checkSpeed(){
if(loc.y==height&&vel.mag()<1){vel.mult(0);angle_vel=0;}
}

void display(){
  noStroke();
fill(100,20,30,life);

pushMatrix();
translate(loc.x,loc.y);
rotate(angle);
rectMode(CENTER);
rect(0,0,life/10,life/10);
popMatrix();
}



void applyForce(PVector force){
  PVector f=force.get();
  f.div(10);
  acc.add(f);

}
void checkEdges(){
if(loc.x<0){loc.x=0;vel.x*=-0.5;}
else if(loc.x>width){loc.x=width;vel.x*=-0.5;}
else if(loc.y<0){loc.y=0;vel.y*=-0.5;}
else if(loc.y>height){loc.y=height;vel.y*=-0.5;}
}



boolean isDead(){
if(life<0)return true;
else return false;
}
}

