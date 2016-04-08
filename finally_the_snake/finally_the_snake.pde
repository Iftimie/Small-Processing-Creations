                  class Snake{
 Mover[] ms=new Mover[5];
 float time;
 
 Snake(){
 for(int i=0;i<ms.length;i++)
   ms[i]=new Mover(new PVector(width/2-i*20,height/2));
 time=5;
 }
 
 void run(){
   time+=0.05;
  ms[0].update(new PVector(mouseX,mouseY),time,true);
 for(int i=1;i<ms.length;i++)
   ms[i].update(ms[i-1].loc,0,false);
 }

}

                  class Mover{
  PVector loc;
  PVector vel;

  Mover(PVector location){
    loc=location.get();
    vel=new PVector(0,0);
    
  }
  
  void update(PVector orientation,float time,boolean head){
    PVector dir=PVector.sub(orientation,loc);
    if(dir.mag()>10){
        if(head==false){
        float distance=dir.mag();
        distance=map(distance,0,100,0,5);
        dir.normalize();
        dir.mult(distance);
        }
        else {
            dir.normalize();
            dir.mult(2);
        }
        
        
        
        vel=dir.get();
        if (head==true){
            float r=sin(time);
            r=map(r,-1,1,-2,2);
            PVector wave = new PVector (1,0);
            float angle = vel.heading();
            wave.rotate(angle+PI/2);
            wave.mult(r);
            vel.add(wave);
        }
        
        loc.add(vel);
        
        
                    }
  
  display(orientation,head); //orientation este bodylocation
  }
  
  void display(PVector bodylocation,boolean head){
    if(head==false)
    line(bodylocation.x,bodylocation.y,loc.x,loc.y);
    ellipse(loc.x,loc.y,20,20);
  }
}

Snake s;

void setup(){
size(1280,960);
s=new Snake();
}

void draw(){
background(255);
s.run();
}
