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
                if let scene = scene {
                    if let view = scene.view {
                        let transition:SKTransition = SKTransition.doorsCloseVertical(withDuration: 1)
                        let scene:SKScene = EndScene(size: scene.frame.size)
                        view.presentScene(scene, transition: transition)
                    }
                }
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
    
    func updateScore() {
        if let scene = scene as? GameScene {
            scene.updateScore()
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
                if(score - 50 >= 0){
                    score -= 50
                } else if (score - 50 < 0){
                    score = 0
//                    make time left decrease as a penalty
//                    timeElapsed += 5
                }
                
//                let generator = UIImpactFeedbackGenerator(style: .heavy)
//                generator.impactOccurred()
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
