class Cannon{

  PVector location;  //location
  PVector size; //orientation
  float angle;
  
  Cannon(){
  location=new PVector(50,height-70);
  size=new PVector(100,0);
  }
  
  void update(){
    
    PVector mouse=new PVector(mouseX,mouseY);
    mouse.sub(location);
    angle=PVector.angleBetween(mouse,new PVector(100,0));
    display();
    
  
  }
  
  void display(){
    if(mouseY<height-70){
        pushMatrix();
        translate(location.x,location.y);
        rotate(-1*angle);
        fill(0);
        rectMode(CENTER);
        rect(0,0,100,50);
        popMatrix();
    }
    else{fill(0);rectMode(CENTER); rect(location.x,location.y,100,50);} //ultimii doi parametrii sunt width of rect si lenght 
  }
}
