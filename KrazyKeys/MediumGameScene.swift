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
    
    var welcomeLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.white
        welcomeLabel.fontSize = 14
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        welcomeLabel.text = "MEDIUM GAME SCENE"
        self.addChild(welcomeLabel)
    }
    
}
