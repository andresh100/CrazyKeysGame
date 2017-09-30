//
//  MenuScene.swift
//  KrazyKeys
//
//  Created by David Bryant on 9/30/17.
//  Copyright © 2017 nedink. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuScene: SKScene {
    
    
    // 1
    //    let player = SKSpriteNode(imageNamed: "Spaceship")
    //    let playButton = SKShapeNode(rectOf: CGSize(width: 610, height: 200),
    //                             cornerRadius: 25)
    var playButton = SKSpriteNode()
    let playButtonTex = SKTexture(imageNamed: "playTexture")
    
    override func didMove(to view: SKView) {
        // 2
        backgroundColor = SKColor.white
        
        playButton = SKSpriteNode(texture: playButtonTex)
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        playButton.size.height = 200
        playButton.size.width = 200
        
        addChild(playButton)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == playButton {
                if let view = view {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = GameScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
        }
    }
	
//    private var playButton : SKShapeNode?
//    private var optionsButton : SKShapeNode?
//    private var highScoreButton : SKShapeNode?
    
//    override func didMove(to view: SKView) {
//        let w = (self.size.width + self.size.height) * 0.05
//        self.playButton = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//        
//        if let playButton = self.playButton {
//            playButton.lineWidth = 2.5
//            
//            playButton.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            playButton.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
//    }
//
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.playButton?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//        
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }


}
