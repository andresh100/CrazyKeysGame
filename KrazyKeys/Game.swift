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
    var scene: SKScene?
    //    var countDown: CountdownLabel?
    
    var timer = Timer()
    var timerInterval: TimeInterval = 0
    var timeAllowed: TimeInterval = 60
    var timeElapsed: TimeInterval = 0
    
    init(scene: SKScene, difficulty: Int, secondsAllowed: TimeInterval, word: String) {
        self.scene = scene
        self.timeAllowed = secondsAllowed
        self.difficulty = difficulty
        self.word = word
        
        // randomizing the word
        chooseNewWord()
    }
    
    func chooseNewWord() {
        wordsData = gettingRandomWords()
        if let wordsData = wordsData {
            wordTest = wordsData[Int(arc4random_uniform(UInt32(wordsData.count)))]
            self.word = wordTest
        } else {
            print("failed to unwrap wordsData \(#line)")
        }
    }
    
    func changeScene(to scene: SKScene) {
        self.scene = scene
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
                //                print("Time's up!")
                
                
                //Saving score
                let score = game!.score
                
                let userDefaults = Foundation.UserDefaults.standard
                
                //let highScore1 = userDefaults.integer(forKey: "highScore1")
                //let highScore2 = userDefaults.integer(forKey: "highScore2")
                //let highScore3 = userDefaults.integer(forKey: "highScore3")
                //let highScore4 = userDefaults.integer(forKey: "highScore4")
                let highScore5 = userDefaults.integer(forKey: "highScore5")
                
                /*
                var finalHighScore1: Int
                var finalHighScore2: Int
                var finalHighScore3: Int
                var finalHighScore4: Int
                var finalHighScore5: Int
                
                if highScore1 != 0 {
                    finalHighScore1 = highScore1
                } else {
                    finalHighScore1 = 0
                }
                
                if highScore2 != 0 {
                    finalHighScore2 = highScore2
                } else {
                    finalHighScore2 = 0
                }
                
                if highScore3 != 0 {
                    finalHighScore3 = highScore3
                } else {
                    finalHighScore3 = 0
                }
                
                if highScore4 != 0 {
                    finalHighScore4 = highScore4
                } else {
                    finalHighScore4 = 0
                }
                
                if highScore5 != 0 {
                    finalHighScore5 = highScore5
                } else {
                    finalHighScore5 = 0
                }
                
                if score > finalHighScore1 {
                    finalHighScore5 = finalHighScore4
                    finalHighScore4 = finalHighScore3
                    finalHighScore3 = finalHighScore2
                    finalHighScore2 = finalHighScore1
                    finalHighScore1 = score
                } else if score > finalHighScore2 {
                    finalHighScore5 = finalHighScore4
                    finalHighScore4 = finalHighScore3
                    finalHighScore3 = finalHighScore2
                    finalHighScore2 = score
                } else if score > finalHighScore3 {
                    finalHighScore5 = finalHighScore4
                    finalHighScore4 = finalHighScore3
                    finalHighScore3 = score
                } else if score > finalHighScore4 {
                    finalHighScore5 = finalHighScore4
                    finalHighScore4 = score
                } else if score > finalHighScore5 {
                    finalHighScore5 = score
                }
                
                userDefaults.set(finalHighScore1, forKey: "highScore1")
                userDefaults.set(finalHighScore2, forKey: "highScore2")
                userDefaults.set(finalHighScore3, forKey: "highScore3")
                userDefaults.set(finalHighScore4, forKey: "highScore4")
                userDefaults.set(finalHighScore5, forKey: "highScore5")
                print("High score 1: \(highScore1)")
                print("High score 2: \(highScore2)")
                print("High score 3: \(highScore3)")
                print("High score 4: \(highScore4)")
                print("High score 5: \(highScore5)")
 
 */
 
                
                
                if let scene = scene {
                    //Choose which EndScene to present
                    if score >= highScore5 {
                        if let view = scene.view {
                            let transition:SKTransition = SKTransition.doorsCloseVertical(withDuration: 1)
                            let scene:SKScene = EndScene2(size: scene.frame.size)
                            view.presentScene(scene, transition: transition)
                        }
                    } else {
                        if let view = scene.view {
                            let transition:SKTransition = SKTransition.doorsCloseVertical(withDuration: 1)
                            let scene:SKScene = EndScene(size: scene.frame.size)
                            view.presentScene(scene, transition: transition)
                        }
                    }
                }
            }
        }
        
        timerInterval = timeAllowed - timeElapsed
        if (timerInterval < 0)
        {
            // time's up?
            timerInterval = 0
        }
        
        updateTimerLabel()
        
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
    
    func updateScore() {
        if let scene = scene as? GameScene {
            scene.updateScore()
            //            print("score updated")
        }
    }
    
    func updateProgressLabel() {
        if let scene = scene as? GameScene {
            scene.updateProgressLabel()
        }
    }
    
    func updateLabel() {
        if let scene = scene as? GameScene {
            scene.updateLabel()
        }
    }
    
    func updateTimerLabel() {
        if let scene = scene as? GameScene {
            scene.updateTimerLabel()
        }
    }
    
    func tryInput(letter: String) {
        // resolve letter tried
        print("tried letter \(letter)")
        if let word = word {
            
            
            if Array(word)[wordProgress.count] == Array(letter.uppercased())[0] {
                wordProgress.append(letter)
                score += 100
                
                if difficulty == 2 {
                    if let scene = scene as? GameScene {
                        scene.keyboard.scrambleKeys(swaps: 13)
                    }
                }
                
            } else {
                print("wrong letter \(letter)")
                timeElapsed += 6
                updateTimerLabel()
                if(score - 50 >= 0){
                    score -= 50
                } else if (score - 50 < 0){
                    score = 0
                }
                let feedbackGenerator = UINotificationFeedbackGenerator()
                feedbackGenerator.notificationOccurred(.error)
                
                if let scene = scene as? GameScene {
                    scene.wordProgressLabel.fontColor = UIColor.red
                    scene.wordLabel.fontColor = UIColor.red
                    
                    let waitAct = SKAction.wait(forDuration: 0.6)
                    scene.wordProgressLabel.run(waitAct)  {
                        scene.wordProgressLabel.fontColor = UIColor.green
                        scene.wordLabel.fontColor = UIColor.white
                    }
                }
            }
            
            if wordProgress.count == word.count {
                wordProgress = ""
                chooseNewWord()
                score += 200
                timeAllowed += 6
                updateTimerLabel()
                guard let difficulty = difficulty else {
                    print("no difficulty?")
                    return
                }
                
                if difficulty == 1 {
                    if let scene = scene as? GameScene {
                        
                        scene.keyboard.scrambleKeys(swaps: 13)
                    }
                }
            }
            
        } else {
            print("no word: line \(#line)")
        }
        
        print("wordProgress: \(wordProgress)")
        
        updateScore()
        updateProgressLabel()
        updateLabel()
    }
}
