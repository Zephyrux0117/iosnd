//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(_ robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        print("randomlyRotateRightOrLeft: \(randomNumber)")
        
        if randomNumber == 1 {
            robot.rotateRight()
        }
        if randomNumber == 0 {
            robot.rotateLeft()
        }
    }
    
    func continueStraightOrRotate(_ robot: ComplexRobotObject, wallInfo:(up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        let randomNumber = arc4random() % 2
        print("continueStraightOrRotate: \(randomNumber)")
        
        if randomNumber == 1 {
            robot.move()
        }
        
        // Instead of calling randomlyRotateRightOrLeft() call turnTowardClearPath() when the robot has randomly chosen to rotate.
        if randomNumber == 0 {
            turnTowardClearPath(robot, wallInfo: wallInfo)
        }
    }

    func turnTowardClearPath(_ robot: ComplexRobotObject, wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        
        // Tell the robot which way to turn toward the clear path. There are four cases where the robot should rotate to the right (the first two have been done for you--uncomment the code below). Write the remaining two cases where the robot should rotate to the right. For all other cases, the robot should rotate to the left.
        if robot.direction == .left && wallInfo.down {
            robot.rotateRight()
        } else if robot.direction == .up && wallInfo.left {
            robot.rotateRight()
        } else if robot.direction == .right && wallInfo.up {
            robot.rotateRight()
        } else if robot.direction == .down && wallInfo.right {
            robot.rotateRight()
        } else {
            robot.rotateLeft()
        }
    }
}


