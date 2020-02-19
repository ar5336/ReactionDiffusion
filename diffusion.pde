float[][] blur_convolution = {
                          { .05,  .2, .05},
                          {  .2,  -1,  .2},
                          { .05,  .2, .05}
                        };
                        
float[][] convolve(float[][] source, float[][] conv, float scale){
  int w = source.length;
  int h = source[0].length;
  
  float[][] convolved = new float[h][w];
  
  for(int r = 0; r < h; r++){
    for(int c = 0; c < w; c++){
      //convolve
      float total = 0;
      for(int con_r = max(r-1, 0); con_r < min(r+2,h); con_r++){
        for(int con_c = max(c-1, 0); con_c < min(c+2,w); con_c++){
          int cnv_r = con_r-r+1;
          int cnv_c = con_c-c+1;
          
          //print("("+cnv_r +", "+cnv_c+")");
          
          total += conv[cnv_r][cnv_c]*source[con_r][con_c];
        }
      }
      
      //for(int con_r = (r-1); con_r < (r+2); con_r++){
      //  for(int con_c = (c-1); con_c < (c+2); con_c++){
      //    if(!(con_r < 0) && !(con_r >= h) && !(con_c < 0) && !(con_c >= w)){
      //      int cnv_r = con_r-r+1;
      //      int cnv_c = con_c-c+1;
            
      //      //print("("+cnv_r +", "+cnv_c+")");
            
      //      total += conv[cnv_r][cnv_c]*source[con_r][con_c];
      //    }
      //  }
      //}
      
      convolved[r][c] = max(total,0)*scale;
      //println(total);
    }
  }
  
  return convolved;
}   
