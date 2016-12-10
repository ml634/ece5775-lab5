/************************************************************************************
 * Application: Calculate center of mass points (xBar, yBar) for intput, binary image
 * Author: Andrew Palmer (ajp294)
 * Date: 22 November 2016
 ************************************************************************************/


#include <stdio.h>
#include "frame_size.h"
#include "image_cores.h"

#define COM_COUNT 12 // each color has 3 moment values which would be size of 9 but need buffer size multiple of 4

void centerOfMass(unsigned char yc_data_in[NUMROWS*NUMCOLS], unsigned char yc_data_out[NUMROWS*NUMCOLS], unsigned int frame_com[COM_COUNT])
{

   unsigned char pixel;
   
   int row;
   int col;
   
   unsigned int red_m00, red_m01, red_m10; // moment variables for red
   unsigned int blue_m00, blue_m01, blue_m10; // moment variables for blue
   unsigned int green_m00, green_m01, green_m10; // moment variables for green

   unsigned int red_xBar, red_yBar; // center of mass coords for red
   unsigned int blue_xBar, blue_yBar; // center of mass coords for blue
   unsigned int green_xBar, green_yBar; // center of mass coords for green

   // initialize moment values m00 != 0 to prevent floating pt error
   red_m00 = 1;
   red_m01 = 0;
   red_m10 = 0;
   
   blue_m00 = 1;
   blue_m01 = 0;
   blue_m10 = 0;

   green_m00 = 1;
   green_m01 = 0;
   green_m10 = 0;

   for(row = 0; row < NUMROWS; row++){
      for(col = 0; col < NUMCOLS; col++){
         #pragma AP PIPELINE II = 1
         pixel = yc_data_in[row*NUMCOLS + col]; // / 255;

         if (pixel == 1) {
            // red
            red_m00 += 1;
            red_m10 += col;
            red_m01 += row;

            red_xBar = red_m10 / red_m00;
            red_yBar = red_m01 / red_m00;
         }
         else if (pixel == 2) {
            // blue
            blue_m00 += 1; // pixel >> 1; // shift once is divde by 2
            blue_m10 += col; // (pixel >> 1) * col;
            blue_m01 += row; // (pixel >> 1) * row;

            blue_xBar = blue_m10 / blue_m00;
            blue_yBar = blue_m01 / blue_m00;
         }
         else if (pixel == 3) {
            // green
            green_m00 += 1; // pixel / 3;
            green_m10 += col; // (pixel / 3) * col;
            green_m01 += row; // (pixel / 3) * row;

            green_xBar = green_m10 / green_m00;
            green_yBar = green_m01 / green_m00;
         }


         // assign center of mass coordinates to appropriate position in frame_com
         // try to create this in a fifo loop instead
         // int i;
         // for (i = 0; i < COM_COUNT; i++) {

         // }
         // assign center of mass outputs
         // frame_com[0] = red_xBar;
         // frame_com[1] = red_yBar;
         // frame_com[2] = blue_xBar;
         // frame_com[3] = blue_yBar;
         // frame_com[4] = green_xBar;
         // frame_com[5] = green_yBar;
         // frame_com[6] = 0;
         // frame_com[7] = 0; // Trying to avoid the "cannot stream" synthesis error by filling empty locations with 0
       
         // shouldn't need to reset moment values as that's done before for loops?

         // output pixel
         yc_data_out[row*NUMCOLS +col] = yc_data_in[row*NUMCOLS + col];
      }
   }

   // calculate COM points from each color's moment values
   // red_xBar = red_m10 / red_m00;
   // red_yBar = red_m01 / red_m00;

   // blue_xBar = blue_m10 / blue_m00;
   // blue_yBar = blue_m01 / blue_m00;

   // green_xBar = green_m10 / green_m00;
   // green_yBar = green_m01 / green_m00;

   // assign center of mass coordinates to appropriate position in frame_com
   // FINDME: Outputting color moments and let software do the division
   frame_com[0] = red_xBar;
   frame_com[1] = red_yBar;
   frame_com[2] = blue_xBar;
   frame_com[3] = blue_yBar;
   frame_com[4] = green_xBar;
   frame_com[5] = green_yBar;

}
