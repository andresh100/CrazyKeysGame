//
//  EndScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//
import SpriteKit
import GameplayKit


class EndScene2: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var hsLabel : SKLabelNode!
    var quitLabel : SKLabelNode!
    //var nameLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.red
        welcomeLabel.fontSize = 20
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+120)
        welcomeLabel.text = "NEW HIGH SCORE"
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY+60)
        scoreLabel.text = "SCORE: \(game!.score)"
        
        hsLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        hsLabel.fontColor = UIColor.white
        hsLabel.fontSize = 20
        hsLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        hsLabel.text = "HIGH SCORES"
        
        quitLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        quitLabel.fontColor = UIColor.white
        quitLabel.fontSize = 20
        quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-120)
        quitLabel.text = "QUIT"
        
        //Still need to implement nameLabel
        //nameLabel.text = ""
        
        self.addChild(welcomeLabel)
        self.addChild(scoreLabel)
        self.addChild(hsLabel)
        self.addChild(quitLabel)
        //self.addChild(nameLabel)
        
        //Saving score
        let score = game!.score
        let userDefaults = Foundation.UserDefaults.standard
        
        let highScore1 = userDefaults.integer(forKey: "highScore1")
        let highScore2 = userDefaults.integer(forKey: "highScore2")
        let highScore3 = userDefaults.integer(forKey: "highScore3")
        let highScore4 = userDefaults.integer(forKey: "highScore4")
        let highScore5 = userDefaults.integer(forKey: "highScore5")
        
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
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case hsLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                    let scene:SKScene = HighScoreScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            case quitLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
}



