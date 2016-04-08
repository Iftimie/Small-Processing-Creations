import java.util.*;
class ParticleSystem{
PVector origin;
ArrayList<Particle> plist;
Iterator<Particle> it;

ParticleSystem(){
origin=new PVector();
plist=new ArrayList<Particle>();

}

void chargeParticles(){
for(int i=0;i<40;i++)plist.add(new Particle(origin));
}

void changeOrigin(PVector origin_){
origin=origin_.get();
}


void run(){
    it=plist.iterator();
      while(it.hasNext())
      {
      Particle p=it.next();
      p.update();
      if(p.isDead())it.remove();
      }
    }
}
