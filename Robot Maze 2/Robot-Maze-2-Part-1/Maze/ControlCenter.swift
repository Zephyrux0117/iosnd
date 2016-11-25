//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {

        // Step 1.1c
        // Call the function, isFacingWall(), and define a constant to be equal to its return value.
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)

        // Step 1.1d
        // Test the isFacingWall() function. Be sure to comment out or delete your test code once you are finished testing!
//        print(robotIsBlocked)
//        if robotIsBlocked {
//            myRobot.rotateRight()
//        } else {
//            myRobot.move()
//        }

        // Step 1.4
        // Enables the robot to choose how to move.
        if robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else {
            continueStraightOrRotate(myRobot)
        }
    }

    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
        self.moveComplexRobot(robot)
    }

}
