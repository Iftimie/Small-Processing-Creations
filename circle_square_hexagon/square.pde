class Square{
PVector center;
PVector loc;
float angle;
float radius;
float radius_from_circle;
ArrayList<PVector> history;
Iterator<PVector> it;

Square(){
center=new PVector(width/8,height/2);
radius_from_circle=height/6-5;
radius=sqrt(radius_from_circle*radius_from_circle*2);
angle=0;

loc=new PVector(center.x+radius,height/2);
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
  if(loc.x>center.x+radius_from_circle)loc.x=center.x+radius_from_circle;
  if(loc.x<center.x-radius_from_circle)loc.x=center.x-radius_from_circle;
  if(loc.y>center.y+radius_from_circle)loc.y=center.y+radius_from_circle;
  if(loc.y<center.y-radius_from_circle)loc.y=center.y-radius_from_circle;
  history.add(new PVector(width/8*2,loc.y));
  angle+=0.02;
  display();
}

void display(){
  rectMode(CENTER);
  rect(center.x,center.y,radius_from_circle*2,radius_from_circle*2);
  line(center.x,center.y,loc.x,loc.y);
  PVector pv=history.get(history.size()-1);
  line(loc.x,loc.y,pv.x,pv.y);
  for(PVector p:history){
  point(p.x,p.y);
}
}
}
