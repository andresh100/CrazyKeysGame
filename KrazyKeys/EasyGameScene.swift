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
    
    override func didMove(to view: SKView) {
        //Add Pause (Resume, Quit)
        //Add Score ()
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
        self.addChild(welcomeLabel)
    }
    
}
