//
//  SpecialBadge.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import SpriteKit

class SpecialBadge: Badge {
    
    enum BadgeAnimation: Int {
        case GrowAndShrink = 0, Rotate, Shake
    }
    
    
    func a() {
        let x: Float = 10
        let y: Float = 6
        let numberOfTimes = 2.0 / 0.04
        var actionsArray = [SKAction]()
        
        for _ in 1...Int(numberOfTimes) {
            let dX = Float(arc4random_uniform(UInt32(x))) - x / 2
            let dY = Float(arc4random_uniform(UInt32(y))) - y / 2
            let action = SKAction.moveBy(x: CGFloat(dX), y: CGFloat(dY), duration: 0.02)
            actionsArray.append(action)
            actionsArray.append(action.reversed())
        }
        
        let sequencedAction = SKAction.sequence(actionsArray)
        run(SKAction.repeatForever(sequencedAction))
    }
    
    func b() {
        let action = SKAction.rotate(byAngle: CGFloat(-M_PI), duration: 1.5)
        run(SKAction.repeatForever(action))
    }
    
    func c() {
        let action1 = SKAction.scale(to: 0.8, duration: 1.0)
        let action2 = SKAction.scale(to: 1.1, duration: 1.0)
        let sequencedAction = SKAction.sequence([action1, action2])
        run(SKAction.repeatForever(sequencedAction))
    }
    
    override init(requestType: UDRequestType) {
        super.init(requestType: requestType)
        self.texture = SKTexture(imageNamed: "BadgeTeal")
        if let animation = BadgeAnimation.init(rawValue: Int(arc4random_uniform(3))) {
            switch animation {
            case .GrowAndShrink:
                a()
            case .Rotate:
                b()
            case .Shake:
                c()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
