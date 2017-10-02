//
//  DifficultyScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

class DifficultyScene: SKScene {
    
    var difficultyLabel : SKLabelNode!
    var easyLabel : SKLabelNode!
    var mediumLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        difficultyLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        easyLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        mediumLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        
        difficultyLabel.fontColor = UIColor.white
        easyLabel.fontColor = UIColor.green
        mediumLabel.fontColor = UIColor.yellow
        
        difficultyLabel.fontSize = 25
        easyLabel.fontSize = 20
        mediumLabel.fontSize = 20
        
        difficultyLabel.position = CGPoint(x: frame.midX, y: frame.midY+60)
        easyLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        mediumLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        
        difficultyLabel.text = "SELECT DIFFICULTY"
        easyLabel.text = "EASY"
        mediumLabel.text = "MEDIUM"
        
        self.addChild(difficultyLabel)
        self.addChild(easyLabel)
        self.addChild(mediumLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case easyLabel :
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = EasyGameScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            case mediumLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = MediumGameScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
}

