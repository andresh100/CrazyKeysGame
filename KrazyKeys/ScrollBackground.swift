//
//  ScrollBackground.swift
//  KrazyKeys
//
//  Created by Andre Hansen on 11/4/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import Foundation
import SpriteKit

class ScrollBackground {
    
    var view: UIView?
    var scene: SKScene?
    var background1 = SKSpriteNode(imageNamed: "background")
    var background2 = SKSpriteNode(imageNamed: "background")
    
    init(view: UIView, scene: SKScene) {
        self.view = view
        self.scene = scene
        
        background1.anchorPoint = CGPoint(x: 0, y: 0)
        background1.position = CGPoint(x: view.frame.minX, y: view.frame.minY)
        
        background2.anchorPoint = CGPoint(x: 0, y: 0)
        background2.position = CGPoint(x: view.frame.minX, y: view.frame.minY)
        
        scene.addChild(background1)
        scene.addChild(background2)
        
        let backgroundColorAction = SKAction.colorize(with: UIColor.black, colorBlendFactor: 1.0, duration: 0)
        background1.run(backgroundColorAction)
        background2.run(backgroundColorAction)
        background1.zPosition = -100
        background2.zPosition = -100
        
        var scrollAction1: [SKAction] = []
        let snapLeft1 = SKAction.move(to: CGPoint(x: -background1.frame.width, y: view.frame.minY), duration: 0.0)
        let scrollRight1 = SKAction.move(to: CGPoint(x: view.frame.minX, y: view.frame.minY), duration: 15.0)
        scrollAction1.append(snapLeft1)
        scrollAction1.append(scrollRight1)
        
        let scrollActionSeq1 = SKAction.sequence(scrollAction1)
        background1.run(SKAction.repeatForever(scrollActionSeq1))
        
        var scrollAction2: [SKAction] = []
        let snapLeft2 = SKAction.move(to: CGPoint(x: view.frame.minX, y: view.frame.minY), duration: 0.0)
        let scrollRight2 = SKAction.move(to: CGPoint(x: background1.frame.width, y: view.frame.minY), duration: 15.0)
        scrollAction2.append(snapLeft2)
        scrollAction2.append(scrollRight2)
        
        let scrollActionSeq2 = SKAction.sequence(scrollAction2)
        background2.run(SKAction.repeatForever(scrollActionSeq2))
    }
}
