class Cannonball{

  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector direction;
  boolean thrown;
  float mass=10;
  float angle=0;
  float angle_vel=0;
  float angle_acc=0;
  int life=100;
  
  boolean exploded;
  ParticleSystem ps;
  
  Cannonball (Cannon c){
    exploded=false;
    ps=new ParticleSystem();
    
   direction=PVector.sub(new PVector(mouseX,mouseY),c.location);
   direction.normalize();
   direction.mult(70);
   location=PVector.add(c.location,direction);
   thrown=false;
   velocity=new PVector(0,0);
   acceleration=new PVector(0,0);
  }
  
  void update(Cannon c){
    
    if(thrown==false){
        if(mouseY<height-70){
   
           direction=PVector.sub(new PVector(mouseX,mouseY),c.location);
           direction.normalize();
           direction.mult(30);
           location=PVector.add(c.location,direction);
                             }
         else {
           location=PVector.add(c.location,new PVector(30,0));
               }
                     }
     else if(exploded==false) {
           applyForce(new PVector(0,2)); //gravity
           applyFriction();
           velocity.add(acceleration);
           velocity.limit(50);
           checkSpeed();
           angle_acc=velocity.x/50;
           angle_vel+=angle_acc;
           //angle_vel=constrain(angle_vel,-0.01,0.01);
           angle+=angle_vel;
           angle_vel=0;
           
           location.add(velocity);
           acceleration.mult(0);
          }
          else ps.run();
   if(thrown==true)life--;
   checkEdges();
    display();
  }
  
  void isExploded(Target t){
if(hitTarget(t)&&exploded==false)
{exploded=true;ps.changeOrigin(location);ps.chargeParticles();life=300;}
}

  boolean hitTarget(Target t){
    PVector distance=PVector.sub(t.loc,location);
    if(((location.x+10>t.loc.x-10||distance.mag()<20)&&location.x-10<t.loc.x+10) &&(location.y+20>t.loc.y-40 &&location.y-20<t.loc.y+40))
     //nu te juca cu parametrii din if ca-i periculos
     return true;
     else return false;
  
  
  }
  
  void checkSpeed(){
  if(velocity.mag()<=0.4&&(location.y>height-0.4&&location.y<height+0.4)){velocity.mult(0);}
  }
  
  boolean isDead(){
  if (life<0)return true;
  else return false;
  }
  
  void applyForce(PVector force){
  PVector f=force.get();
  f.div(mass);
  acceleration.add(f);
  }
  
  void applyFriction(){
  if(velocity.mag()>0.2&&location.y==height){
      float c=0.2;
      PVector friction=velocity.get();
      friction.mult(-1);
      friction.normalize();
      friction.mult(c);
      applyForce(friction);
                                             }
  
                       }
  
  void display(){
    if(exploded==false){
   stroke(0); 
  fill(255);
  ellipse(location.x,location.y,40,40);
  pushMatrix();
  translate(location.x,location.y);
  rotate(angle);
  PVector rotatio=direction.get();
  rotatio.normalize();rotatio.mult(20);
  line(0,0,rotatio.x,rotatio.y);//sau  line(0,0,0,20); pt a intelege mai bine efectul
  popMatrix();
    }
  }
  
  
  
  void checkEdges(){
  if(location.x>width){location.x=width;velocity.x*=-0.8;}
  else if(location.x<0){location.x=0;velocity.x*=-0.8;}
  else if(location.y>height){location.y=height;velocity.y*=-0.8;}
  else if(location.y<0){location.y=0;velocity.y*=-0.8;}
  }


}
