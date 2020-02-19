class Grid{
  int w;
  int h;
  float c_size;
  
  float[][] A;
  float[][] B;
  
  Grid(float w, float h, float c_size){
    this.w = (int)(w/c_size);
    this.h = (int)(h/c_size);
    this.c_size = c_size;
    
    this.A = new float[this.w][this.h];
    this.B = new float[this.w][this.h];
    
    for(int r = 0; r < this.h; r++){
      for(int c = 0; c < this.w; c++){
        A[r][c] = 1.0;
      }
    }
    
    init();
  }
  
  void update(){
    float[][] conv_a = convolve(A,blur_convolution, 1);
    float[][] conv_b = convolve(B,blur_convolution, .5);
    
    float[][] newA = new float[w][h];
    float[][] newB = new float[w][h];
    
    for(int r = 0; r < h; r++){
      for(int c = 0; c < w; c++){
        float delta_t = 1.0/3;
        newA[r][c] = A[r][c] + (conv_a[r][c] - (A[r][c]*pow(B[r][c],2)) + F*(1-A[r][c]))*delta_t;
        newB[r][c] = B[r][c] + (conv_b[r][c] + (A[r][c]*pow(B[r][c],2)) - (K+F)*B[r][c])*delta_t;
      }
    }
    
    A = newA;
    B = newB;
  }
  
  void init(){
    int cell_hor = 5;
    int mid = w/2;
    for(int r = mid-cell_hor; r < mid+cell_hor; r++){
      for(int c = mid-cell_hor; c < mid+cell_hor; c++){
        B[r][c] = 1;
      }
    }
    
    //for(int r = 0; r < h; r+= 15){
    //  for(int c = 0; c < w; c+= 15){
    //    B[r][c] = 1;
    //  }
    //}
  }
  
  void render(){
    for(int r = 0; r < h; r++){
      for(int c = 0; c < w; c++){
        render_pixel(r,c);
      }
    }
  }
  
  private void render_pixel(int r, int c){
    noStroke();
    float a_amt = A[r][c];
    float b_amt = B[r][c];
    
    //float ratio = a_amt-b_amt;
    //float offset = ratio - 50;
    //float sigmoid = (offset)/(1+abs(offset));
    //float scaled = (sigmoid + 1) * 255;
    
    fill(b_amt*255,a_amt*255,0);
    //println(scaled);
    rect(r*c_size,c*c_size,c_size,c_size);
  }
}
