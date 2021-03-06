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

        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)

        // Step 2.1c
        // Save the return value of checkWalls() to a constant called myWallInfo.
        let myWallInfo = checkWalls(myRobot)
        
        // Step 2.2a
        // Categorize the robot's current location based on the number of walls
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        // Define the constant, isTwoWayPath
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        // Define the constant, isDeadEnd
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        
        // Step 2.2b
        // Test whether the values of the above constants are correct
        print("ThreeWayJunction:\(isThreeWayJunction) TwoWayPath:\(isTwoWayPath) DeadEnd:\(isDeadEnd)")

        // Step 2.3a
        // Three-way Path - else-if statements
        // If the robot encounters a three way junction and there IS a wall ahead, it should randomly rotate right or left.
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
        
        // If the robot encounters a three way junction and there is NO wall ahead, it should continue straight or rotate.
        if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot)
        }
        
        // Step 2.3b
        // Two-way Path - else-if statements
        // If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
        }
        // If the robot encounters a two way path and there IS a wall ahead, it should randomly rotate.
        if isTwoWayPath && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
        
        // Step 2.3c
        // Dead end - else-if statements
        // If the robot encounters a dead end and there is NO wall ahead it should move forward.
        if isDeadEnd && !robotIsBlocked {
            myRobot.move()
        }
        // If the robot encounters a dead end and there IS a wall ahead it should rotateRight().
        if isDeadEnd && robotIsBlocked {
            myRobot.rotateRight()
        }
    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
}
