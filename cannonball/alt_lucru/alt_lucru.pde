
Cannon c;
Cannonball ca;
int max_balls=4;
int current_ball=0;
int time=51;
Cannonball[] balls_charge=new Cannonball[max_balls];
Target t;

                          void setup(){
size(640,480);
c=new Cannon();
for(int i=0;i<max_balls;i++)
  balls_charge[i]=new Cannonball(c);

t=new Target();
            }

                          void draw(){
  
  background(255);
  c.update();
  t.update();
  time++;
  if(mousePressed&&time>25&&current_ball<max_balls){
    if(balls_charge[current_ball].thrown==false){
      
       balls_charge[current_ball].thrown=true;
       PVector dir=balls_charge[current_ball].direction.get();
       
       dir.mult(6);
       balls_charge[current_ball].applyForce(dir);
                        }
       current_ball++;
       
       time=0;
                   }
  for(int i=0;i<max_balls;i++)
  {   
    
      
      balls_charge[i].update(c);
      balls_charge[i].isExploded(t);
      println(balls_charge[i].life);
      if(balls_charge[i].isDead()){
            for(int j=i;j<max_balls-1;j++)
                {
                    balls_charge[j]=balls_charge[j+1];
                }
                balls_charge[max_balls-1]=new Cannonball(c);
                current_ball--;
                current_ball=constrain(current_ball,0,4);
                                  }
      fill(0);                            
      text(balls_charge[i].life,400+i*60,65);      
  }
      fill(0);
      textSize(15);
      text("Balls left",10,30);
      text("Balls life",width-70,30);
      text(max_balls-current_ball,10,65);                                  
  
                                      }
