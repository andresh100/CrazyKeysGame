//
//  EndScene.swift
//  KrazyKeys
//
//  Created by Alissa Chiu on 10/2/17.
//  Copyright © 2017 nedink. All rights reserved.
//
import SpriteKit
import GameplayKit


class EndScene2: SKScene {
    
    var welcomeLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var hsLabel : SKLabelNode!
    var quitLabel : SKLabelNode!
    //var nameLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        scrollBg = ScrollBackground(view: self.view!, scene: self.scene!)
        
        welcomeLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        welcomeLabel.fontColor = UIColor.red
        welcomeLabel.fontSize = 20
        welcomeLabel.position = CGPoint(x: frame.midX, y: frame.midY+120)
        welcomeLabel.text = "NEW HIGH SCORE"
        
        scoreLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        scoreLabel.fontColor = UIColor.yellow
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY+60)
        scoreLabel.text = "SCORE: \(game!.score)"
        
        hsLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        hsLabel.fontColor = UIColor.white
        hsLabel.fontSize = 20
        hsLabel.position = CGPoint(x: frame.midX, y: frame.midY-60)
        hsLabel.text = "HIGH SCORES"
        
        quitLabel = SKLabelNode(fontNamed: "Fipps-Regular")
        quitLabel.fontColor = UIColor.white
        quitLabel.fontSize = 20
        quitLabel.position = CGPoint(x: frame.midX, y: frame.midY-120)
        quitLabel.text = "QUIT"
        
        //Still need to implement nameLabel
        //nameLabel.text = ""
        
        self.addChild(welcomeLabel)
        self.addChild(scoreLabel)
        self.addChild(hsLabel)
        self.addChild(quitLabel)
        //self.addChild(nameLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            switch node {
            case hsLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                    let scene:SKScene = HighScoreScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            case quitLabel:
                if let view = view {
                    let transition:SKTransition = SKTransition.push(with: SKTransitionDirection.right, duration: 1)
                    let scene:SKScene = MenuScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            default:
                return
            }
        }
    }
    
}


