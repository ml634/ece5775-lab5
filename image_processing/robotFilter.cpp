// Program to filter incoming images of the robot
// Filters include: Median for preprocessing, harris corner detector, and color filtering
// Andrew Palmer (ajp294)
// 10 November 2016

/*
 * Image processing pipeline:
 * 1. Color thresholding for each color
 * 2. Morphological closing to improve threshold results
 
 * Other operations:
 * 1. Corner detection using Harris or FAST 
 * 2. Calculate Centroid for each thresholded color (red robot, blue robot, green goal)
 * 3. Match corner point to appropriate object
*/

#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/opencv.hpp"

#include <iostream>
#include <stdio.h>
#include <stdlib.h>

#define ARRAY_SIZE 8

using namespace cv;
using namespace std;

// Global Variables
cv::Mat blueRobot, redRobot, greenGoal;
unsigned int blueCOM[2], redCOM[2], greenCOM[2];
// unsigned int keypoints[10];
// FINDME: vectors of points not synthesizable
std::vector<cv::KeyPoint> keypoints;
unsigned int cornerPoints[ARRAY_SIZE][2];
cv::Point cornerPointsCV[ARRAY_SIZE];
unsigned int redRobotCoords[4]; // 2 Points (each point has x and y value)
unsigned int blueRobotCoords[4]; // 2 Points (each point has x and y value)
unsigned int greenGoalCoords[4]; // 2 Points (each point has x and y value)


// Function headers 
// FINDME: use header file for this eventually
cv::Mat thresholdRGB(cv::Mat src, Scalar color);
void centerOfMass(cv::Mat src, char color);
cv::Mat morphologicalClosing(cv::Mat src);
std::vector<cv::Point> harrisCornerDetect(cv::Mat src, int threshold);
void fastXCornerDetect(cv::Mat src, int threshold);
double calculateAngleFromMoments(cv::Mat src, int comX, int comY);
// void matchCornerToCOM(int comX, int comY,  unsigned int * cornerPoints);
void matchCornerToCOM(int comX, int comY, char color); // int comX, int comY,  unsigned int * cornerPoints);


// Main function
int main(int argc, char ** argv) 
{
   // FINDME: test greyscale 
   cv::Mat src_grey;

   // read input image from command line
   cv::Mat src = imread(argv[1], 1);

   cvtColor(src, src_grey, CV_BGR2GRAY );

   // Other operations
   // 1. Detect corners
   // fastXCornerDetect(src_grey, 200);
   FAST(src_grey, keypoints, 120); // 120 as a threshold seems to work for greyscale, unprocessed original 
   for (size_t i = 0; i < keypoints.size(); i++) {
      const KeyPoint& kp = keypoints[i];
      circle(src_grey, kp.pt, 3, Scalar(80, 80, 80), 2, 8, 0);
      // add keypoint point to array
      cornerPoints[i][0] = kp.pt.x;
      cornerPoints[i][1] = kp.pt.y;
      cornerPointsCV[i] = kp.pt; // Corner points in cv::Point type
   }
   namedWindow("corners", CV_WINDOW_AUTOSIZE);
   imshow("corners", src_grey);
   
   // std::cout << "corners: " << keypoints << std::endl;

   // threshold by color to detect robots and goal
   redRobot = thresholdRGB(src, Scalar(0, 0, 255));
   blueRobot = thresholdRGB(src, Scalar(255, 0, 0));
   
   // Morphological closing on robot
   redRobot = morphologicalClosing(redRobot);
   blueRobot = morphologicalClosing(blueRobot);

   // 2. Calculate Centroid for each thresholded color (red robot, blue robot, green goal)
   centerOfMass(redRobot, 'r');
   centerOfMass(blueRobot, 'b');

   // draw circles at each COM
   circle(redRobot, Point(redCOM[0], redCOM[1]), 3, Scalar(80, 80, 80), 2, 8, 0);
   circle(blueRobot, Point(blueCOM[0], blueCOM[1]), 3, Scalar(80, 80, 80), 2, 8, 0);

   // 3. Match corner point to appropriate object
   matchCornerToCOM(redCOM[0], redCOM[1], 'r');
   matchCornerToCOM(blueCOM[0], blueCOM[1], 'b');

   namedWindow("red robot", CV_WINDOW_AUTOSIZE);
   imshow("red robot", redRobot);

   namedWindow("blue robot", CV_WINDOW_AUTOSIZE);
   imshow("blue robot", blueRobot);

   // namedWindow("red robot morph", CV_WINDOW_AUTOSIZE);
   // imshow("red robot morph", redRobot);

   // namedWindow("blue robot morph", CV_WINDOW_AUTOSIZE);
   // imshow("blue robot morph", blueRobot);

   // harris corner
   // harrisCornerDetect(redRobot, 220);
   // harrisCornerDetect(blueRobot, 220);

   waitKey(0);
   return(0);
}

// Threshold image based on color
cv::Mat thresholdRGB(cv::Mat src, Scalar color)
{
   cv::Mat thresholdResult; // greyscale, binary result image
   cv::Vec3b pixelIntensity; // 3 channel RGB pixel value vector
   unsigned char pixelBlue, pixelRed, pixelGreen;
   
   // initialize result image
   thresholdResult = Mat::zeros(src.size(), CV_8UC1); 

   // iterate through source pixels and threshold based on input color
   for (int j = 0; j < src.rows; j++) {
      for (int i = 0; i < src.cols; i++) {
         pixelIntensity = src.at<cv::Vec3b>(j, i);
         pixelBlue = pixelIntensity.val[0];
         pixelGreen = pixelIntensity.val[1];
         pixelRed = pixelIntensity.val[2];

         if (color == Scalar(0, 0, 255)) {
            // threshold with red
            if (pixelRed > 160 && pixelGreen < 70 && pixelBlue < 90) {
               thresholdResult.at<unsigned char>(j, i) = 255;
            }
         }
         else if (color == Scalar(0, 255, 0)) {
            // threshold with green
            if (pixelIntensity.val[1] > 180) { 
               thresholdResult.at<unsigned char>(j, i) = 255;
            }
         }
         else if (color == Scalar(255, 0, 0)) {
            // threshold with blue 
            if (pixelRed < 50 && pixelGreen < 90 && pixelBlue > 135) { 
               thresholdResult.at<unsigned char>(j, i) = 255;
            }
         }
      }
   }

   return thresholdResult;
}

void centerOfMass(cv::Mat src, char color)
{
   unsigned int m00, m01, m10; // Moment values
   unsigned int xBar, yBar; // Center of mass coordinates
   unsigned int point[2]; // array to hold COM point

   // init values
   m00 = 0;
   m01 = 0;
   m10 = 0;
   xBar = 0;
   yBar = 0;

   // iterate through all pixel values
   for (int j = 0; j < src.rows; j++) {
      for (int i = 0; i < src.cols; i++) {
         m00 += src.at<unsigned char>(j, i);
         m01 += src.at<unsigned char>(j, i) * j;
         m10 += src.at<unsigned char>(j, i) * i;
      }
   }
   
   // std::cout << "Area: " << m00 << std::endl;
   // std::cout << "M10: " << m10 << std::endl;
   // std::cout << "M01: " << m01 << std::endl;

   xBar = m10 / m00;
   yBar = m01 / m00;
  
   // Save COM to appropriate robot COM array
   switch(color) {
      case('b'):
         // std::cout << "blue" << std::endl;
         blueCOM[0] = xBar;
         blueCOM[1] = yBar;
         // std::cout << "blue: " << blueCOM[0] << ", " << blueCOM[1] << std::endl;
         break;

      case('r'):
         // std::cout << "red" << std::endl;
         redCOM[0] = xBar;
         redCOM[1] = yBar;
         // std::cout << "blue: " << blueCOM[0] << ", " << blueCOM[1] << std::endl;
         break;

      case('g'):
         greenCOM[0] = xBar;
         greenCOM[1] = yBar;
         break;
   }

   // point[0] = xBar;
   // point[1] = yBar;
   // std::cout << "Point: " << Point(xBar, yBar) << std::endl;

   // Draw circle at center of mass
   // circle(src, Point(xBar, yBar), 6, Scalar(255, 255, 255), 2, 8, 0);
   // namedWindow( "Center of mass", CV_WINDOW_AUTOSIZE );
   // imshow( "Center of mass", src );

   // return point;
}

std::vector<cv::Point> harrisCornerDetect(cv::Mat src, int threshold)
{
   cv::Mat result;
   cv::Mat normalizedResult;
   cv::Mat normalizedScaledResult;
   std::vector<cv::Point> cornerPoints;
   
   // detection parameters
   int blockSize = 2;
   int apertureSize = 3;
   double k = 0.04;

   // Detect corners
   cornerHarris(src, result, blockSize, apertureSize, k, BORDER_DEFAULT);

   // Normalizing
   normalize(result, normalizedResult, 0, 255, NORM_MINMAX, CV_32FC1, Mat() );
   convertScaleAbs( normalizedResult, normalizedScaledResult);

   // Drawing a circle around corners
   for (int j = 0; j < normalizedResult.rows ; j++ ) {
       for (int i = 0; i < normalizedResult.cols; i++ ) {
          if ((int) normalizedResult.at<float>(j,i) > threshold ) {
             cornerPoints.push_back(Point(i,j));
             // std::cout << "Corner at " << normalizedResult.at<float>(j,i) << std::endl;
             circle( normalizedScaledResult, Point( i, j ), 5,  Scalar(0), 2, 8, 0 );
          }
       }
   }

   // show normalized result with circles drawn
   namedWindow("Harris corner", CV_WINDOW_AUTOSIZE);
   imshow("Harris corner", normalizedScaledResult);

   // return corner points found in image
   // std::cout << "Corner Point: " << cornerPoint << std::endl;
   return cornerPoints;
}

cv::Mat morphologicalClosing(cv::Mat src) 
{
   cv::Mat resultDilate, resultClose;

   // generate closing kernel
   Mat kernel(4, 4, CV_8UC1, Scalar(255, 255, 255));

   // apply dilation
   dilate(src, resultDilate, kernel);

   // apply erosion
   erode(resultDilate, resultClose, kernel);

   // return filtered image
   return resultClose;
}

void fastXCornerDetect(cv::Mat src, int threshold)
{
   cv::Mat src_grey;

   // convert to greyscale
   cvtColor(src, src_grey, CV_BGR2GRAY );

   // perform FAST corner detect
   FAST(src_grey, keypoints, threshold, true);
}

double calculateAngleFromMoments(cv::Mat src, int comX, int comY) 
{
   // cv::Point COM;
   unsigned int xBar, yBar;
   unsigned int u11, u20, u02;
   int theta;

   // initialize central moments
   u11 = 0; 
   u20 = 0;
   u02 = 0;

   // calculate center of mass for object
   // COM = centerOfMass(src);
   xBar = comX;
   yBar = comY;

   // calculate central momemts
   for (int j = 0; j < src.rows; j++) {
      for (int i = 0; i < src.cols; i++) {
         u11 += (src.at<unsigned char>(j, i) / 255) * (j-yBar) * (i-xBar); // normalizing with / 255
         u20 += (src.at<unsigned char>(j, i) / 255) * (i-xBar) * (i-xBar); 
         u02 += (src.at<unsigned char>(j, i) / 255) * (j-yBar) * (j-yBar);
      }
   }
   std::cout << "u11: " << u11 << std::endl;
   std::cout << "u20: " << u20 << std::endl;
   std::cout << "u02: " << u02 << std::endl;
   
   // calculate orientation using the central moments
   theta = 0.5 * atan((2 * u11) / (u20 - u02));
   // convert to degrees
   theta = theta * (180 / 3.141529);
   std::cout << "Theta: " << theta << std::endl;

   return theta;
}

void matchCornerToCOM(int comX, int comY, char color) 
{
   int distance;
   bool cornerFound = false;

   // Iterate through array of corner points
   for (int i = 0; i < ARRAY_SIZE; i++) {
      distance = abs(comY - cornerPointsCV[i].y) + abs(comX - cornerPointsCV[i].x);

      // if distance is less than threshold then it's a COM/corner pair for a single robot
      std::cout << "distance : " << distance << std::endl;
      if (distance < 100 && !cornerFound) {
         if (color == 'r') {
            std::cout << "red color corners: " << cornerPointsCV[i].x << ", " << cornerPointsCV[i].y << std::endl;
            redRobotCoords[2] = cornerPointsCV[i].x;
            redRobotCoords[3] = cornerPointsCV[i].y;  
            cornerFound = true;
         }
         else if (color == 'b' && !cornerFound) {
            std::cout << "blue color corners: " << cornerPointsCV[i].x << ", " << cornerPointsCV[i].y << std::endl;
            blueRobotCoords[2] = cornerPointsCV[i].x;
            blueRobotCoords[3] = cornerPointsCV[i].y;  
            cornerFound = true;
         }
      }
   }
}

// FINDME: Deprecated code below
/*
// Global variables
// Mat src, src_gray, labeledResult, labeledResultSeq;
// std::vector<cv::Mat> robotBodies;
// int thresh = 200;
// int max_thresh = 255;
// int numComponents;

// char* source_window = "Source image";
// char* corners_window = "Corners detected";

// Function header
std::vector<cv::Point> findRobotBody(cv::Mat src, int thresholdStep, int numComponents);

// perform morphological opening (erode, then dilate)
cv::Mat morphologicalOpening(cv::Mat src);

double calculateAngleFromMoments(cv::Mat src);

double calculateAngleFromPoints(cv::Mat src, std::vector<cv::Point> COMs, std::vector<cv::Point> corners);

// Median filter function
cv::Mat medianFilter(cv::Mat src, int window);

// Detect corners using harris and return corner points
std::vector<cv::Point> harrisCornerDetect(cv::Mat src, int threshold);

// filter black color to isolate robot body
cv::Mat blackFilter(cv::Mat src, int thresh);

// calculate center of mass
cv::Point centerOfMass(cv::Mat src);

// Connected component labeling
int connectedComponent(cv::Mat src);

// sequential connected component labeling
int connectedComponentSequential(cv::Mat src);

int main( int argc, char** argv )
{
   cv::Mat medianFilterResult;
   cv::Mat blackFilterResult;
   std::vector<cv::Point> cornerPoints;
   std::vector<cv::Point> COMs;

   // Load source image from command line and convert it to gray
   src = imread( argv[1], 1 );
   cvtColor( src, src_gray, CV_BGR2GRAY );

   // Create a window of original image
   namedWindow( source_window, CV_WINDOW_AUTOSIZE );
   imshow(source_window, src_gray);

   // perform median filtering
   // result = medianFilter(src, 3);
   medianFilterResult = medianFilter(src_gray, 5);
   namedWindow("median filtered 5", CV_WINDOW_AUTOSIZE);
   imshow("median filtered 5", medianFilterResult);
   
   // perform harris corner detection of median filtered image
   cornerPoints = harrisCornerDetect(medianFilterResult, 220);

   std::cout << cornerPoints << std::endl;

   // takes in greyscale image
   blackFilterResult = blackFilter(medianFilterResult, 50);

   // Center of Mass calculation
   centerOfMass(blackFilterResult);

   // connected component labeling 
   int numComponents = connectedComponent(blackFilterResult);

   // find robot body center of mass
   // returns ONE center of mass but need to return both
   // setting global robot bodies vector inside function
   COMs = findRobotBody(labeledResult, 20, 13);

   // Find robots' orientation
   // testing with one robot body for now
   // double angle = calculateAngleFromMoments(robotBodies[1]);
   double angle = calculateAngleFromPoints(robotBodies[0], COMs, cornerPoints );

   // find robot bodies using sequential cclabel
   numComponents = connectedComponentSequential(blackFilterResult);
   // COMs = findRobotBody(labeledResultSeq, 20, numComponents);
   namedWindow("labeled result seq", CV_WINDOW_AUTOSIZE);
   imshow("labeled result seq", labeledResultSeq);

   // try morophological opening operation on binary image
   cv::Mat openingFilter = morphologicalOpening(blackFilterResult);
   numComponents = connectedComponentSequential(openingFilter);
   namedWindow("labeled result seq open", CV_WINDOW_AUTOSIZE);
   imshow("labeled result seq open", labeledResultSeq);

   // find robots' COMs
   COMs = findRobotBody(labeledResultSeq, 30, 2);

   waitKey(0);
   return(0);
}

cv::Mat medianFilter(cv::Mat src, int window)
{
   // Resulting filtered image to return
   cv::Mat filteredImage;

   // use OpenCV function medianBlur for median filtering
   medianBlur(src, filteredImage, window);

   // return filtered image
   return filteredImage;
   
}

cv::Mat blackFilter(cv::Mat src, int thresh)
{
   cv::Mat blackOnly;
   // inRange(src, Scalar(230,230,230), Scalar(255, 255, 255), blackOnly);

   // input array is greyscale so just need to use threshold API
   threshold(src, blackOnly, thresh, 255, THRESH_BINARY_INV);
   // FINDME: Changing treshold to make non inverting binary
   // threshold(src, blackOnly, thresh, 255, THRESH_BINARY);

   // show black filtered image
   namedWindow("Black Filter", CV_WINDOW_AUTOSIZE);
   imshow("BlackFilter", blackOnly);

   return blackOnly;
}

std::vector<cv::Point> harrisCornerDetect(cv::Mat src, int threshold)
{
   cv::Mat result;
   cv::Mat normalizedResult;
   cv::Mat normalizedScaledResult;
   std::vector<cv::Point> cornerPoints;
   
   // detection parameters
   int blockSize = 2;
   int apertureSize = 3;
   double k = 0.04;

   // Detect corners
   cornerHarris(src, result, blockSize, apertureSize, k, BORDER_DEFAULT);

   // Normalizing
   normalize(result, normalizedResult, 0, 255, NORM_MINMAX, CV_32FC1, Mat() );
   convertScaleAbs( normalizedResult, normalizedScaledResult);

   // Drawing a circle around corners
   for (int j = 0; j < normalizedResult.rows ; j++ ) {
       for (int i = 0; i < normalizedResult.cols; i++ ) {
          if ((int) normalizedResult.at<float>(j,i) > threshold ) {
             cornerPoints.push_back(Point(i,j));
             // std::cout << "Corner at " << normalizedResult.at<float>(j,i) << std::endl;
             circle( normalizedScaledResult, Point( i, j ), 5,  Scalar(0), 2, 8, 0 );
          }
       }
   }

   // show normalized result with circles drawn
   namedWindow("Harris corner", CV_WINDOW_AUTOSIZE);
   imshow("Harris corner", normalizedScaledResult);

   // return corner points found in image
   // std::cout << "Corner Point: " << cornerPoint << std::endl;
   return cornerPoints;
}

void setLabel(cv::Mat src, cv::Mat result, int x, int y, int l) 
{
   // set output image pixel at x,y to be l
   result.at<unsigned char>(y,x) = l;
   
   // check all neighbors of object pixel
   // set labels recursively
   if (src.at<unsigned char>(y+1, x) != 0 && result.at<unsigned char>(y+1, x) == 0) {
      setLabel(src, result, x, y+1, l);
   }
   if (src.at<unsigned char>(y-1, x) != 0 && result.at<unsigned char>(y-1, x) == 0) {
      setLabel(src, result, x, y-1, l);
   }
   if (src.at<unsigned char>(y, x+1) != 0 && result.at<unsigned char>(y, x+1) == 0) {
      setLabel(src, result, x+1, y, l);
   }
   if (src.at<unsigned char>(y, x-1) != 0 && result.at<unsigned char>(y, x-1) == 0) {
      setLabel(src, result, x-1, y, l);
   }
}

int connectedComponent(cv::Mat src)
{
   int numberOfComponents;
   // FINDME: Using labeledResult global var for output
   // cv::Mat result;
   std::vector<Point> neighbors;
   unsigned char label = 20;
  
   // initialize empty image
   labeledResult = Mat::zeros(src.size(), CV_8UC1); 

   // indices starting at 1 to avoid nonexistent neighbor issue
   for (int j = 1; j < src.rows - 1; j++) {
      for (int i = 1; i < src.cols - 1; i++) {
         // Check if pixel is in background or not
         // Check if pixel is unlabled or not
         if (src.at<unsigned char>(j,i) != 0 && (labeledResult.at<unsigned char>(j,i) == 0)) {
            // recursive call...
            setLabel(src, labeledResult, i, j, label);
            label += 20; 
            numberOfComponents++;
         }
      }
   }

   // Show labeled result
   namedWindow("labeled" , CV_WINDOW_AUTOSIZE );
   imshow("labeled", labeledResult );

   std::cout << "Number of components: " << numberOfComponents << std::endl;

   return numberOfComponents;
}

unsigned int calculateArea(cv::Mat src) 
{
   unsigned int area;

   for (int j = 0; j < src.rows; j++) {
      for (int i = 0; i < src.cols; i++ ) {
         area += src.at<unsigned char>(j, i);
      }
   }

   return area;
}

cv::Point centerOfMass(cv::Mat src)
{
   unsigned int m00, m01, m10; // Moment values
   unsigned int xBar, yBar; // Center of mass coordinates

   // init values
   m00 = 0;
   m01 = 0;
   m10 = 0;
   xBar = 0;
   yBar = 0;

   // iterate through all pixel values
   for (int j = 0; j < src.rows; j++) {
      for (int i = 0; i < src.cols; i++) {
         m00 += src.at<unsigned char>(j, i);
         m01 += src.at<unsigned char>(j, i) * j;
         m10 += src.at<unsigned char>(j, i) * i;
      }
   }
   
   std::cout << "Area: " << m00 << std::endl;
   std::cout << "M10: " << m10 << std::endl;
   std::cout << "M01: " << m01 << std::endl;

   xBar = m10 / m00;
   yBar = m01 / m00;
   std::cout << "Point: " << Point(xBar, yBar) << std::endl;

   // Draw circle at center of mass
   // circle(src, Point(xBar, yBar), 6, Scalar(255, 255, 255), 2, 8, 0);
   // namedWindow( "Center of mass", CV_WINDOW_AUTOSIZE );
   // imshow( "Center of mass", src );

   return Point(xBar, yBar);
}

// Find robot body based on connected components
std::vector<cv::Point> findRobotBody(cv::Mat src, int thresholdStep, int numComponents)
{
   cv::Mat result;
   std::vector<cv::Point> COM;
   char windowTitle[100];

   for (int i = 0; i < numComponents; i++) {
      // threshold each component
      unsigned char currentThreshold = thresholdStep + (thresholdStep * i);
      // threshold(src, result, currentThreshold, 255, THRESH_BINARY_INV);
      inRange(src, currentThreshold, currentThreshold + 1, result);
      // bitwise_not(result, result);
      std::cout << "current threshold: " << thresholdStep + (thresholdStep * i) << std::endl;
      std::cout << "area: " << calculateArea(result) << std::endl;


      // check to see if area of object is sufficiently large
      // FINDME: Might need to change this area requirement based on morphological filtering
      if (calculateArea(result) > 50000) {

         // it's a robot body so calculate center of mass
         // COM = centerOfMass(result);
         COM.push_back(centerOfMass(result));
         std::cout << "Robot center of mass: " << COM << std::endl;

         sprintf(windowTitle, "%d", i);
         namedWindow(windowTitle, CV_WINDOW_AUTOSIZE);
         imshow(windowTitle, result);
 
         robotBodies.push_back(result);
      }
   }

   return COM;
}

double calculateAngleFromMoments(cv::Mat src) 
{
   cv::Point COM;
   unsigned int xBar, yBar;
   unsigned int u11, u20, u02;
   double theta;

   // initialize central moments
   u11 = 0; 
   u20 = 0;
   u02 = 0;

   // calculate center of mass for object
   COM = centerOfMass(src);
   xBar = COM.x;
   yBar = COM.y;

   // calculate central momemts
   for (int j = 0; j < src.rows; j++) {
      for (int i = 0; i < src.cols; i++) {
         u11 += src.at<unsigned char>(j, i) * (j-yBar) * (i-xBar);
         u20 += src.at<unsigned char>(j, i) * pow((i-xBar), 2.0);
         u02 += src.at<unsigned char>(j, i) * pow((j-yBar), 2.0);
      }
   }
   std::cout << "u11: " << u11 << std::endl;
   std::cout << "u20: " << u20 << std::endl;
   std::cout << "u02: " << u02 << std::endl;
   
   // calculate orientation using the central moments
   // theta = 0.5 * atan((2 * u11) / (u20 - u02));
   // // convert to degrees
   // theta = theta * (180 / 3.141529);
   // std::cout << "Theta: " << theta << std::endl;

   return theta;
}

double calculateAngleFromPoints(cv::Mat src, std::vector<cv::Point> COMs, std::vector<cv::Point> corners) 
{
   double theta;
   long long distance;
   unsigned char found = 0;
   char windowTitle[100];
   cv::Mat result = Mat::zeros(src.size(), CV_8UC1);

   // Check corner points and COM distance
   for (int j = 0; j < COMs.size(); j++) {
      for (int i = 0; i < corners.size(); i++) {
         // calculate distance from COM to corner point (city block)
         distance = abs(COMs[j].x - corners[i].x) + abs(COMs[j].y - corners[i].y);
         std::cout << i << " Distance: " << distance << std::endl;

         // COM and corner of individual robot will be close together
         if (distance < 100 ) { // && found < 2) {
            // draw test line
            // line(result, COMs[i], corners[i], Scalar(0, 0, 0), 8, 8);
            // circle(result, Point(236, 79), 3, Scalar(255, 255, 255), 2, 8, 0);
            // circle(result, Point(211, 247), 3, Scalar(255, 255, 255), 2, 8, 0);

            circle(result, corners[i], 3, Scalar(128, 128, 128), 2, 8, 0);
            // circle(result, , 3, Scalar(255, 255, 255), 2, 8, 0);
            line(result, COMs[j], corners[i], Scalar(255, 255, 255), 2, 8, 0);

            sprintf(windowTitle, "orientation %d", i);
            namedWindow(windowTitle, CV_WINDOW_AUTOSIZE);
            imshow(windowTitle, result);

            // calculate angle
            // Angle calculation depends on location of COM either using x or y for oppositive / adjacent
            if (COMs[j].y > corners[i].y) { 
               // opp/adjacent will be y/x
               theta = atan(abs(COMs[j].y - corners[i].y) / (abs(COMs[j].x - corners[i].x)));          
            std::cout << "Theta: " << theta << std::endl;
              
            }
            else {
               theta = atan(abs(COMs[j].x - corners[i].x) / abs(COMs[j].y - corners[i].y) );          
            std::cout << "Theta: " << theta << std::endl;
            }
               
            // convert to degrees
            theta = theta * (180 / 3.141529);
            std::cout << "Theta: " << theta << std::endl;
 
            // reinit resulting window
            result = Mat::zeros(src.size(), CV_8UC1);
            found++; 
            break;
         }
      }
   }
   return theta;
}

// check neighbor label values for sequential cclabel
int checkNeighborLabels(cv::Mat src, cv::Point pt, int label)
{
   int resultLabel = 0;
   
   // cordinates: top left corner is 0,0 in openCV
   // check if any neighbors are nonbackground and non zero
   if (src.at<unsigned char>(pt.y+1, pt.x) != 0 && labeledResultSeq.at<unsigned char>(pt.y+1, pt.x) != 0) {
      // south neighbor
      resultLabel = labeledResultSeq.at<unsigned char>(pt.y+1, pt.x);
   }
   if (src.at<unsigned char>(pt.y-1, pt.x) != 0 && labeledResultSeq.at<unsigned char>(pt.y-1, pt.x) != 0) {
      // north neighbor
      resultLabel = labeledResultSeq.at<unsigned char>(pt.y-1, pt.x);
   }
   if (src.at<unsigned char>(pt.y, pt.x+1) != 0 && labeledResultSeq.at<unsigned char>(pt.y, pt.x+1) != 0) {
      // east neighbor
      resultLabel = labeledResultSeq.at<unsigned char>(pt.y, pt.x+1);
   }
   if (src.at<unsigned char>(pt.y, pt.x-1) != 0 && labeledResultSeq.at<unsigned char>(pt.y, pt.x-1) != 0) {
      // west neighbor
      resultLabel = labeledResultSeq.at<unsigned char>(pt.y, pt.x-1);
   }

   // if resultLabel never changed from 0, no previously labeled neighbor
   if (!resultLabel) {
      label += 30;
      numComponents++;
      return label;
   }
   else {
      return resultLabel;
   }
}

int connectedComponentSequential(cv::Mat src)
{
   int label = 30;
   numComponents = 0;

   // zero out labeled result matrix
   labeledResultSeq = Mat::zeros(src.size(), CV_8UC1); 

   //First Pass 
   for (int j = 0; j < src.rows; j++) {
      for (int i = 0; i < src.cols; i++) {
         // Check if pixel is not in background
         if (src.at<unsigned char>(j, i) != 0) {
            // check neighbors (4 connected)
            label = checkNeighborLabels(src, Point(i,j), label);
            labeledResultSeq.at<unsigned char>(j, i) = label;
            // numComponents++;
         }
      }
   }
   
   std::cout << "Num components cclabel seq: " << numComponents << std::endl;
   return numComponents;
}

cv::Mat morphologicalOpening(cv::Mat src)
{
   cv::Mat resultErode;   
   cv::Mat resultOpen;

   // generate opening kernel
   Mat kernel(33, 33, CV_8UC1, Scalar(255, 255, 255));
   
   // Apply erosion
   erode(src, resultErode, kernel);
   // now dilate to finish opening
   dilate(resultErode, resultOpen, kernel);
   // show result
   namedWindow("open", CV_WINDOW_AUTOSIZE);
   imshow("open", resultOpen);
 
   return resultOpen;
}
*/

