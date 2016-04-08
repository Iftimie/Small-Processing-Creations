class Hexagon{
PVector center;
PVector loc;
float angle;
float radius;
float radius_from_circle;
ArrayList<PVector> history;
Iterator<PVector> it;

Hexagon(){
center=new PVector(width/8,height*2/3+height/6);
radius_from_circle=height/6-5;
radius=sqrt(radius_from_circle*radius_from_circle*2);
angle=0;

loc=new PVector(center.x+radius,height/2);
history=new ArrayList<PVector>();
history.add(loc);
}
}
