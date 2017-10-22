//
//  MediumGameScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//
import SpriteKit
import GameplayKit

class MediumGameScene: SKScene {

    var wordLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var pauseLabel : SKLabelNode!
    //var timerLabel : SKLabelNode!
    var timerLabel : CountdownLabel!
    var wordsData = [String]()
    
    
    //    previousWord = wordsData[Int(arc4random_uniform(UInt32(wordsData.count)))]
    //    wordLabel.text = previousWord
    
    
    
    override func sceneDidLoad() {
        
    }
    
    override func didMove(to view: SKView) {
        previousScene = "MediumGameScene"
        
        backgroundColor = SKColor.black
        
        let path = Bundle.main.path(forResource: "words", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        wordsData = dict!.object(forKey: "Words") as! [String]
        
        wordLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        wordLabel.fontColor = UIColor.white
        wordLabel.fontSize = 20
        wordLabel.position = CGPoint(x: frame.midX, y: self.size.height-180)
//        previousWord = wordsData[Int(arc4random_uniform(UInt32(wordsData.count)))]
//        wordLabel.text = previousWord
        wordLabel.text = wordTest
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: self.size.width-10, y: self.size.height-40)
        scoreLabel.text = "Score: 0"
        
        pauseLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        pauseLabel.fontColor = UIColor.yellow
        pauseLabel.fontSize = 20
        pauseLabel.horizontalAlignmentMode = .left
        pauseLabel.position = CGPoint(x: 10.0, y: self.size.height-40)
        pauseLabel.text = "II"
        
        timerLabel = CountdownLabel(fontNamed: "Fipps-Regular")
        timerLabel.fontColor = UIColor.green
        timerLabel.fontSize = 20
        timerLabel.position = CGPoint(x: frame.midX, y: self.size.height-120)
        //timerLabel.text = "Time: 0s"
        timerLabel.startWithDuration(duration: 61)
        
        self.addChild(scoreLabel)
        self.addChild(pauseLabel)
        self.addChild(wordLabel)
        self.addChild(timerLabel)
        
        let skView = self.view as! SKView
        skView.scene?.isPaused = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
                /*
                 case pauseLabel:
                 if let view = view {
                 let transition:SKTransition = SKTransition.fade(withDuration: 1)
                 let scene:SKScene = PauseScene(size: self.size)
                 self.view?.presentScene(scene, transition: transition)
                 }
                 */
            case pauseLabel:
                if let view = view {
                    let skView = self.view as! SKView
                    if skView.scene?.isPaused == false {
                        skView.scene?.isPaused = true
                        //let transition:SKTransition = SKTransition.fade(withDuration: 1)
                        //let scene:SKScene = PauseScene(size: self.size)
                        //self.view?.presentScene(scene, transition: transition)
                        //                        elapsed = Int(NSDate.timeIntervalSinceReferenceDate - 50)
                    } else {
                        skView.scene?.isPaused = false
                        timerLabel.startWithDuration(duration: Double(elapsed))
                        //                        timerLabel.startWithDuration(duration: TimeInterval(100-elapsed))
                    }
                }
            default:
                return
            }
        }
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        timerLabel.update()
    }
    
}

