//
//  MediumGameScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

var previousScene = ""

class PauseScene: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var resumeLabel : SKLabelNode!
    var quitLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.white
        welcomeLabel.fontSize = 20
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+90)
        welcomeLabel.text = "GAME PAUSED"
        
        resumeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        resumeLabel.fontColor = UIColor.yellow
        resumeLabel.fontSize = 20
        resumeLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        resumeLabel.text = "RESUME"
        
        quitLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        quitLabel.fontColor = UIColor.red
        quitLabel.fontSize = 20
        quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        quitLabel.text = "QUIT"
        
        self.addChild(welcomeLabel)
        self.addChild(resumeLabel)
        self.addChild(quitLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case resumeLabel:
                if let view = view {
                    if previousScene == "EasyGameScene" {
                        let transition:SKTransition = SKTransition.fade(withDuration: 1)
                        let scene:SKScene = EasyGameScene(size: self.size)
                        self.view?.presentScene(scene, transition: transition)
                    } else if previousScene == "MediumGameScene" {
                        let transition:SKTransition = SKTransition.fade(withDuration: 1)
                        let scene:SKScene = MediumGameScene(size: self.size)
                        self.view?.presentScene(scene, transition: transition)
                    }
                }
            case quitLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
}

