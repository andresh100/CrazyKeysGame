//
//  EasyGameScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

class EasyGameScene: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var pauseLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        //Add Pause (Resume, Quit) x
        //Add Score () x
        //Add Timer (Countdown 30 seg)
        //Add Random Word Label (Choose from a pool of random words)
        //Add Text input (Location where each letter will be shown when user inputs from keyboard)
        //Add random keyboard letters Locations ()
        
        backgroundColor = SKColor.black
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.white
        welcomeLabel.fontSize = 14
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        welcomeLabel.text = "EASY GAME SCENE"
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 14
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: self.size.width, y: self.size.height-40)
        scoreLabel.text = "Score: 0"
        
        pauseLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        pauseLabel.fontColor = UIColor.yellow
        pauseLabel.fontSize = 14
        pauseLabel.horizontalAlignmentMode = .left
        pauseLabel.position = CGPoint(x: 0.0, y: self.size.height-40)
        pauseLabel.text = "II"
        
        self.addChild(scoreLabel)
        self.addChild(welcomeLabel)
        self.addChild(pauseLabel)
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
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
}
