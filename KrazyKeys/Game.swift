//
//  Game.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/28/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

let rightKeySound = NSURL(fileURLWithPath: (Bundle.main.path(forResource: "keyPressBright", ofType: "wav"))!)
let wrongKeySound = NSURL(fileURLWithPath: (Bundle.main.path(forResource: "wrongKeyPress", ofType: "wav"))!)
var audioPlayer: AVAudioPlayer?

var game: Game?

class Game {
    
    var word: String?
    var wordProgress = ""
    var wordTest: String?
    var wordsData: [String]?
    var wordsData2: [String]?
    var wordsCompleted = [Int]()
    var isPaused: Bool = true
    var quit: Bool = false
    var needsUpdate: Bool = false
    var difficulty: Int?
    var score: Int = 0
    var scene: SKScene?
    var x = 0
    //    var countDown: CountdownLabel?
    
    var timer = Timer()
    var timerInterval: TimeInterval = 0
    var timeAllowed: TimeInterval = 30
    var timeElapsed: TimeInterval = 0
    
    var nameProgress = "ENTER INITIALS:"
    
    init(scene: SKScene, difficulty: Int, secondsAllowed: TimeInterval, word: String) {
        self.scene = scene
        self.timeAllowed = secondsAllowed
        self.difficulty = difficulty
        self.word = word
        
        // randomizing the word
        chooseNewWord()
    }
    
    func chooseNewWord() {
        if self.difficulty == 1 || self.difficulty == 0 {
            wordsData = gettingRandomWords()
            if let wordsData = wordsData {
                if wordsCompleted.count == wordsData.count {
                    wordsCompleted.removeAll()
                    print("Clearing words completed")
                }
                var num = Int(arc4random_uniform(UInt32(wordsData.count)))
                while (wordsCompleted.contains(num)) {
                    num = Int(arc4random_uniform(UInt32(wordsData.count)))
                }
                wordsCompleted.append(num)
                print("Word number: \(num)")
                print(("Completed word numbers: \(String(describing: wordsCompleted))"))
                wordTest = wordsData[num]
                self.word = wordTest
            } else {
                print("failed to unwrap wordsData \(#line)")
            }
        }
        else if self.difficulty == 2 {
            wordsData2 = gettingRandomWords()
            if let wordsData2 = wordsData2 {
                if wordsCompleted.count == wordsData2.count {
                    wordsCompleted.removeAll()
                    print("Clearing words completed")
                }
                var num = Int(arc4random_uniform(UInt32(wordsData2.count)))
                while (wordsCompleted.contains(num)) {
                    num = Int(arc4random_uniform(UInt32(wordsData2.count)))
                }
                wordsCompleted.append(num)
                print("Word number: \(num)")
                print(("Completed word numbers: \(String(describing: wordsCompleted))"))
                wordTest = wordsData2[num]
                self.word = wordTest
            } else {
                print("failed to unwrap wordsData2 \(#line)")
            }
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
                let highscore5 : Int?
                if game!.difficulty == 0 {
                    highScore5 = userDefaults.integer(forKey: "highScore5")
                } else if game!.difficulty == 1 {
                    highScore5 = userDefaults.integer(forKey: "m_highScore5")
                } else if game!.difficulty == 2 {
                    highScore5 = userDefaults.integer(forKey: "h_highScore5")
                }
                
                if let scene = scene {
                    //Choose which EndScene to present
                    //                    if let view = scene.view {
                    //                        let transition:SKTransition = SKTransition.doorsCloseVertical(withDuration: 1)
                    //                        let scene:SKScene = EndScene2(size: scene.frame.size)
                    //                        view.presentScene(scene, transition: transition)
                    //                    }
                    if score >= highScore5! {
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
        if self.difficulty == 1 || self.difficulty == 0{
            let path = Bundle.main.path(forResource: "words", ofType: "plist")
            let dict = NSDictionary(contentsOfFile: path!)
            words = dict!.object(forKey: "Words") as! [String]
        } else if self.difficulty == 2 {
            let path = Bundle.main.path(forResource: "words2", ofType: "plist")
            let dict = NSDictionary(contentsOfFile: path!)
            words = dict!.object(forKey: "Words2") as! [String]
        }
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
            if((timeAllowed-timeElapsed) <= 10 && (timeAllowed-timeElapsed) > 0 && keyboardSound == true){
                print("Music Faster")
                inGame = true
                MusicHelper.sharedHelper.updateBackgroundMusic()
            }
        }
    }
    
    func tryInput(letter: String) {
        // resolve letter tried
        print("tried letter \(letter)")
        if let word = word {
            
            
            if Array(word)[wordProgress.count] == Array(letter.uppercased())[0] {
                wordProgress.append(letter)
                score += 25
                
                if difficulty == 2 {
                    if let scene = scene as? GameScene {
                        print("x: \(x)")
                        print("math: \(x%2)")
                        if(x%4 == 0 || x%3 == 0){
                            scene.keyboard.scrambleKeys(swaps: 13)
                        }
                        x+=1
                    }
                }
                print("\(keyboardSound)")
                if(keyboardSound == true){
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf:rightKeySound as URL)
                        audioPlayer!.prepareToPlay()
                        audioPlayer!.play()
                    }
                    catch{
                        print("error key pressed sound")
                    }
                }
            } else {
                print("wrong letter \(letter)")
                timeElapsed += 5
                updateTimerLabel()
                if(score - 15 >= 0){
                    score -= 15
                } else if (score - 15 < 0){
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
                if(keyboardSound == true){
                    do {
                        audioPlayer = try AVAudioPlayer(contentsOf:wrongKeySound as URL)
                        //        audioPlayer!.numberOfLoops = -1
                        audioPlayer!.prepareToPlay()
                        audioPlayer!.play()
                    }
                    catch{
                        print("error key pressed sound")
                    }
                }
            }
            
            if wordProgress.count == word.count {
                wordProgress = ""
                chooseNewWord()
                score += 50
                if difficulty == 0 {
                    timeAllowed += 2
                }else if difficulty == 1 {
                    timeAllowed += 3
                }else if difficulty == 2 {
                    timeAllowed += 5
                }
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
