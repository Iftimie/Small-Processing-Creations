import java.util.*;
class Circle{
PVector center;
PVector loc;
float angle;
float radius;
ArrayList<PVector> history;
Iterator<PVector> it;


Circle(){
center=new PVector(width/8,height/6);
radius=height/6-5;
angle=0;

loc=new PVector(width/2+radius,height/6);
history=new ArrayList<PVector>();
history.add(loc);
}

void run(){
  
  it=history.iterator();
  while(it.hasNext()){
  PVector p=it.next();
  p.x++;
  if(p.x>width)it.remove();
  }
  
loc.x=radius*cos(angle)+center.x;
loc.y=radius*sin(angle)+center.y;
history.add(new PVector(width/8*2,loc.y));
angle+=0.02;
display();
}

void display(){
  ellipse(center.x,center.y,radius*2,radius*2);
line(center.x,center.y,loc.x,loc.y);
PVector pv=history.get(history.size()-1);
line(loc.x,loc.y,pv.x,pv.y);
for(PVector p:history){
  point(p.x,p.y);
}
}


}
