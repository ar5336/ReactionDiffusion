Grid the_grid;
int cell_size = 4;

float F;// = random(.01, .1);
float K;// = random(.045 ,.07);

void setup(){
  size(500,500);
  the_grid = new Grid(width,height,cell_size);
  frameRate(60);
    
  F = .055;
  K = .062;
  
  print("F: "+F);
  print("K: "+K);
}

void draw(){
  background(255);
  the_grid.update();
  the_grid.render();
  //println("frame");
}
