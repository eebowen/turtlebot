/*
 * Copyright (C) 2008, Morgan Quigley and Willow Garage, Inc.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *   * Neither the names of Stanford University or Willow Garage, Inc. nor the names of its
 *     contributors may be used to endorse or promote products derived from
 *     this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

// %Tag(FULLTEXT)%
#include "ros/ros.h"
#include "std_msgs/String.h"
#include <cmvision/Blob.h>
#include <cmvision/Blobs.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/Image.h>
#include <depth_image_proc/depth_traits.h>


int trashFound;
double Trash_y; /**< The minimum y position of the points in the box. */
double Trash_x; /**< The maximum y position of the points in the box. */
double k; /**< The maximum y position of the points in the box. */
bool new_Trash;

double min_y_; /**< The minimum y position of the points in the box. */
double max_y_; /**< The maximum y position of the points in the box. */
double min_x_; /**< The minimum x position of the points in the box. */
double max_x_; /**< The maximum x position of the points in the box. */
double max_z_; /**< The maximum z position of the points in the box. */
double goal_z_; /**< The distance away from the robot to hold the centroid */
double z_scale_; /**< The scaling factor for translational robot speed */
double x_scale_; /**< The scaling factor for rotational robot speed */


  ros::Subscriber sub;
  ros::Subscriber sub2;
  ros::Subscriber sub3 ;
  ros::Publisher cmdpub_;
ros::NodeHandlePtr nh;
ros::Publisher vel_pub;
geometry_msgs::Twist T;

/**
 * This tutorial demonstrates simple receipt of messages over the ROS system.
 */
// %Tag(CALLBACK)%
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s]", msg->data.c_str());
}
// %EndTag(CALLBACK)%

void pclCallBack(const sensor_msgs::ImageConstPtr& depth_msg) {
	T.linear.x = 0;
	T.angular.z = 0;

  ROS_INFO_THROTTLE(1,"In the PCL Call Back.");
  if (trashFound == 1) {
	  ROS_DEBUG_THROTTLE(1,"In the PCL with Trash.");

    uint32_t image_width = depth_msg->width;
    float x_radians_per_pixel = 60.0/57.0/image_width;
    float sin_pixel_x[image_width];
    for (int x = 0; x < image_width; ++x) {
      sin_pixel_x[x] = sin((x-image_width/2.0)*x_radians_per_pixel);
    }
    uint32_t image_height = depth_msg->height;
    float y_radians_per_pixel = 45.0/57.0/image_width;
    float sin_pixel_y[image_height];
    for (int y = 0; y < image_width; ++y) {
      sin_pixel_y[y] = sin((image_height/2.0-y)*y_radians_per_pixel);
    }

    //X Y Z of centroid
    float x = 0.0;
    float y = 0.0;
    float z = 1e6;

   // Number of points observed
    unsigned int n = 0;

    // Iterate through all points, find average of position
    const float* depth_row = reinterpret_cast<const float*>(&depth_msg->data[0]);
    int row_step = depth_msg -> step / sizeof(float);
    for (int v = 0; v<(int)depth_msg->height; ++v, depth_row += row_step)
    {
      for (int u = 0; u < (int)depth_msg->width;++u) 
      {
        float depth = depth_image_proc::DepthTraits<float>::toMeters(depth_row[u]);
        if (!depth_image_proc::DepthTraits<float>::valid(depth) || depth > max_z_) continue;
        float y_val = sin_pixel_y[v]*depth;
        float x_val = sin_pixel_x[u]*depth;
        if (y_val > min_y_ && y_val < max_y_ && x_val > min_x_ && x_val < max_x_)
        {
          x += x_val;
          y += y_val;
          z = std::min(z,depth); //depth assumed to be forward
          n++;
        }
      }
    }

    //If there are points, find the centroid and calculate command, otherwise publish stop.
  //ROS_INFO("Should be getting here.");


    if (n > 4000)
    { //STUCK HERE -- CMDPUB NOT PUSHING WHEEL COMMAND??
  ROS_INFO("%d", int(Trash_x));
double target_x = 256;
	if(Trash_x > target_x+5){
	T.angular.z = k*(Trash_x-target_x);
	}
	if(Trash_x < target_x-5){
	T.angular.z = k*(Trash_x-target_x);
	}
      x /= n;
      y /= n;
      if (z > max_z_) {
        ROS_DEBUG_THROTTLE(1, "Centroid too far away, stopping.");
        cmdpub_.publish(geometry_msgs::TwistPtr(new geometry_msgs::Twist()));
        return;
      }
      ROS_DEBUG_THROTTLE(1, "Centroid at %f %f %f with %d points", x, y , z, n);
      geometry_msgs::TwistPtr cmd(new geometry_msgs::Twist());
      cmd->linear.x = 1;
      cmdpub_.publish(cmd);
    }
    else
    {
      ROS_INFO_THROTTLE(1, "Not enough points detected.");
    }
	trashFound = 0;

  }
vel_pub.publish(T);

}


void blobsCallBack(const cmvision::Blobs& blobsin) {
  ROS_DEBUG_THROTTLE(1,"In callback");
  for (int i = 0; i < blobsin.blob_count; i++) {
     if (blobsin.blobs[i].red == 43 && blobsin.blobs[i].green == 66 && blobsin.blobs[i].blue == 60 ) {
     // ROS_INFO("Found the trash can.");
      trashFound = 1;
    	Trash_x = blobsin.blobs[i].x;
    	Trash_y = blobsin.blobs[i].y;
  ROS_INFO("blobs");
  ROS_INFO("%d", int(blobsin.image_width));
	new_Trash = true;
    }
  } 
}

int main(int argc, char **argv)
{
  ROS_INFO("I'm alive");
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line.
   * For programmatic remappings you can use a different version of init() which takes
   * remappings directly, but for most command-line programs, passing argc and argv is
   * the easiest way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  trashFound = 0;
  ros::init(argc, argv, "listener");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  ros::NodeHandle n;

  /**
   * The subscribe() call is how you tell ROS that you want to receive messages
   * on a given topic.  This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing.  Messages are passed to a callback function, here
   * called chatterCallback.  subscribe() returns a Subscriber object that you
   * must hold on to until you want to unsubscribe.  When all copies of the Subscriber
   * object go out of scope, this callback will automatically be unsubscribed from
   * this topic.
   *
   * The second parameter to the subscribe() function is the size of the message
   * queue.  If messages are arriving faster than they are being processed, this
   * is the number of messages that will be buffered up before beginning to throw
   * away the oldest ones.
   */
// %Tag(SUBSCRIBER)%
sub = n.subscribe("chatter", 1000, chatterCallback);
sub2 = n.subscribe("/blobs",100,blobsCallBack);
sub3 = n.subscribe<sensor_msgs::Image>("/camera/depth/image_rect",1,pclCallBack);
cmdpub_ = n.advertise<geometry_msgs::Twist> ("cmd_vel",1);

nh = boost::make_shared<ros::NodeHandle>();

vel_pub = nh->advertise<geometry_msgs::Twist>("cmd_vel_mux/input/teleop", 1000);

// %EndTag(SUBSCRIBER)%

//Setting y,x, z min/max values
    min_y_ = -0.10;
    max_y_ = 0.40;
    min_x_ = -0.80;
    max_x_ = 0.80;
    max_z_ = 2.0;
    goal_z_ = 0.6;
    z_scale_ = 5.0;
    x_scale_ = 1.0;
    Trash_x = -1000000;
    Trash_y = -1000000;
new_Trash = false;
k = -1;

  /**
   * ros::spin() will enter a loop, pumping callbacks.  With this version, all
   * callbacks will be called from within this thread (the main one).  ros::spin()
   * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
   */
// %Tag(SPIN)%
  ros::spin();
// %EndTag(SPIN)%

  return 0;
}
// %EndTag(FULLTEXT)%

