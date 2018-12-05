#!/bin/bash

# below are the packages that are require to be installed in order to run correctly
VELODYNE_PKG="velodyne"
POINTCLOUD_TO_LASERSCAN_PKG="pointcloud_to_laserscan"
HECTOR_SLAM_PKG="hector_slam"
NAVIGATION_PKG="navigation"

# this script allows functionality to run with -r in order to reinstall libraries
# even if a grep returns that they are in the system

case $1 in
    -r)
        sudo apt-get install ros-kinetic-velodyne
        sudo apt-get install ros-kinetic-pointcloud-to-laserscan
        sudo apt-get install ros-kinetic-hector-slam
        sudo apt-get install ros-kinetic-navigation
esac

# the rest will run if there are no arguments supplied to the script

if [ -z $1 ]
then

    # installs the velodyne drivers if not found on the system

    if ! rospack list-names | grep -q $VELODYNE_PKG
    then
        echo "Installing ${VELODYNE_PKG} package."
        sudo apt-get install ros-kinetic-velodyne
    else
        echo "${VELODYNE_PKG} already found on system."
    fi

    # installs the laser scan to point cloud package if not found on the system

    if ! rospack list-names | grep -q $POINTCLOUD_TO_LASERSCAN_PKG
    then
        echo "Installing ${POINTCLOUD_TO_LASERSCAN_PKG} package."
        sudo apt-get install ros-kinetic-pointcloud-to-laserscan
    else
        echo "${POINTCLOUD_TO_LASERSCAN_PKG} already found on system."
    fi

    # installs the hector slam package if not found on the system

    if ! rospack list-names | grep -q $HECTOR_SLAM_PKG
    then
        echo "Installing ${HECTOR_SLAM_PKG} package."
        sudo apt-get install ros-kinetic-hector-slam
    else
        echo "${HECTOR_SLAM_PKG} already found on system."
    fi

    # install the navigation package if not found on the system

    if ! rospack list-names | grep -q "costmap_2d"
    then
        echo "Installing ${NAVIGATION_PKG} package."
        sudo apt-get install ros-kinetic-navigation
    else
        echo "${NAVIGATION_PKG} already found on system."
    fi
fi


