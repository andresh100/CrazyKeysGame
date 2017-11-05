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
    
    var scrollBg: ScrollBackground?
    
    override func didMove(to view: SKView) {
//        backgroundColor = SKColor.black
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        doneLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        doneLabel.fontColor = UIColor.white
        doneLabel.fontSize = 30
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
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.left, duration: 1)
//                    let transition:SKTransition = SKTransition.doorsCloseHorizontal(withDuration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
}
