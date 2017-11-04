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
    var wordProgress = ""
    var wordTest: String?
    var wordsData: [String]?
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
        
        // randomizing the word
        wordsData = gettingRandomWords()
        if let wordsData = wordsData {
            wordTest = wordsData[Int(arc4random_uniform(UInt32(wordsData.count)))]
            self.word = wordTest
        } else {
            print("failed to unwrap wordsData \(#line)")
        }
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
    
    func wordSplitting(n : String) -> Array<Character>
    {
        let char = Array(n)
        
        return char
    }
    
    func gettingRandomWords() -> [String]
    {
        var words = [String]()
        let path = Bundle.main.path(forResource: "words", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        words = dict!.object(forKey: "Words") as! [String]
        return words
    }
    
    func tryInput(letter: String)
    {
        // resolve letter tried
        print("tried letter \(letter)")
        if let word = word {
            
            if Array(word)[wordProgress.count] == Array(letter.uppercased())[0]
            {
                wordProgress.append(letter)
            }
        } else { print("no word: line \(#line)") }
        
        print("wordProgress: \(wordProgress)")
    }
}
