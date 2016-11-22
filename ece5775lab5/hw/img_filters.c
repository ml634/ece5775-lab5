/*****************************************************************************
 *
 *     Author: Xilinx, Inc.
 *
 *     This text contains proprietary, confidential information of
 *     Xilinx, Inc. , is distributed by under license from Xilinx,
 *     Inc., and may be used, copied and/or disclosed only pursuant to
 *     the terms of a valid license agreement with Xilinx, Inc.
 *
 *     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
 *     AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
 *     SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
 *     OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
 *     APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
 *     THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
 *     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
 *     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
 *     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
 *     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
 *     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
 *     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *     FOR A PARTICULAR PURPOSE.
 *
 *     Xilinx products are not intended for use in life support appliances,
 *     devices, or systems. Use in such applications is expressly prohibited.
 *
 *     (c) Copyright 2013 Xilinx Inc.
 *     All rights reserved.
 *
 *****************************************************************************/



#include <stdio.h>
#include "frame_size.h"
#include "image_cores.h"

unsigned short yc_data_blue[NUMROWS*NUMCOLS]; 
unsigned short yc_data_red[NUMROWS*NUMCOLS]; 
unsigned short yc_data_green[NUMROWS*NUMCOLS];

unsigned short yc_data_combined[NUMROWS*NUMCOLS];

// local arrays to hold blue and red robot center of mass points
unsigned int blueCOM[2];
unsigned int redCOM[2];

// local arrays for red and blue robot corner points
unsigned int blueCorners[8];
unsigned int redCorners[8];

// add more parameters here to pass center of masses, points, etc to main
void img_process( unsigned int *rgb_data_in, unsigned int *rgb_data_out)
{
    
  	int i =0;

    rgb_pad2ycbcr(rgb_data_in, yc_data_red, 'r');
    rgb_pad2ycbcr(rgb_data_in, yc_data_blue, 'b');

    //centerOfMass('b', yc_data_blue, blueCOM[0], blueCOM[1]);

	for (i = 0; i < NUMROWS*NUMCOLS; i++) {
		yc_data_combined[i] = yc_data_red[i] | yc_data_blue[i];
	}
 
    ycbcr2rgb_pad(yc_data_combined,rgb_data_out);

}


