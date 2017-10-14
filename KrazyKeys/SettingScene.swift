//
//  SettingScene.swift
//  KrazyKeys
//
//  Created by GG on 10/14/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

class SettingScene: SKScene{
    var doneLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        doneLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        doneLabel.fontColor = UIColor.white
        doneLabel.fontSize = 14
        doneLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        doneLabel.text = "DONE"
        
        self.addChild(doneLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case doneLabel:
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
