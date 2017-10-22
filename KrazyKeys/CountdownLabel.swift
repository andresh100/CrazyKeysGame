//
//  CountdownLabel.swift
//  Timer
//
//  Created by Alissa Chiu on 10/21/17.
//  Copyright © 2017 getRekt. All rights reserved.
//

import SpriteKit

var elapsed : Int!
var remainingTime : Int!

class CountdownLabel : SKLabelNode {
    
    var endTime : NSDate!
    
    func update() {
        let timeLeftInteger = Int(timeLeft())
        text = "Time: "+String(timeLeftInteger)+"s"
        elapsed = timeLeftInteger
    }
    
    func remainingTime() -> Int {
        return Int(timeLeft())
    }
    
    func startWithDuration(duration: TimeInterval) {
        let timeNow = NSDate()
        endTime = timeNow.addingTimeInterval(duration)
    }
    
    func hasFinished() -> Bool {
        return timeLeft() == 0
    }
    
    private func timeLeft() -> TimeInterval {
        let now = NSDate()
        let remainingSeconds = endTime.timeIntervalSince(now as Date)
        return max(remainingSeconds, 0)
    }
    
}

