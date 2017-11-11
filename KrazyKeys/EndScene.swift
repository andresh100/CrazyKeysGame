//
//  EndScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//
import SpriteKit
import GameplayKit


class EndScene: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var quitLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.white
        welcomeLabel.fontSize = 20
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+90)
        welcomeLabel.text = "GAME OVER"
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        scoreLabel.text = "Score: \(game!.score)"
        
        quitLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        quitLabel.fontColor = UIColor.red
        quitLabel.fontSize = 20
        quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        quitLabel.text = "QUIT"
        
        self.addChild(welcomeLabel)
        self.addChild(scoreLabel)
        self.addChild(quitLabel)
        
        //Saving score
        let score = game!.score
        let userDefaults = Foundation.UserDefaults.standard
        //userDefaults.set(score, forKey: "Key")
        let highScore1 = userDefaults.integer(forKey: "highScore1")
        let highScore2 = userDefaults.integer(forKey: "highScore2")
        let highScore3 = userDefaults.integer(forKey: "highScore3")
        let highScore4 = userDefaults.integer(forKey: "highScore4")
        let highScore5 = userDefaults.integer(forKey: "highScore5")
        
        if score > highScore1 {
            userDefaults.set(score, forKey: "highScore1")
        } else if score == highScore1 || score > highScore2 {
            userDefaults.set(score, forKey: "highScore2")
        } else if score == highScore2 || score > highScore3 {
            userDefaults.set(score, forKey: "highScore3")
        } else if score == highScore3 || score > highScore4 {
            userDefaults.set(score, forKey: "highScore4")
        } else if score == highScore4 || score > highScore5 {
            userDefaults.set(score, forKey: "highScore5")
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case quitLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                    //                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
}

