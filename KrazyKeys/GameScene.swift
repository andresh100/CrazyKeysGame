//
//  GameScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var wordLabel : SKLabelNode!
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var pauseLabel : SKLabelNode!
    var timerLabel : CountdownLabel!
    
    //    var keyboard = Keyboard(rect: frame)
    var keyboard : Keyboard!
    
    override func sceneDidLoad() {
        
        
        
        print(frame)
        //        print(keyboard.frame)
        //        print(keyboard.frame)
        //        print(keyboard.isHidden)
    }
    
    override func didMove(to view: SKView) {
        //Add Pause (Resume, Quit)
        //Add Score ()
        //Add Timer (Countdown 30 seg)
        //Add Random Word Label (Choose from a pool of random words)
        //Add Text input (Location where each letter will be shown when user inputs from keyboard)
        //Add random keyboard letters Locations ()
        
        previousScene = "GameScene"
        backgroundColor = SKColor.black
        
        wordLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        wordLabel.fontColor = UIColor.white
        wordLabel.fontSize = 20
        wordLabel.position = CGPoint(x: frame.midX, y: self.size.height-180)
        wordLabel.text = game!.wordTest
        
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.white
        welcomeLabel.fontSize = 14
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        switch (game!.difficulty!)
        {
        case 1:
            welcomeLabel.text = "EASY"
        case 2:
            welcomeLabel.text = "MEDIUM"
        default:
            welcomeLabel.text = "DEFAULT"
        }
        
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
        timerLabel.startWithDuration(duration: (game!.timeAllowed-game!.timeElapsed))
        
        
        
//        timerLabel = SKLabelNode(fontNamed: "Fipps-Regular")
//        timerLabel.fontColor = UIColor.green
//        timerLabel.fontSize = 20
////        timerLabel.position = CGPoint(x: 10.0, y: self.size.height-40)
//        timerLabel.position = CGPoint(x: frame.midX, y: self.size.height-120)
////        timerLabel.text = "time left: 60"
//
//        timerLabel.text = "Time: \(game!.timeAllowed - game!.timeElapsed)"
////        timerLabel.text = "Time: 0s"
////        timerLabel.startWithDuration(duration: game!.timeAllowed!)
        
        //        print(frame.height)
        keyboard = Keyboard(rect: CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: frame.height/3))
        keyboard.initKeys()
        //        print(keyboard.frame.height)
        
        self.addChild(scoreLabel)
        self.addChild(welcomeLabel)
        self.addChild(pauseLabel)
        self.addChild(wordLabel)
        self.addChild(keyboard)
        self.addChild(timerLabel)
        
        // un-pause game
        if let game = game {
            game.resume()
        } else {
            print("ERROR: game could not be reset \(#line)")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case pauseLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = PauseScene(size: self.size)
                    
                    // pause game
                    if let game = game {
                        game.pause()
                    } else {
                        print("ERROR: game could not be reset")
                    }
                    
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        timerLabel.update()
    }
    
//    func update()
//    {
//        timerLabel.text = "time left: \(game!.timeAllowed - game!.timeElapsed)"
////        if ()
//    }
    
}

