//
//  Game.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/28/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

var game: Game?

class Game {
    
    var word: String?
    var isPaused: Bool = true
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
        
        // we will need to set word
        
    }
    
    // called at game start and resume from pause screen
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        resume()
    }
    
    // This is called every second by the timer
    @objc
    func timerFired()
    {
        if !isPaused {
            timeElapsed += 1
            print("time elapsed: \(timeElapsed)")
            if timeElapsed >= timeAllowed
            {
                // time up!
                print("Time's up!")
            }
        }
        
    }
    
    // called when game paused
    func pause()
    {
        isPaused = true
    }
    
    // call to resume game
    func resume()
    {
        isPaused = false
    }
    
    // call to reset timer
    func reset()
    {
        timeElapsed = 0
    }
    
}
