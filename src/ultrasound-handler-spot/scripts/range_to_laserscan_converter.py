#!/usr/bin/env python2

import rospy
import numpy as np
from sensor_msgs.msg import LaserScan
from sensor_msgs.msg import Range

class Sonar2LaserScan: 
    def __init__(self): 
        self.pub_front = rospy.Publisher('/laser_front', LaserScan, queue_size=10)
        rospy.loginfo("Setup Publisher to /laser_front")
        self.pub_rear = rospy.Publisher('/laser_rear', LaserScan, queue_size=10)
        rospy.loginfo("Setup Publisher to /laser_rear")
        self.range_sub_front = rospy.Subscriber('/ultrasound_front', Range, self.sonar_front_callback, queue_size=10)
        self.range_sub_rear = rospy.Subscriber('/ultrasound_rear', Range, self.sonar_rear_callback, queue_size=10)


        self.msg = LaserScan()
        self.msg.angle_min = -7.5*np.pi/180
        self.msg.angle_max = 7.5*np.pi/180
        self.msg.angle_increment = 1*np.pi/180
        self.msg.time_increment = 0
        self.msg.scan_time = 0
        self.msg.range_min = 0.02
        self.msg.range_max = 2.0
        self.nb_point_per_sonar = int(((self.msg.angle_max-self.msg.angle_min)/self.msg.angle_increment))


    def sonar_front_callback(self, data):

        range_front = data.range

        if range_front>=self.msg.range_max:
            range_front = float("inf")
        elif range_front<self.msg.range_min:
            range_front = self.msg.range_min

        self.msg.header.stamp = rospy.Time.now()
        self.msg.header.frame_id = data.header.frame_id
        self.msg.ranges = [range_front]*self.nb_point_per_sonar

        self.pub_front.publish(self.msg)



    def sonar_rear_callback(self, data):

        range_rear = data.range

        if range_rear>=self.msg.range_max:
            range_rear = float("inf")
        elif range_rear<self.msg.range_min:
            range_rear = self.msg.range_min

        self.msg.header.stamp = rospy.Time.now()
        self.msg.header.frame_id = data.header.frame_id
        self.msg.ranges = [range_rear]*self.nb_point_per_sonar

        self.pub_rear.publish(self.msg)


if __name__ == '__main__':
    rospy.init_node("sonar_to_laserscan")
    rospy.loginfo("Node has been started...")

    Sonar2LaserScan()

    rospy.spin()