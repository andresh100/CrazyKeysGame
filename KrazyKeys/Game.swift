//
//  Game.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/28/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

class Game {
    
    var word: String?
    var isPaused: Bool?
    var difficulty: Int?
    var score: Int = 0
//    var countDown: CountdownLabel?
    
    var timer = Timer()
    var timeAllowed: TimeInterval = 60
    var timeElapsed: TimeInterval = 0
    
    init(difficulty: Int, secondsAllowed: TimeInterval, word: String) {
        self.timeAllowed = secondsAllowed
        self.difficulty = difficulty
        self.word = word
        self.isPaused = false
        
        // we will need to set word
        
        startTimer()
    }
    
    // called at game start and resume from pause screen
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
    }
    
    // This is called every second by the timer
    @objc
    func timerFired() -> Void
    {
        timeElapsed += 1
        
        // check timeElapsed against timeAllowed
        if timeElapsed >= timeAllowed
        {
            // time up!
        }
    }
    
    // called when game paused
    func pause() -> Void
    {
        timer.invalidate()
    }
    
    
    
    
}
